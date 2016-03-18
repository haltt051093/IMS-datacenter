﻿using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using IMS.Services;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    public class RequestController : CoreController
    {
        [Authorize]
        public ActionResult Index()
        {
            var data = new RequestIndexViewModel();
            var role = GetCurrentUserRole();
            var username = GetCurrentUserName();
            if (role == Constants.Role.CUSTOMER)
            {
                var request = LogChangedContentBLO.Current.GetRequestOfCustomer(username);
                data.Requests = request;
            }
            else
            {
                var request = LogChangedContentBLO.Current.GetAllRequest();
                data.Requests = request;
            }

            data.FilterByRequestType = TypeOfLogBLO.Current
                .GetLogTypeOfRequest()
                .Select(x => new SelectListItem { Value = x.TypeCode, Text = x.TypeName })
                .ToList();
            data.FilterByStatus = StatusBLO.Current
                .GetStatusByObject(Constants.Object.OBJECT_REQUEST)
                .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                .ToList();
            data.FilterByPeriodOfTime = new List<SelectListItem>
            {
                new SelectListItem() {Value = "0", Text = "Today", Selected = true },
                new SelectListItem() {Value = "7", Text = "One Week"},
                new SelectListItem() {Value = "30", Text = "One Month"},
                new SelectListItem() {Value = "99999", Text = "All"}
            };
            return View(data);
        }

        [Roles(Constants.Role.CUSTOMER)]
        #region Create Request
        public ActionResult Create(RequestCreateViewModel q)
        {
            var requestTypeCode = q.Type;
            if (!string.IsNullOrEmpty(requestTypeCode))
            {
                if (requestTypeCode == Constants.RequestTypeCode.ADD_SERVER)
                {
                    var data = new RequestAddServerViewModel();
                    data.Servers = new List<ServerExtendedModel>();
                    if (Session[Constants.Session.REQUEST_CODE] == null)
                    {
                        var requestCode = RequestBLO.Current.GenerateCode();
                        Session[Constants.Session.REQUEST_CODE] = requestCode;
                    }
                    var rCode = Session[Constants.Session.REQUEST_CODE].ToString();
                    var serverInfos = TempRequestBLO.Current.GetByRequestCode(rCode);
                    foreach (var serverInfo in serverInfos)
                    {
                        var server = JsonConvert.DeserializeObject<ServerExtendedModel>(serverInfo.Data);
                        server.TempCode = serverInfo.TempCode;
                        data.Servers.Add(server);
                    }
                    data.ServerSizes = new int[] { 1, 2, 4 }
                        .Select(x => new SelectListItem { Value = x.ToString(), Text = x.ToString() })
                        .ToList();
                    return View("AddServer", data);

                }
                if (requestTypeCode == Constants.RequestTypeCode.BRING_SERVER_AWAY)
                {
                    var customer = GetCurrentUserName();
                    var data = new RequestBringServerAwayViewModel();
                    //lay server cua customer
                    var serverOfCustomer = ServerBLO.Current.GetServersOfCustomerByStatus(customer, Constants.StatusCode.SERVER_RUNNING);
                    if (serverOfCustomer.Count > 0)
                    {
                        //Muon hien thi number of server trong rack tuy theo viec lua chon dropdownlist
                        data.ServerNumber = serverOfCustomer.Count();
                        //rack cua server, select all va list cua rack, neu ko co thi ko hien
                        var rackOfCustomer = RackOfCustomerBLO.Current.GetRacksOfCustomer(customer,
                            Constants.StatusCode.RACKOFCUSTOMER_CURRENT);
                        if (rackOfCustomer.Count > 0)
                        {
                            if (q.RackCode != null)
                            {
                                var list = new List<ServerExtendedModel>();
                                foreach (var server in serverOfCustomer)
                                {
                                    server.Checked = true;
                                    list.Add(server);
                                }
                                data.ServerOfCustomer = list;
                                data.RackOfCustomer = rackOfCustomer
                                .Select(x => new SelectListItem { Value = x.RackCode, Text = x.RackName, Selected = x.RackCode == q.RackCode })
                                .ToList();
                            }
                            else
                            {
                                data.ServerOfCustomer = serverOfCustomer;
                                data.RackOfCustomer = rackOfCustomer
                                .Select(x => new SelectListItem { Value = x.RackCode, Text = x.RackName })
                                .ToList();
                            }
                        }
                    }
                    return View("BringServerAway", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.ASSIGN_IP)
                {
                    var customer = GetCurrentUserName();
                    var data = new RequestAssignIPViewModel();
                    var listNumbers = new List<string>();
                    for (var i = 1; i < 11; i++)
                    {
                        listNumbers.Add(i.ToString());
                    }
                    data.NumberOfIPOptions = listNumbers
                        .Select(x => new SelectListItem { Value = x, Text = x })
                        .ToList();
                    var listServers = ServerBLO.Current.GetServersOfCustomerByStatus(customer, Constants.StatusCode.SERVER_RUNNING);
                    data.ServerOptions = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.ServerDefaultIP })
                        .ToList();
                    return View("AssignIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.CHANGE_IP)
                {
                    var customer = GetCurrentUserName();
                    //co the change duoc nhieu IP--> bo sung t
                    var data = new RequestChangeIPViewModel();
                    var listServers = ServerBLO.Current.GetServersOfCustomerByStatus(customer, Constants.StatusCode.SERVER_RUNNING);
                    data.ServerOptions = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.ServerDefaultIP })
                        .ToList();
                    return View("ChangeIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RETURN_IP)
                {
                    var customer = GetCurrentUserName();
                    var data = new RequestReturnIPViewModel();
                    var listServers = ServerBLO.Current.GetServersOfCustomerByStatus(customer, Constants.StatusCode.SERVER_RUNNING);
                    data.ServerOptions = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.ServerDefaultIP })
                        .ToList();
                    return View("ReturnIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RENT_RACK)
                {
                    var data = new RequestRentRackViewModel();
                    var myList = new List<SelectListItem>();
                    for (var i = 0; i < 10; i++)
                    {
                        var num = (i + 1).ToString();
                        var item = new SelectListItem()
                        {
                            Value = num,
                            Text = num
                        };
                        myList.Add(item);
                    }
                    data.ListRackNumbers = myList;
                    return View("RentRack", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RETURN_RACK)
                {
                    var customer = GetCurrentUserName();
                    var data = new RequestReturnRackViewModel();
                    data.AllRacks = RackOfCustomerBLO.Current.CountServerPerRack(customer);
                    return View("ReturnRack", data);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        public ActionResult ReturnRackByBringServerAway(string rackCode)
        {
            var customer = GetCurrentUserName();
            var data = new RequestBringServerAwayViewModel();
            //lay server cua customer
            data.ServerOfCustomer = ServerBLO.Current.GetServerOfCustomer(customer);
            //Muon hien thi number of server trong rack tuy theo viec lua chon dropdownlist
            data.ServerNumber = data.ServerOfCustomer.Count();
            //rack cua server, select all va list cua rack, neu ko co thi ko hien
            var rackOfCustomer = RackOfCustomerBLO.Current.GetRacksOfCustomer(customer,
                Constants.StatusCode.RACKOFCUSTOMER_CURRENT);
            //check select all 
            if (rackOfCustomer.Count > 0)
            {
                data.RackOfCustomer = rackOfCustomer
                .Select(x => new SelectListItem
                {
                    Value = x.RackCode,
                    Text = x.RackName,
                    Selected = x.RackCode == rackCode
                })
                .ToList();
            }
            return View("BringServerAway", data);
        }
        #endregion

        [Authorize]
        [HttpGet]
        public ActionResult Detais(string rType, string rCode)
        {
            if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
            {
                //Get request
                ProcessRequestAddServerViewModel viewmodel = new ProcessRequestAddServerViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //lay list servers
                var serverCodes = LogChangedContentBLO.Current.GetAddingServers(rCode);
                List<ServerExtendedModel> list = new List<ServerExtendedModel>();
                foreach (var servercode in serverCodes)
                {
                    var server = ServerBLO.Current.GetAllServerInfo(servercode);
                    list.Add(server);
                }
                viewmodel.Servers = list;
                return View("AddServerDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.BRING_SERVER_AWAY))
            {
                ProcessRequestBringServerAwayViewModel viewmodel = new ProcessRequestBringServerAwayViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //main info
                var returnValues = LogChangedContentBLO.Current.RequestDetailsBringServerAway(rCode);
                viewmodel.ReturnIpNumber = returnValues.ReturnIpNumber;
                viewmodel.ReturnLocationNumber = returnValues.ReturnLocationNumber;
                viewmodel.SelectedServerNumber = returnValues.ReturnServerNumber;
                viewmodel.ServerOfCustomer = returnValues.Servers;
                return View("BringServerAwayDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                ProcessRequestAssignIPViewModel viewmodel = new ProcessRequestAssignIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //Lay so luong IP muon assign
                var reqDetail = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.RequestInfo.Description);
                viewmodel.NumberOfIP = reqDetail.NumberOfIp;
                viewmodel.RequestInfo.Description = reqDetail.Description;
                //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.IPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode,
                        Constants.Object.OBJECT_IP, Constants.StatusCode.IP_USED);
                }
                return View("AssignIPDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
            {
                ProcessRequestChangeIPViewModel viewmodel = new ProcessRequestChangeIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //lay ip muon change
                viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_SERVERIP,
                    Constants.StatusCode.SERVERIP_CHANGING);
                //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_IP,
                    Constants.StatusCode.IP_AVAILABLE);
                    viewmodel.NewIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_IP,
                    Constants.StatusCode.IP_USED);
                }
                return View("ChangeIPDetail", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                ProcessRequestReturnIPViewModel viewmodel = new ProcessRequestReturnIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //get servercode = requestcode
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                //List returning IPs
                viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_SERVERIP,
                    Constants.StatusCode.SERVERIP_RETURNING);
                return View("ReturnIPDetail", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
            {
                ProcessRequestRentRackViewModel viewmodel = new ProcessRequestRentRackViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //Lay so luong rack muon thue
                var desc = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.RequestInfo.Description);
                viewmodel.RackNumbers = desc.NumberOfRack;
                viewmodel.RequestInfo.Description = desc.Description;
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
                return View("RentRackDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
            {
                ProcessRequestReturnRackViewModel viewmodel = new ProcessRequestReturnRackViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //Lay so luong rack muon return
                var listRacks = LogChangedContentBLO.Current.RequestDetailsReturnRack(rCode);
                viewmodel.SelectedRacks = listRacks.listRacks;
                return View("ReturnRackDetail", viewmodel);
            }
            return RedirectToAction("Index", "Notification");
        }

        #region Process Request
        [HttpPost]
        public ActionResult AddServer(RequestAddServerViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var requestCode = Session[Constants.Session.REQUEST_CODE].ToString();
            //lay thong tin server tu bang temp
            var temps = TempRequestBLO.Current.GetByRequestCode(requestCode);
            //Add request and log
            RequestBLO.Current.AddRequest(requestCode, Constants.RequestTypeCode.ADD_SERVER,
                Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                viewmodel.RequestInfo.AppointmentTime);
            foreach (var temp in temps)
            {
                var server = JsonConvert.DeserializeObject<Server>(temp.Data);
                server.Customer = GetCurrentUserName();
                var serverCode = ServerDAO.Current.AddServer(server);
                // log object server
                var logServer = new LogChangedContent
                {
                    RequestCode = requestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                    Object = Constants.Object.OBJECT_SERVER,
                    ChangedValueOfObject = serverCode,
                    //object status
                    ObjectStatus = Constants.StatusCode.SERVER_WAITING,
                    ServerCode = serverCode
                };
                LogChangedContentBLO.Current.AddLog(logServer);
            }
            //log request status
            var logRequest = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                Object = Constants.Object.OBJECT_REQUEST,
                ObjectStatus = Constants.StatusCode.REQUEST_PENDING,
                ChangedValueOfObject = requestCode,
                Username = customer
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            //Xoa session server
            if (Session[Constants.Session.REQUEST_CODE] != null)
            {
                Session[Constants.Session.REQUEST_CODE] = null;
            }
            //Notification
            var notif = Mapper.Map<RequestAddServerViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestTypeName.SERVER_ADD;
            notif.StatusName = Constants.StatusName.REQUEST_PENDING;
            notif.RequestCode = viewmodel.RequestInfo.RequestCode;
            //dang ky ham cho client
            NotifRegister(notif);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult BringServerAway(RequestBringServerAwayViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //update lai trang thai server, trang thai serverIP
            var listServer = viewmodel.ServerOfCustomer;
            var requestCode = RequestBLO.Current.AddRequest(null, Constants.RequestTypeCode.BRING_SERVER_AWAY,
                Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                viewmodel.RequestInfo.AppointmentTime);
            //Add and log request
            var logRequest = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                Object = Constants.Object.OBJECT_REQUEST,
                ObjectStatus = Constants.StatusCode.REQUEST_PENDING,
                ChangedValueOfObject = requestCode,
                Username = customer
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            foreach (var item in listServer)
            {
                if (item.Checked)
                {
                    //get currentIps
                    var currentIps = ServerIPBLO.Current.GetIpByServer(item.ServerCode, Constants.StatusCode.SERVERIP_CURRENT);
                    //log location
                    var serverLocation = LogChangedContentBLO.Current.GetLocationOfServer(item.ServerCode);
                    foreach (var item1 in serverLocation)
                    {
                        var lc = item1.RackName + "U" + item1.RackUnit;
                        var logLocation = new LogChangedContent
                        {
                            RequestCode = requestCode,
                            TypeOfLog = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                            Object = Constants.Object.OBJECT_LOCATION,
                            ObjectStatus = Constants.StatusCode.LOCATION_USED,
                            ChangedValueOfObject = lc,
                            ServerCode = item.ServerCode,
                            Username = customer
                        };
                        LogChangedContentBLO.Current.AddLog(logLocation);
                    }
                    foreach (var ip in currentIps)
                    {
                        //update and log status ip bang serverip
                        ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, item.ServerCode, ip,
                            Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVERIP_RETURNING,
                            customer);
                    }
                    //update and log server
                    ServerBLO.Current.UpdateServerStatus(requestCode, item.ServerCode,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_BRINGING_AWAY,
                        customer);
                }
            }
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult AssignIp(RequestAssignIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            if (ModelState.IsValid)
            {
                //Edit description
                var requestDetail = new RequestDetailViewModel();
                if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
                {
                    requestDetail.NumberOfIp = viewmodel.NumberOfIP;
                    requestDetail.Description = viewmodel.RequestInfo.Description;
                }
                viewmodel.RequestInfo.Description = JsonConvert.SerializeObject(requestDetail);
                //Add request and log
                var result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.ASSIGN_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_ASSIGN_IP, null);

                //Notification
                var notif = Mapper.Map<RequestAssignIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_ASSIGN;
                notif.StatusName = Constants.StatusName.REQUEST_PENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ChangeIp(RequestChangeIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var selected = viewmodel.ReturningIPs;
            if (selected.Count > 0)
            {
                //Add request and log
                var result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.CHANGE_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_CHANGE_IP, null);
                //update and log tat ca ip muon change --> chi co serverip
                var last = selected[0];
                var ips = last.Split(',').ToList<string>();
                ips.Reverse();
                foreach (var item in ips)
                {
                    //update and log status ip bang serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(result, viewmodel.SelectedServer, item,
                        Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CHANGING,
                        customer);
                }
                //Notification
                var notif = Mapper.Map<RequestChangeIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_CHANGE;
                notif.StatusName = Constants.StatusName.REQUEST_PENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ReturnIp(RequestReturnIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var selected = viewmodel.ReturningIPs;
            if (selected.Count > 0)
            {
                //Add and log request
                var result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.RETURN_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_RETURN_IP, null);

                //update and log serverip muon return
                var last = selected[0];
                var ips = last.Split(',').ToList<string>();
                ips.Reverse();
                foreach (var item in ips)
                {
                    //update and log status ip bang serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(result, viewmodel.SelectedServer, item,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_RETURNING,
                        customer);
                }
                //Notification
                var notif = Mapper.Map<RequestReturnIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_RETURN;
                notif.StatusName = Constants.StatusName.REQUEST_PENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult RentRack(RequestRentRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Edit description
            var requestDetail = new RequestDetailViewModel();
            requestDetail.NumberOfRack = viewmodel.RackNumbers;
            requestDetail.Description = viewmodel.RequestInfo.Description;
            viewmodel.RequestInfo.Description = JsonConvert.SerializeObject(requestDetail);

            //Add and log request
            var result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.RENT_RACK,
                Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                null, null, Constants.TypeOfLog.LOG_RENT_RACK, null);

            //Notification
            var notif = Mapper.Map<RequestRentRackViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestTypeName.RACK_RENT;
            notif.StatusName = Constants.StatusName.REQUEST_PENDING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ReturnRack(RequestReturnRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var listRacks = viewmodel.AllRacks;
            //Add and log request
            var requestCode = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.RETURN_RACK,
                Constants.StatusCode.REQUEST_PENDING, customer, viewmodel.RequestInfo.Description,
                null, null, Constants.TypeOfLog.LOG_RETURN_RACK, null);
            foreach (var item in listRacks)
            {
                if (item.Checked)
                {
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, item.RackCode,
                        Constants.TypeOfLog.LOG_RETURN_RACK, customer, null
                        , Constants.StatusCode.RACKOFCUSTOMER_CURRENT, Constants.StatusCode.RACKOFCUSTOMER_RETURNING, item.RackName);
                }
            }
            //Notification
            var notif = Mapper.Map<RequestReturnRackViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestTypeName.RACK_RETURN;
            notif.StatusName = Constants.StatusName.REQUEST_PENDING;
            notif.RequestCode = requestCode;
            //dang ky ham cho client
            NotifRegister(notif);
            Toast(Constants.AlertType.SUCCESS, "RequestReturnRack", null, true);
            return RedirectToAction("Index");
        }


        [HttpGet]
        public ActionResult FetchChangedIPs(RequestChangeIPViewModel model)
        {
            var currentIps = ServerIPBLO.Current.GetIPtoFetch(model.SelectedServer, Constants.StatusCode.SERVERIP_CURRENT);
            var newmodel = model;
            newmodel.ServerIPs = currentIps;
            return Json(newmodel, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult FetchReturnedIPs(RequestReturnIPViewModel model)
        {
            var currentIps = ServerIPBLO.Current.GetIPtoFetch(model.SelectedServer, Constants.StatusCode.SERVERIP_CURRENT);
            var newmodel = model;
            newmodel.ServerIPs = currentIps;
            return Json(newmodel, JsonRequestBehavior.AllowGet);
        }

        public ActionResult SaveTempData(ServerExtendedModel server)
        {
            if (server.btnAction == Constants.FormAction.OK_ACTION)
            {
                var temp = new TempRequest();
                server.Customer = GetCurrentUserName();
                temp.RequestCode = Session[Constants.Session.REQUEST_CODE].ToString();
                temp.Data = JsonConvert.SerializeObject(server);
                temp.TempCode = TempRequestBLO.Current.GenerateCode();
                TempRequestBLO.Current.Add(temp);
            }
            else if (server.btnAction == Constants.FormAction.EDIT_ACTION)
            {
                var temp = new TempRequest()
                {
                    TempCode = server.TempCode,
                    Data = JsonConvert.SerializeObject(server)
                };
                TempRequestBLO.Current.Update(temp);
            }
            var pass = new RequestAddServerViewModel()
            {
                Server = server
            };
            return Json(pass, JsonRequestBehavior.AllowGet);
        }

        public ActionResult DeleteTempServer(string code)
        {
            //delete temp server
            var temp = TempRequestBLO.Current.GetByModel(new TempRequest { TempCode = code });
            TempRequestBLO.Current.Remove(temp);
            //quay lai trang cu
            var rt = new RequestType();
            rt.RequestTypeCode = Constants.RequestTypeCode.ADD_SERVER;
            return RedirectToAction("Index", "Home", rt);
        }
        #endregion

        public void NotifRegister(NotificationExtendedModel model)
        {
            RemoteControllerHub.Current.Clients.All.ExecuteCommand(
                model.RequestCode,
                model.RequestTypeName,
                model.Customer,
                model.Description,
                model.AppointmentTime,
                model.StatusName);
        }

        #region cancel request
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestAddServer(ProcessRequestAddServerViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var serverCodes = LogChangedContentBLO.Current.GetAddingServers(viewmodel.RequestInfo.RequestCode);
            foreach (var server in serverCodes)
            {
                //update and log server
                ServerBLO.Current.UpdateServerStatus(viewmodel.RequestInfo.RequestCode, server,
                    Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_DEACTIVATE, viewmodel.RequestInfo.Assignee);
            }
            //update request status and log
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
            Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Update lai serverip, server, request
            LogChangedContentBLO.Current.CancelRequestBringServerAway(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
               new { rType = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //update request status and log
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
            Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_ASSIGN_IP, rCode = viewmodel.RequestInfo.RequestCode });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Update and log serverip, request
            LogChangedContentBLO.Current.CancelRequestChangeIp(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
               new { rType = Constants.TypeOfLog.LOG_CHANGE_IP, rCode = viewmodel.RequestInfo.RequestCode });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Update va log serverip, request
            LogChangedContentBLO.Current.CancelRequestReturnIp(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_RETURN_IP, rCode = viewmodel.RequestInfo.RequestCode });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //update request status and log
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                Constants.TypeOfLog.LOG_RENT_RACK, Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_RENT_RACK, rCode = viewmodel.RequestInfo.RequestCode });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            LogChangedContentBLO.Current.CancelRequestReturnRack(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_RETURN_RACK, rCode = viewmodel.RequestInfo.RequestCode });
        }
        #endregion

    }
}
