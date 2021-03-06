﻿using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using IMS.Authentications;
using IMS.Core;
using IMS.Core.Extensions;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using IMS.Models;
using IMS.Services;
using Newtonsoft.Json;
using System;

namespace IMS.Controllers
{
    [Roles(Constants.Role.CUSTOMER)]
    public class RequestController : CoreController
    {
        public ActionResult Index(RequestIndexViewModel data)
        {
            //var data = new RequestIndexViewModel();
            var username = GetCurrentUserName();
            data.Requests = LogBLO.Current.GetRequestOfCustomer(username);
            data.FilterByRequestType = RequestTypeBLO.Current
                .GetAll()
                .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
                .ToList();
            var listStatus = StatusBLO.Current.GetStatusByObject(Constants.Object.OBJECT_REQUEST).
                Where(x => x.StatusCode != Constants.StatusCode.REQUEST_TEMP).ToList();
            data.FilterByStatus = listStatus
                .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName, Selected = (x.StatusCode == Constants.StatusCode.REQUEST_PENDINGPROCESSING) })
                .ToList();
            data.FilterByPeriodOfTime = new List<SelectListItem>
            {
                new SelectListItem() {Value = "0", Text = "Today"},
                new SelectListItem() {Value = "7", Text = "One Week"},
                new SelectListItem() {Value = "30", Text = "One Month"},
                new SelectListItem() {Value = "99999", Text = "All", Selected = true }
            };
            data.SelectedTime = "99999";
            return View(data);
        }

        public ActionResult InitialRequest(RequestCreateViewModel q)
        {
            var check = RequestTypeBLO.Current.IsExistedType(q.Type);
            if (check)
            {
                var requestTypeCode = q.Type;
                var customer = GetCurrentUserName();
                if (!string.IsNullOrEmpty(requestTypeCode))
                {
                    var requestCode = RequestBLO.Current.AddInitialRequest(requestTypeCode, customer);
                    return RedirectToAction("Create", "Request", new { requestCode = requestCode });
                }
                return View("Index");
            }
            else
            {
                return RedirectToAction("Index", "Error");
            }

        }

        #region Create Request
        public ActionResult Create(string requestCode)
        {
            var customer = GetCurrentUserName();
            var checkRequest = RequestBLO.Current.CheckExistedRequest(requestCode, customer);
            if (checkRequest)
            {
                var requestTypeCode = RequestBLO.Current.GetByKeys(new Request { RequestCode = requestCode }).RequestType;
                if (requestTypeCode == Constants.RequestTypeCode.ADD_SERVER)
                {
                    var data = new RequestAddServerViewModel();
                    data.Servers = new List<ServerExtendedModel>();
                    data.rCode = requestCode;
                    data.ServerCount = requestCode;
                    var serverInfos = TempRequestBLO.Current.GetByRequestCode(requestCode);
                    foreach (var serverInfo in serverInfos)
                    {
                        var server = JsonConvert.DeserializeObject<ServerExtendedModel>(serverInfo.Data);
                        server.TempCode = serverInfo.TempCode;
                        data.Servers.Add(server);
                    }
                    data.RequestInfo = new RequestInfoModel();
                    var now = DateTime.Now;
                    if (now.Hour >= 16)
                    {
                        data.RequestInfo.AppointmentTimeStr = now.Date.AddHours(32).ToString("dd/MM/yyyy HH:mm");
                    }
                    else
                    {
                        var nextHour = now.Date.AddHours(now.Hour + 2);
                        data.RequestInfo.AppointmentTimeStr = nextHour.ToString("dd/MM/yyyy HH:mm");
                    }
                    data.ServerSizes = new int[] { 1, 2, 4 }
                        .Select(x => new SelectListItem { Value = x.ToString(), Text = x.ToString() })
                        .ToList();
                    return View("AddServer", data);

                }
                if (requestTypeCode == Constants.RequestTypeCode.BRING_SERVER_AWAY)
                {
                    var data = new RequestBringServerAwayViewModel();
                    data.rCode = requestCode;
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
                            data.ServerOfCustomer = serverOfCustomer;
                            data.RackOfCustomer = rackOfCustomer
                            .Select(x => new SelectListItem { Value = x.RackCode, Text = x.RackName })
                            .ToList();
                        }
                        else
                        {
                            data.ServerOfCustomer = serverOfCustomer;
                        }
                        data.RequestInfo = new RequestInfoModel();
                        var now = DateTime.Now;
                        if (now.Hour >= 20)
                        {
                            data.RequestInfo.AppointmentTimeStr = now.Date.AddHours(32).ToString("dd/MM/yyyy HH:mm");
                        }
                        else
                        {
                            data.RequestInfo.AppointmentTimeStr = now.Date.AddHours(10).ToString("dd/MM/yyyy HH:mm");
                        }
                    }
                    return View("BringServerAway", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.ASSIGN_IP)
                {
                    var data = new RequestAssignIPViewModel();
                    data.rCode = requestCode;
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
                    var data = new RequestChangeIPViewModel();
                    data.rCode = requestCode;
                    var listServers = ServerBLO.Current.GetServersOfCustomerByStatus(customer, Constants.StatusCode.SERVER_RUNNING);
                    data.ServerOptions = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.ServerDefaultIP })
                        .ToList();
                    return View("ChangeIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RETURN_IP)
                {
                    var data = new RequestReturnIPViewModel();
                    data.rCode = requestCode;
                    var listServers = ServerBLO.Current.GetServersOfCustomerByStatus(customer, Constants.StatusCode.SERVER_RUNNING);
                    data.ServerOptions = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.ServerDefaultIP })
                        .ToList();
                    return View("ReturnIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RENT_RACK)
                {
                    var data = new RequestRentRackViewModel();
                    data.rCode = requestCode;
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
                    var data = new RequestReturnRackViewModel();
                    data.rCode = requestCode;
                    data.AllRacks = RackOfCustomerBLO.Current.CountServerPerRack(customer);
                    return View("ReturnRack", data);
                }
            }
            return RedirectToAction("Index", "Error");
        }
        #endregion

        #region request details
        [HttpGet]
        public ActionResult Detail(string code, string msg)
        {
            var customer = GetCurrentUserName();
            var checkRequest = RequestBLO.Current.CheckExistedRequest(code, customer);
            if (checkRequest)
            {
                var r = RequestBLO.Current.GetByKeys(new Request { RequestCode = code });
                var rType = string.Empty;
                if (r != null)
                {
                    rType = r.RequestType;
                }
                if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestAddServer(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestAddServerViewModel>(request);
                    var list = new List<ServerExtendedModel>();
                    foreach (var item in request.Serverss)
                    {
                        list.Add(item);
                    }
                    viewmodel.Servers = list;
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("AddServerDetail", viewmodel);
                }
                if (rType.Equals(Constants.RequestTypeCode.BRING_SERVER_AWAY))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestBringServerAway(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestBringServerAwayViewModel>(request);
                    var list = new List<ServerExtendedModel>();
                    foreach (var item in request.ServerOfCustomers)
                    {
                        list.Add(item);
                    }
                    viewmodel.ServerOfCustomer = list;
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("BringServerAwayDetail", viewmodel);
                }
                if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestAssignIP(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestAssignIPViewModel>(request);
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("AssignIPDetail", viewmodel);
                }
                if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestChangeIP(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestChangeIPViewModel>(request);
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("ChangeIPDetail", viewmodel);
                }

                if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestReturnIP(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestReturnIPViewModel>(request);
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("ReturnIPDetail", viewmodel);
                }

                if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestRentRack(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestRentRackViewModel>(request);
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("RentRackDetail", viewmodel);
                }
                if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
                {
                    //Get request
                    var request = RequestBLO.Current.DetailProcessRequestReturnRack(code, null, null);
                    var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestReturnRackViewModel>(request);
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("ReturnRackDetail", viewmodel);
                }
            }
            return RedirectToAction("Index", "Error");
        }
        #endregion

        #region Process Request
        [HttpPost]
        public ActionResult AddServer(RequestAddServerViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Add request and log
            var appointmentTime = viewmodel.RequestInfo.AppointmentTimeStr.ToDateTime("dd/MM/yyyy HH:mm");
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                viewmodel.RequestInfo.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                viewmodel.RequestInfo.Description = Constants.Message.CONTENT_NULL;
            }
            var result = RequestBLO.Current.AddRequestAddServer(customer, viewmodel.RequestInfo.Description,
                appointmentTime, viewmodel.rCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.rCode, msg = Constants.Message.SEND_REQUEST_ADD_SERVER });
        }

        [HttpPost]
        public ActionResult BringServerAway(RequestBringServerAwayViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var appointmentTime = viewmodel.RequestInfo.AppointmentTimeStr.ToDateTime("dd/MM/yyyy HH:mm");
            //update lai trang thai server, trang thai serverIP
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                viewmodel.RequestInfo.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                viewmodel.RequestInfo.Description = Constants.Message.CONTENT_NULL;
            }
            var result = RequestBLO.Current.AddRequestBringServerAway(customer, viewmodel.RequestInfo.Description,
                viewmodel.ServerOfCustomer, appointmentTime, viewmodel.rCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.SEND_REQUEST_BRING_SERVER_AWAY });
        }

        [HttpPost]
        public ActionResult AssignIp(RequestAssignIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Edit description
            var requestDetail = new RequestDetailViewModel();
            requestDetail.NumberOfIp = viewmodel.NumberOfIP;
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                requestDetail.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                requestDetail.Description = Constants.Message.CONTENT_NULL;
            }
            viewmodel.RequestInfo.Description = JsonConvert.SerializeObject(requestDetail);
            //Add request and log
            var result = RequestBLO.Current.AddRequestAssignIP(customer, viewmodel.RequestInfo.Description, viewmodel.SelectedServer, viewmodel.rCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.SEND_REQUEST_ASSIGN_IP });
        }

        [HttpPost]
        public ActionResult ChangeIp(RequestChangeIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                viewmodel.RequestInfo.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                viewmodel.RequestInfo.Description = Constants.Message.CONTENT_NULL;
            }
            //Add request and log
            var result = RequestBLO.Current.AddRequestChangeIP(customer, viewmodel.RequestInfo.Description, viewmodel.SelectedServer, viewmodel.ReturningIPs, viewmodel.rCode);
            ////dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.SEND_REQUEST_CHANGE_IP });
        }

        [HttpPost]
        public ActionResult ReturnIp(RequestReturnIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Add and log request
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                viewmodel.RequestInfo.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                viewmodel.RequestInfo.Description = Constants.Message.CONTENT_NULL;
            }
            var result = RequestBLO.Current.AddRequestReturnIP(customer, viewmodel.RequestInfo.Description,
                viewmodel.SelectedServer, viewmodel.ReturningIPs, viewmodel.rCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.SEND_REQUEST_RETURN_IP });
        }

        [HttpPost]
        public ActionResult RentRack(RequestRentRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Edit description
            var requestDetail = new RequestDetailViewModel();
            requestDetail.NumberOfRack = viewmodel.RackNumbers;
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                requestDetail.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                requestDetail.Description = Constants.Message.CONTENT_NULL;
            }
            viewmodel.RequestInfo.Description = JsonConvert.SerializeObject(requestDetail);
            //Add and log request
            var result = RequestBLO.Current.AddRequestRentRack(customer, viewmodel.RequestInfo.Description, viewmodel.rCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.SEND_REQUEST_RENT_RACK });
        }

        [HttpPost]
        public ActionResult ReturnRack(RequestReturnRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Add and log request
            if (!string.IsNullOrWhiteSpace(viewmodel.RequestInfo.Description))
            {
                viewmodel.RequestInfo.Description = viewmodel.RequestInfo.Description.Replace("\r\n", "<br/>");
            }
            else
            {
                viewmodel.RequestInfo.Description = Constants.Message.CONTENT_NULL;
            }
            var result = RequestBLO.Current.AddRequestReturnRack(customer, viewmodel.RequestInfo.Description, viewmodel.AllRacks, viewmodel.rCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.SEND_REQUEST_RETURN_RACK });
        }
        #endregion

        #region cancel request
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestAddServer(ProcessRequestAddServerViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ERROR_CANCEL_REQUEST });
            }
            else
            {
                var customer = GetCurrentUserName();
                var result = RequestBLO.Current.CancelRequestAddServer(viewmodel.RequestInfo.RequestCode, customer,
                    viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_ADD_SERVER });
            }
        }

        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                var customer = GetCurrentUserName();
                //Update lai serverip, server, request
                var result = RequestBLO.Current.CancelRequestBringServerAway(viewmodel.RequestInfo.RequestCode,
                    customer, viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_BRING_SERVER_AWAY });
            }
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                var customer = GetCurrentUserName();
                var result = RequestBLO.Current.CancelRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                    customer, viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_ASSIGN_IP });
            }
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                var customer = GetCurrentUserName();
                var result = RequestBLO.Current.CancelRequestChangeIp(viewmodel.RequestInfo.RequestCode, customer,
                    viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_CHANGE_IP });
            }
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                var customer = GetCurrentUserName();
                var result = RequestBLO.Current.CancelRequestReturnIp(viewmodel.RequestInfo.RequestCode, customer,
                    viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_RETURN_IP });
            }
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                var customer = GetCurrentUserName();
                var result = RequestBLO.Current.CancelRequestRentRack(viewmodel.RequestInfo.RequestCode, customer,
                    viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_RENT_RACK });
            }
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "Request", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                var customer = GetCurrentUserName();
                var result = RequestBLO.Current.CancelRequestReturnRack(viewmodel.RequestInfo.RequestCode, customer,
                    viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "Request", new
                { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_RETURN_RACK });
            }
        }
        #endregion

        #region other functions
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

        [HttpPost]
        public JsonResult AddServerTemp(RequestAddServerViewModel data)
        {
            var result = new JsonResultModel();
            result.Action = data.Server.btnAction;
            if (data.Server.btnAction == Constants.FormAction.EDIT_ACTION)
            {
                var temp = TempRequestBLO.Current.GetByKeys(new TempRequest { TempCode = data.Server.TempCode });
                temp.Data = JsonConvert.SerializeObject(data.Server);
                TempRequestBLO.Current.Update(temp);
                result.Success = true;
                result.Codes.Add(temp.TempCode);
            }
            else
            {
                var temp = new TempRequest();
                data.Server.Customer = GetCurrentUserName();
                temp.RequestCode = data.rCode;
                temp.Data = JsonConvert.SerializeObject(data.Server);
                temp.TempCode = TempRequestBLO.Current.GenerateCode();
                TempRequestBLO.Current.Add(temp);
                result.Success = true;
                result.Codes.Add(temp.TempCode);
            }
            return Json(result);
        }

        public ActionResult DeleteTempServer(string code)
        {
            //delete temp server
            var temp = TempRequestBLO.Current.GetByKeys(new TempRequest { TempCode = code });
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

    }
}
