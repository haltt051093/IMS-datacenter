using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using Microsoft.Office.Interop.Word;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    public class ProcessRequestController : CoreController
    {
        public ActionResult Index(string code)
        {
            var role = GetCurrentUserRole();
            var customer = GetCurrentUserName();

            var data = new NotificationViewModel();
            data.FilterByRequestType = RequestTypeBLO.Current.GetAll()
                .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
                .ToList();
            data.FilterByStatus = StatusBLO.Current.GetStatusByObject(Constants.Object.OBJECT_REQUEST)
                .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                .ToList();

            data.NotificationList = RequestBLO.Current.ListNotification(role, customer);
            return View(data);
        }

        [HttpGet]
        public ActionResult Detais(string rType, string rCode)
        {
            if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
            {
                //Get request
                ProcessRequestAddServerViewModel viewmodel = new ProcessRequestAddServerViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                // assignee la dropdownlist
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING ||
                    viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_WAITING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var shifthead = GetCurrentUserName();
                    var account = AccountBLO.Current.GetAccountByCode(shifthead);
                    viewmodel.RequestInfo.StaffCode = account.Username;
                    viewmodel.RequestInfo.StaffName = account.Fullname;
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);
                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                //lay list servers
                var serverCodes = LogChangedContentBLO.Current.GetAddingServers(rCode);
                List<ServerExtendedModel> list = new List<ServerExtendedModel>();
                foreach (var servercode in serverCodes)
                {
                    var server = ServerBLO.Current.GetAllServerInfo(servercode);
                    list.Add(server);
                }
                viewmodel.Servers = list;
                return View("AddServerInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.BRING_SERVER_AWAY))
            {
                ProcessRequestBringServerAwayViewModel viewmodel = new ProcessRequestBringServerAwayViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                // assignee la dropdownlist
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING ||
                    viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_WAITING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var shifthead = GetCurrentUserName();
                    var account = AccountBLO.Current.GetAccountByCode(shifthead);
                    viewmodel.RequestInfo.StaffCode = account.Username;
                    viewmodel.RequestInfo.StaffName = account.Fullname;
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);
                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                //main info
                var returnValues = LogChangedContentBLO.Current.RequestDetailsBringServerAway(rCode);
                viewmodel.ReturnIpNumber = returnValues.ReturnIpNumber;
                viewmodel.ReturnLocationNumber = returnValues.ReturnLocationNumber;
                viewmodel.SelectedServerNumber = returnValues.ReturnServerNumber;
                viewmodel.ServerOfCustomer = returnValues.Servers;
                return View("BringServerAwayInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                ProcessRequestAssignIPViewModel viewmodel = new ProcessRequestAssignIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                //Lay so luong IP muon assign
                var reqDetail = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.RequestInfo.Description);
                viewmodel.NumberOfIP = reqDetail.NumberOfIp;
                viewmodel.RequestInfo.Description = reqDetail.Description;
                //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                // assignee la dropdownlist
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);

                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
                {
                    //Lay list available ip cung vung
                    var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(viewmodel.SelectedServer);
                    if (listAvailableIps.Count > viewmodel.NumberOfIP)
                    {
                        //selected values
                        var randomList = IPAddressPoolBLO.Current.GetRandomIPs(listAvailableIps, viewmodel.NumberOfIP);
                        viewmodel.SelectedIps = randomList.Select(x => new SelectListItem
                        {
                            Value = x,
                            Text = x
                        }).ToList();
                        //cho hien thi multiple list, ko bao gom randomList
                        for (int i = 0; i < listAvailableIps.Count; i++)
                        {
                            for (int j = 0; j < randomList.Count; j++)
                            {
                                var item = listAvailableIps[i];
                                if (item.IPAddress.Equals(randomList[j]))
                                {
                                    listAvailableIps.Remove(item);
                                }
                            }
                        }
                        viewmodel.IpSelectListItems = listAvailableIps.Select(x => new SelectListItem
                        {
                            Value = x.IPAddress,
                            Text = x.IPAddress
                        }).ToList();
                    }
                }
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.IPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode,
                        Constants.Object.OBJECT_IP, Constants.StatusCode.IP_USED);
                }
                return View("AssignIPInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
            {
                ProcessRequestChangeIPViewModel viewmodel = new ProcessRequestChangeIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                //lay ip muon change
                viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_SERVERIP,
                    Constants.StatusCode.SERVERIP_CHANGING);
                //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                // assignee la dropdownlist
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);
                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
                {
                    //Lay list available ip cung vung
                    var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(viewmodel.SelectedServer);
                    viewmodel.NewIPsOptions = listAvailableIps.Select(x => new SelectListItem
                    {
                        Value = x.IPAddress,
                        Text = x.IPAddress
                    }).ToList();
                }
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_IP,
                    Constants.StatusCode.IP_AVAILABLE);
                    viewmodel.NewIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_IP,
                    Constants.StatusCode.IP_USED);
                }
                return View("ChangeIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                ProcessRequestReturnIPViewModel viewmodel = new ProcessRequestReturnIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                //get servercode = requestcode
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                //List returning IPs
                viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_SERVERIP,
                    Constants.StatusCode.SERVERIP_RETURNING);
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);
                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                return View("ReturnIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
            {
                ProcessRequestRentRackViewModel viewmodel = new ProcessRequestRentRackViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                //Lay so luong rack muon thue
                var desc = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.RequestInfo.Description);
                viewmodel.RackNumbers = desc.NumberOfRack;
                viewmodel.RequestInfo.Description = desc.Description;
                // assignee la dropdownlist
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);
                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.RentedRacks = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode,
                        Constants.Object.OBJECT_RACK, Constants.StatusCode.RACK_RENTED);
                }
                else
                {
                    //list cot rows
                    var rows = RackBLO.Current.GetAllRowsOfRack();
                    var listRacks = rows.SelectMany(item => RackBLO.Current.GetRackByRow(item)).ToList();
                    viewmodel.listRackByRows = listRacks;
                    //list row
                    viewmodel.ListRows = rows.Select(x => new SelectListItem { Value = x, Text = x }).ToList();
                }
                ViewBag.Message = "Request Deny";
                return View("RentRackInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
            {
                ProcessRequestReturnRackViewModel viewmodel = new ProcessRequestReturnRackViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //customer info
                viewmodel.CustomerInfo = AccountBLO.Current.GeCustomerInfo(viewmodel.RequestInfo.Customer);
                //Lay so luong rack muon return
                var listRacks = LogChangedContentBLO.Current.RequestDetailsReturnRack(rCode);
                viewmodel.SelectedRacks = listRacks.listRacks;
                // assignee la dropdownlist
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PENDING)
                {
                    var group = GetCurrentUserGroup();
                    var listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                    viewmodel.StaffCodeOptions = listStaff
                        .Select(x => new SelectListItem
                        {
                            Value = x.Username,
                            Text = x.Fullname,
                            Selected = x.Role == Constants.Role.SHIFT_HEAD
                        })
                        .ToList();
                }
                else
                {
                    var staff = RequestBLO.Current.GetAssignee(rCode);
                    viewmodel.RequestInfo.StaffCode = staff.Username;
                    viewmodel.RequestInfo.StaffName = staff.Fullname;
                }
                return View("ReturnRackInfo", viewmodel);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                //assign
                if (shifthead != viewmodel.RequestInfo.StaffCode)
                {
                    TaskBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.StaffCode);
                }
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_RENT_RACK, Constants.StatusCode.REQUEST_PROCESSING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RENT_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var listSelectedRacks = viewmodel.listRackByRows;
                foreach (var item in listSelectedRacks)
                {
                    if (item.Checked)
                    {
                        //add and log rackOfCustomer
                        RackOfCustomerBLO.Current.AddRackOfCustomerANDLog(viewmodel.RequestInfo.RequestCode, item.RackCode,
                            item.RackName, Constants.TypeOfLog.LOG_RENT_RACK, viewmodel.CustomerInfo.Customer, viewmodel.RequestInfo.StaffCode);
                        //update and log Rack
                        RackBLO.Current.UpdateRackANDLog(viewmodel.RequestInfo.RequestCode, item.RackCode, item.RackName,
                            Constants.TypeOfLog.LOG_RENT_RACK, viewmodel.CustomerInfo.Customer, viewmodel.RequestInfo.StaffCode, Constants.StatusCode.RACK_RENTED);
                    }
                }
                //Change request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                    Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.StaffCode, null);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                //Change request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.StaffCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult ProcessRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                //assign
                if (shifthead != viewmodel.RequestInfo.StaffCode)
                {
                    TaskBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.StaffCode);
                }
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_RETURN_RACK, Constants.StatusCode.REQUEST_PROCESSING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                //update status rackofcustomer
                foreach (var item in viewmodel.SelectedRacks)
                {
                    var rack = RackBLO.Current.GetByName(new Rack { RackName = item });
                    //update and log RackOfCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(viewmodel.RequestInfo.RequestCode, rack.RackCode,
                        Constants.TypeOfLog.LOG_RETURN_RACK, viewmodel.CustomerInfo.Customer, viewmodel.RequestInfo.StaffCode,
                        Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_OLD, item);
                    // update and log Rack
                    RackBLO.Current.UpdateRackANDLog(viewmodel.RequestInfo.RequestCode, rack.RackCode, null,
                        Constants.TypeOfLog.LOG_RETURN_RACK, viewmodel.CustomerInfo.Customer, viewmodel.RequestInfo.StaffCode,
                        Constants.StatusCode.RACK_AVAILABLE);
                }
                //add and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.StaffCode, null);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                //Lay so luong rack muon return
                var listRacks = LogChangedContentBLO.Current.RequestDetailsReturnRack(viewmodel.RequestInfo.RequestCode);
                foreach (var item in listRacks.listRacks)
                {
                    var rack = RackBLO.Current.GetByName(new Rack { RackName = item });
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(viewmodel.RequestInfo.RequestCode,
                        rack.RackCode, Constants.TypeOfLog.LOG_RETURN_RACK, viewmodel.CustomerInfo.Customer, null
                        , Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT, item);
                }
                //add and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.StaffCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");

        }

        [HttpPost]
        public ActionResult ProcessRequestAddServer(ProcessRequestAddServerViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.REQUEST_WAITING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var listServer = viewmodel.Servers;
                if (viewmodel.Button == "Export")
                {
                    Account acc = AccountDAO.Current.Query(x => x.Username == viewmodel.CustomerInfo.Customer).FirstOrDefault();
                    foreach (var item in listServer)
                    {
                        IPAddressPool ip =
                            IPAddressPoolDAO.Current.Query(x => x.IPAddress == item.DefaultIP).FirstOrDefault();
                        System.Object oMissing = System.Reflection.Missing.Value;

                        System.Object oTemplatePath = "E:/ProcedureOfDatacenter.dotx";


                        Application wordApp = new Application();
                        Document wordDoc = new Document();

                        wordDoc = wordApp.Documents.Add(ref oTemplatePath, ref oMissing, ref oMissing, ref oMissing);

                        foreach (Field myMergeField in wordDoc.Fields)
                        {
                            Range rngFieldCode = myMergeField.Code;

                            String fieldText = rngFieldCode.Text;
                            if (fieldText.StartsWith(" MERGEFIELD"))
                            {
                                Int32 endMerge = fieldText.IndexOf("\\");

                                Int32 fieldNameLength = fieldText.Length - endMerge;

                                String fieldName = fieldText.Substring(11, endMerge - 11);

                                fieldName = fieldName.Trim();

                                if (fieldName == "PartA")
                                {

                                    myMergeField.Select();

                                    wordApp.Selection.TypeText(acc.Fullname);

                                }
                                if (fieldName == "Representative")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(acc.Username);
                                }
                                if (fieldName == "Address")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(acc.Address);
                                }
                                if (fieldName == "Tel")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(acc.Phone);
                                }
                                if (fieldName == "Model")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(item.Model);
                                }
                                if (fieldName == "Memory")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(item.Memory);
                                }
                                if (fieldName == "PartNumber")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(item.PartNumber);
                                }
                                if (fieldName == "SerialNumber")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(item.SerialNumber);
                                }
                                if (fieldName == "IPAddress")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(item.DefaultIP);
                                }
                                if (fieldName == "SubnetMask")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(ip.Subnetmask);
                                }
                                if (fieldName == "Gateway")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(ip.Gateway);
                                }
                                if (fieldName == "Bandwidth")
                                {
                                    myMergeField.Select();
                                    wordApp.Selection.TypeText(item.Bandwidth);
                                }
                            }
                        }
                        var name = item.ServerCode + ".doc";
                        wordDoc.SaveAs(name);
                        wordApp.Documents.Open(name);
                        wordApp.Application.Quit();
                    }
                    Success("Export Procedure Successfully!");
                    return RedirectToAction("Detais", new { rType = viewmodel.RequestInfo.RequestType, rCode = viewmodel.RequestInfo.RequestCode });
                }
                else
                {
                    foreach (var server in listServer)
                    {
                        //update and log server
                        ServerBLO.Current.UpdateServerStatus(viewmodel.RequestInfo.RequestCode, server.ServerCode,
                            Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_RUNNING, viewmodel.RequestInfo.StaffCode);
                        //DOING
                        //luu IP address
                        //Luu location
                    }
                    //Add and log request
                    RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                        Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.StaffCode, null);
                    Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
                }
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var serverCodes = LogChangedContentBLO.Current.GetServerCodeByRequestCode(viewmodel.RequestInfo.RequestCode);
                foreach (var server in serverCodes)
                {
                    //update and log server
                    ServerBLO.Current.UpdateServerStatus(viewmodel.RequestInfo.RequestCode, server,
                        Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_DEACTIVATE, viewmodel.RequestInfo.StaffCode);
                }
                //Add and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.StaffCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult ProcessRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.REQUEST_WAITING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var listServer = viewmodel.ServerOfCustomer;
                foreach (var server in listServer)
                {
                    //update and log serverip
                    var serverips = ServerIPBLO.Current.GetIpByStatus(server.ServerCode, Constants.StatusCode.SERVERIP_RETURNING);
                    foreach (var ip in serverips)
                    {
                        //update and log status cua IP o IPAddresspool
                        IPAddressPoolBLO.Current.UpdateStatusIpANDLog(viewmodel.RequestInfo.RequestCode, server.ServerCode, ip,
                            Constants.StatusCode.IP_AVAILABLE, Constants.TypeOfLog.LOG_RETURN_IP, viewmodel.RequestInfo.StaffCode);
                        // update and log statuscode cua bang serverIP
                        ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestInfo.RequestCode, server.ServerCode, ip,
                            Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_OLD, viewmodel.RequestInfo.StaffCode);
                    }
                    //update and log server
                    ServerBLO.Current.UpdateServerStatus(viewmodel.RequestInfo.RequestCode, server.ServerCode,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_DEACTIVATE,
                        viewmodel.RequestInfo.StaffCode);
                    //add and log request
                    RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.StaffCode, null);

                    //giai phong location, co can log ko?
                    LocationBLO.Current.SetLocationAvailable(server.ServerCode);

                    //DOING   giai phong ip
                    Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
                }
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var listServer = viewmodel.ServerOfCustomer;
                foreach (var server in listServer)
                {
                    //update and log serverip
                    var serverips = ServerIPBLO.Current.GetIpByStatus(server.ServerCode,
                        Constants.StatusCode.SERVERIP_RETURNING);
                    foreach (var ip in serverips)
                    {
                        // update and log statuscode cua bang serverIP
                        ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestInfo.RequestCode, server.ServerCode, ip,
                            Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT, viewmodel.RequestInfo.StaffCode);
                    }
                    //update and log server
                    ServerBLO.Current.UpdateServerStatus(viewmodel.RequestInfo.RequestCode, server.ServerCode,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_RUNNING,
                        viewmodel.RequestInfo.StaffCode);
                }
                //Add and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.StaffCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                //assign
                if (shifthead != viewmodel.RequestInfo.StaffCode)
                {
                    TaskBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.StaffCode);
                }
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_ASSIGN_IP, Constants.StatusCode.REQUEST_PROCESSING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ASSIGN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                foreach (var item in viewmodel.IPs.ToList())
                {
                    //add and log serverip
                    ServerIPBLO.Current.AddServerIpAndLog(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedServer, item,
                        Constants.TypeOfLog.LOG_ASSIGN_IP, Constants.StatusCode.SERVERIP_CURRENT, viewmodel.RequestInfo.StaffCode);
                    //update and log ipaddress
                    IPAddressPoolBLO.Current.UpdateStatusIpANDLog(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedServer, item,
                        Constants.StatusCode.IP_USED, Constants.TypeOfLog.LOG_ASSIGN_IP, viewmodel.RequestInfo.StaffCode);
                }
                //Add Log and update request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.RequestCode, null);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                //Add Log and update request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult ProcessRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                //assign
                if (shifthead != viewmodel.RequestInfo.StaffCode)
                {
                    TaskBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.StaffCode);
                }
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.REQUEST_PROCESSING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.CHANGE_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                //update and log ServerIP and IpAddress
                RequestBLO.Current.UpdateChangeIP(viewmodel.ReturningIPs, viewmodel.NewIPs,
                    viewmodel.SelectedServer, viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.StatusCode);
                //update and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                    Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.StaffCode, null);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                foreach (var item in viewmodel.ReturningIPs)
                {
                    ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedServer, item,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT, viewmodel.RequestInfo.StaffCode);
                }
                //update and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.StaffCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult ProcessRequesReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                //assign
                if (shifthead != viewmodel.RequestInfo.StaffCode)
                {
                    TaskBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.StaffCode);
                }
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.REQUEST_PROCESSING, viewmodel.RequestInfo.StaffCode, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                foreach (var item in viewmodel.ReturningIPs)
                {
                    //update and log status cua IP o IPAddresspool
                    IPAddressPoolBLO.Current.UpdateStatusIpANDLog(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedServer, item,
                        Constants.StatusCode.IP_AVAILABLE, Constants.TypeOfLog.LOG_RETURN_IP, viewmodel.RequestInfo.StaffCode);
                    // update and log statuscode cua bang serverIP
                    ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedServer, item.ToString(),
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_OLD, viewmodel.RequestInfo.StaffCode);
                }
                //Add Log and update request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                    Constants.StatusCode.REQUEST_DONE, null, viewmodel.RequestInfo.StaffCode, null);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                foreach (var item in viewmodel.ReturningIPs)
                {
                    // update and log statuscode cua bang serverIP
                    ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedServer, item.ToString(),
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT, viewmodel.RequestInfo.StaffCode);
                }
                //Add Log and update request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                    Constants.StatusCode.REQUEST_REJECTED, null, viewmodel.RequestInfo.StaffCode, viewmodel.RequestInfo.RejectReason);
            }
            return RedirectToAction("Index", "Notification");
        }
    }

}
