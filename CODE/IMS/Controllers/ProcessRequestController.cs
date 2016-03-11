﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Mvc;
using AutoMapper;
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

            //neu la kh, se co username kh
            var customer = Constants.Test.CUSTOMER_MANHNH;
            var data = new NotificationViewModel();

            //do du lieu vao filter
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
                RequestAddServerViewModel viewmodel = new RequestAddServerViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                viewmodel.RequestCode = rCode;
                viewmodel.RequestType = rType;
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestAddServerViewModel>(request);
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    var customer = AccountBLO.Current.GetAccountByCode(viewmodel.Customer);
                    viewmodel.CustomerName = customer.Fullname;
                    viewmodel.Identification = customer.Identification;

                    //lay list servers
                    var serverCodes = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode);
                    List<ServerExtendedModel> list = new List<ServerExtendedModel>();
                    foreach (var servercode in serverCodes)
                    {
                        var server = ServerBLO.Current.GetServerByCode(servercode, Constants.StatusCode.SERVER_WAITING);
                        //lay serverattribute
                        //doing loi
                        var listAttributes = ServerAttributeBLO.Current
                            .GetServerAttributes(servercode, Constants.StatusCode.SERVERATTRIBUTE_UPDATING);
                        foreach (var attribute in listAttributes)
                        {
                            if (attribute.AttributeCode == Constants.ServerAttributeCode.PART_NUMBER)
                            {
                                server.PartNumber = attribute.AttributeValue;
                            }
                            else if (attribute.AttributeCode == Constants.ServerAttributeCode.SERIAL_NUMBER)
                            {
                                server.SerialNumber = attribute.AttributeValue;
                            }
                            else if (attribute.AttributeCode == Constants.ServerAttributeCode.MEMORY)
                            {
                                server.Memory = attribute.AttributeValue;
                            }
                        }
                        list.Add(server);
                    }
                    viewmodel.Servers = list;
                }
                var ips = IPAddressPoolBLO.Current.GetAvailableIPs();
                var listNetworkIP =
                    ips.OrderBy(x => x.NetworkIP).GroupBy(x => x.NetworkIP).Select(x => x.FirstOrDefault());
                viewmodel.NetworkIPs = listNetworkIP.Select(x => new SelectListItem
                {
                    Value = x.NetworkIP,
                    Text = "Network " + x.NetworkIP
                }).ToList();

                return View("AddServerInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.BRING_SERVER_AWAY))
            {
                //Get request
                RequestBringServerAwayViewModel viewmodel = new RequestBringServerAwayViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                viewmodel.RequestCode = rCode;
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestBringServerAwayViewModel>(request);
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    var customer = AccountBLO.Current.GetAccountByCode(viewmodel.Customer);
                    viewmodel.CustomerName = customer.Fullname;
                    viewmodel.Identification = customer.Identification;
                    //lay list servers
                    var serverCodes = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode);
                    List<ServerExtendedModel> list = new List<ServerExtendedModel>();
                    foreach (var servercode in serverCodes)
                    {
                        var server = ServerBLO.Current.GetAllServerInfo(servercode);
                        viewmodel.ReturnIpNumber = viewmodel.ReturnIpNumber + server.ServerIps.Count;
                        viewmodel.ReturnLocationNumber = viewmodel.ReturnLocationNumber + server.ServerLocation.Count;
                        list.Add(server);
                    }
                    viewmodel.ServerOfCustomer = list;
                    viewmodel.SelectedServerNumber = list.Count;
                }
                Alert("Success");
                return View("BringServerAwayInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    //Lay so luong IP muon assign
                    var reqDetail = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.Description);
                    viewmodel.IpNumber = reqDetail.NumberOfIp;
                    viewmodel.Description = reqDetail.Description;
                    //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                    var serverCode = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                    viewmodel.SelectedServer = serverCode;
                    //Lay list available ip cung vung
                    var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(serverCode);
                    if (listAvailableIps.Count > viewmodel.IpNumber)
                    {
                        //selected values
                        var randomList = IPAddressPoolBLO.Current.GetRandomIPs(listAvailableIps, viewmodel.IpNumber);
                        viewmodel.SelectedIps = randomList.Select(x => new SelectListItem
                        {
                            Value = x,
                            Text = x
                        }).ToList();
                        viewmodel.Ips = randomList;
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
                    else
                    {
                        ViewBag.Message = "Khong du so luong IP cap phat. Chi con" + listAvailableIps.Count + "Ips";
                    }
                    //select randomly from ipNumber,
                }
                return View("AssignIPInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                    var serverCode = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                    viewmodel.SelectedServer = serverCode;
                    //lay list ips muon change
                    var returningIps = ServerIPBLO.Current.GetIpByStatus(serverCode, Constants.StatusCode.SERVERIP_CHANGING);
                    viewmodel.ReturningIps = returningIps;
                    //Lay so luong IP muon change, tam thoi fix cung
                    viewmodel.IpNumber = returningIps.Count;
                    //Lay list available ip cung vung
                    var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(serverCode);
                    viewmodel.CountAvailableIps = listAvailableIps.Count;
                    if (listAvailableIps.Count > viewmodel.IpNumber)
                    {
                        //cho hien thi multiple list, ko bao gom randomList
                        for (int i = 0; i < listAvailableIps.Count; i++)
                        {
                            for (int j = 0; j < returningIps.Count; j++)
                            {
                                var item = listAvailableIps[i];
                                if (item.IPAddress.Equals(returningIps[j]))
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
                    else
                    {
                        ViewBag.Message = "Khong du so luong IP cap phat. Chi con" + listAvailableIps.Count + "Ips";
                    }
                    //select randomly from ipNumber,
                }
                return View("ChangeIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestDAO.Current.Query(x => x.RequestCode == rCode).FirstOrDefault();
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    //get servercode = requestcode
                    var servercode =
                        LogChangedContentBLO.Current.GetServerCodeByRequestCode(request.RequestCode).FirstOrDefault();
                    viewmodel.SelectedServer = servercode;
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    var customer = AccountBLO.Current.GetAccountByCode(viewmodel.Customer);
                    viewmodel.CustomerName = customer.Fullname;
                    //List returning IPs
                    viewmodel.Ips = ServerIPBLO.Current.GetIpByStatus(viewmodel.SelectedServer,
                        Constants.StatusCode.SERVERIP_RETURNING);
                }
                return View("ReturnIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
            {
                RequestRentRackViewModel viewmodel = new RequestRentRackViewModel();
                var request = RequestDAO.Current.Query(x => x.RequestCode == rCode).FirstOrDefault();
                // Phan thuc hien cua staff -->  chọn số lượng rack còn trống
                if (request != null)
                {
                    //Mapping
                    viewmodel = Mapper.Map<Request, RequestRentRackViewModel>(request);
                    //Lay so luong rack muon thue
                    var desc = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.Description);
                    viewmodel.RackNumbers = desc.NumberOfRack;
                    viewmodel.Description = desc.Description;
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    var customer = AccountBLO.Current.GetAccountByCode(viewmodel.Customer);
                    viewmodel.CustomerName = customer.Fullname;
                    //list cot rows
                    var rows = RackBLO.Current.GetAllRowsOfRack();
                    var listRacks = new List<RackExtendedModel>();
                    foreach (var item in rows)
                    {
                        RackExtendedModel model = new RackExtendedModel();
                        model.RowName = item;
                        model.RacksOfRow = RackBLO.Current.GetRackByRow(item);
                        listRacks.Add(model);

                    }
                    viewmodel.listRackByRows = listRacks;
                    //Get available racks
                    var listrack = RackDAO.Current.Query(x => x.StatusCode == Constants.StatusCode.RACK_AVAILABLE);
                    //Tùy vào rack number mà số lượng rack staff được chọn sẽ tương ứng
                    if (listrack.Count > 0)
                    {
                        var list = listrack.Select(x => new SelectListItem
                        {
                            Value = x.RackCode,
                            Text = x.RackName
                        }).ToList();
                        //DOING: van chua multi-select duoc
                        viewmodel.AvailableRacks = new MultiSelectList(list, "Value", "Text", null);
                    }
                }
                //Chuyen IsViewed = true
                return View("RentRackInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
            {
                RequestReturnRackViewModel viewmodel = new RequestReturnRackViewModel();
                //get request
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                //lay rack dang o trang thai returning cua khach hang cu the
                var rackOfCustomer = RackOfCustomerBLO.Current.GetRacksOfCustomer(request.Customer,
                    Constants.StatusCode.RACKOFCUSTOMER_RETURNING);
                viewmodel = Mapper.Map<Request, RequestReturnRackViewModel>(request);
                viewmodel.RackOfCustomer = rackOfCustomer.Select(x => new SelectListItem
                {
                    Value = x.RackName,
                    Text = x.RackCode
                }).ToList();
                viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                var customer = AccountBLO.Current.GetAccountByCode(viewmodel.Customer);
                viewmodel.CustomerName = customer.Fullname;
                return View("ReturnRackInfo", viewmodel);
            }
            return RedirectToAction("ListNotifications", "Request");
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(RequestRentRackViewModel viewmodel)
        {
            var listSelectedRacks = viewmodel.listRackByRows;
            for (int i = 0; i < listSelectedRacks.Count; i++)
            {
                if (listSelectedRacks[i].RacksOfRow != null)
                {
                    for (int j = 0; j < listSelectedRacks[i].RacksOfRow.Count; j++)
                    {
                        var rack = listSelectedRacks[i].RacksOfRow[j];
                        if (rack.Checked)
                        {
                            //add and log rackOfCustomer
                            RackOfCustomerBLO.Current.AddRackOfCustomerANDLog(viewmodel.RequestCode, rack.RackCode,
                                Constants.TypeOfLog.LOG_RENT_RACK, Constants.Test.CUSTOMER_MANHNH, Constants.Test.STAFF_NHI);
                            //update and log Rack
                            RackBLO.Current.UpdateRackANDLog(viewmodel.RequestCode, rack.RackCode, Constants.TypeOfLog.LOG_RENT_RACK,
                                Constants.Test.CUSTOMER_MANHNH, Constants.Test.STAFF_NHI, Constants.StatusCode.RACK_RENTED);
                        }
                    }
                }
            }
<<<<<<< HEAD
            //Change request status
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_RENT_RACK, Constants.StatusCode.REQUEST_DONE, viewmodel.StaffCode);
            //Add Log Request
            LogChangedContent logRequest = new LogChangedContent
            {
                RequestCode = viewmodel.RequestCode,
                TypeOfLog = Constants.TypeOfLog.LOG_RENT_RACK,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = viewmodel.RequestCode,
                ObjectStatus = Constants.StatusCode.REQUEST_DONE,
                Staff = viewmodel.StaffCode
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
=======
            //add request and log
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                Constants.StatusCode.REQUEST_DONE, viewmodel.StaffCode);

            Alert(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
>>>>>>> c9f59d78a30cdf8acd2f20ee4c81aa2a5422ca33
            return RedirectToAction("ListNotifications", "Request");
        }

        [HttpPost]
        public ActionResult ProcessRequestReturnRack(RequestReturnRackViewModel viewmodel)
        {
            //update status rackofcustomer
            foreach (var item in viewmodel.RackOfCustomer)
            {
                //update and log RackOfCustomer
                RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(viewmodel.RequestCode, item.Value,
                    Constants.TypeOfLog.LOG_RETURN_RACK, Constants.Test.CUSTOMER_MANHNH, Constants.Test.STAFF_NHI,
                    Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_OLD);
                // update and log Rack
                RackBLO.Current.UpdateRackANDLog(viewmodel.RequestCode, item.Value,
                    Constants.TypeOfLog.LOG_RETURN_RACK, Constants.Test.CUSTOMER_MANHNH, Constants.Test.STAFF_NHI,
                    Constants.StatusCode.RACK_AVAILABLE);
            }
            //add and log request
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                Constants.StatusCode.REQUEST_DONE, Constants.Test.STAFF_NHI);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("ListNotifications", "Request");

        }

        [HttpPost]
        public ActionResult ProcessRequestAddServer(RequestAddServerViewModel viewmodel)
        {
            var listServer = viewmodel.Servers;
            if (viewmodel.Button == "Export")
            {
                Account acc = AccountDAO.Current.Query(x => x.Username == viewmodel.Customer).FirstOrDefault();
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
                return RedirectToAction("Detais", new { rType = viewmodel.RequestType, rCode = viewmodel.RequestCode });
            }
            else
            {
                foreach (var server in listServer)
                {
                    //update and log server
                    ServerBLO.Current.UpdateServerStatus(viewmodel.RequestCode, server.ServerCode,
                        Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_RUNNING, Constants.Test.STAFF_NHI);
                    ServerAttributeBLO.Current.UpdateServerAttributeStatus(server.ServerCode, Constants.StatusCode.SERVERATTRIBUTE_NEW);
                    //DOING
                    //luu IP address
                    //Luu location
                }
                //Add and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                    Constants.StatusCode.REQUEST_DONE, Constants.Test.STAFF_NHI);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
                //return RedirectToAction("ListNotifications", "Request");
                return View("AddServerInfo", viewmodel);
            }

        }

        [HttpPost]
        public ActionResult ProcessRequestBringServerAway(RequestBringServerAwayViewModel viewmodel)
        {
            var listServer = viewmodel.ServerOfCustomer;
            foreach (var server in listServer)
            {
                //update and log serverip
                var serverips = ServerIPBLO.Current.GetIpByStatus(server.ServerCode, Constants.StatusCode.SERVERIP_RETURNING);
                foreach (var ip in serverips)
                {
                    //update and log status cua IP o IPAddresspool
                    IPAddressPoolBLO.Current.UpdateStatusIpANDLog(viewmodel.RequestCode, server.ServerCode, ip,
                        Constants.StatusCode.IP_AVAILABLE, Constants.TypeOfLog.LOG_RETURN_IP, Constants.Test.STAFF_NHI);
                    // update and log statuscode cua bang serverIP
                    ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestCode, server.ServerCode, ip,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_OLD, Constants.Test.STAFF_NHI);
                }

                //update and log server
                ServerBLO.Current.UpdateServerStatus(viewmodel.RequestCode, server.ServerCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_DEACTIVATE,
                    Constants.Test.STAFF_NHI);
                ServerAttributeBLO.Current.UpdateServerAttributeStatus(server.ServerCode,
                    Constants.StatusCode.SERVERATTRIBUTE_OLD);

                //add and log request
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.REQUEST_DONE, Constants.Test.STAFF_NHI);

                //giai phong location, co can log ko?
                LocationBLO.Current.SetLocationAvailable(server.ServerCode);

                //change serverip status
                //ServerIPBLO.Current.ReturnAllIpOfServer(server.ServerCode);
                //giai phong ip
                //IPAddressPoolBLO.Current.SetIpAvailable(server.ServerCode);
            }
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("ListNotifications", "Request");

        }

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(RequestIPViewModel viewmodel)
        {
            if (Request.Form["Approve"] != null)
            {
                foreach (var item in viewmodel.Ips.ToList())
                {
                    //add and log serverip
                    ServerIPBLO.Current.AddServerIpAndLog(viewmodel.RequestCode, viewmodel.SelectedServer, item,
                        Constants.TypeOfLog.LOG_ASSIGN_IP, Constants.StatusCode.SERVERIP_CURRENT, Constants.Test.STAFF_NHI);
                    //update and log ipaddress
                    IPAddressPoolBLO.Current.UpdateStatusIpANDLog(viewmodel.RequestCode, viewmodel.SelectedServer, item,
                        Constants.StatusCode.IP_USED, Constants.TypeOfLog.LOG_ASSIGN_IP, Constants.Test.STAFF_NHI);
                }
                //Add Log and update request status
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Constants.StatusCode.REQUEST_DONE, Constants.Test.STAFF_NHI);
                return RedirectToAction("ListNotifications", "Request");

            }
            else if (Request.Form["Reject"] != null)
            {
                //O giao dien hien popup Yes/No reject

                //Change request status 
                //RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_REJECTED);

                //Add Log Request
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Object = Constants.Object.OBJECT_REQUEST,
                    ChangedValueOfObject = viewmodel.RequestCode,
                    ObjectStatus = Constants.StatusCode.REQUEST_REJECTED,
                    Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logRequest);

                //notification cho khach hang biet
                //DOING


                return RedirectToAction("Index", "Home");
            }
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("ListNotifications", "Request");

        }

        [HttpPost]
        public ActionResult ProcessRequestChangeIp(RequestIPViewModel viewmodel)
        {
            string last = viewmodel.Ips[0];
            List<string> ips = last.Split(',').ToList<string>();
            ips.RemoveAt(0);
            ips.Reverse();
            //update and log ServerIP and IpAddress
            RequestBLO.Current.UpdateChangeIP(viewmodel.ReturningIps, ips,
                viewmodel.SelectedServer, viewmodel.RequestCode, viewmodel.StatusCode);

            //update and log request
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                Constants.StatusCode.REQUEST_DONE, Constants.Test.STAFF_NHI);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("ListNotifications", "Request");

        }

        [HttpPost]
        public ActionResult ProcessRequesReturnIp(RequestIPViewModel viewmodel)
        {
            foreach (var item in viewmodel.Ips)
            {
                //update and log status cua IP o IPAddresspool
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(viewmodel.RequestCode, viewmodel.SelectedServer, item,
                    Constants.StatusCode.IP_AVAILABLE, Constants.TypeOfLog.LOG_RETURN_IP, Constants.Test.STAFF_NHI);
                // update and log statuscode cua bang serverIP
                ServerIPBLO.Current.UpdateServerIpANDLog(viewmodel.RequestCode, viewmodel.SelectedServer, item.ToString(),
                    Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_OLD, Constants.Test.STAFF_NHI);
            }
            //Add Log and update request status
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                Constants.StatusCode.REQUEST_DONE, Constants.Test.STAFF_NHI);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("ListNotifications", "Request");

        }

        [HttpPost]
        public ActionResult AssignIP(RequestAddServerViewModel ivm)
        {
            if (ivm.NewIP == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            IPAddressPoolBLO.Current.UpdateIP(ivm.ServerCode, ivm.NewIP, ivm.RequestCode);

            return RedirectToAction("Detais", new { rType = ivm.RequestType, rCode = ivm.RequestCode });
        }
    }

}
