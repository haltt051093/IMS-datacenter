using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using IMS.Models;
using IMS.Services;
using Newtonsoft.Json;

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
                    var code = Session[Constants.Session.REQUEST_CODE].ToString();
                    var serverInfos = TempRequestBLO.Current.GetByRequestCode(code);
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
        //DOING
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
            //Lam sao xo xuong server tương ứng với rack này?
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

        #region request details
        [HttpGet]
        public ActionResult Detail(string code, string msg)
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
                viewmodel.SuccessMessage = msg;
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
                viewmodel.SuccessMessage = msg;
                return View("BringServerAwayDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestAssignIP(code, null, null);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestAssignIPViewModel>(request);
                viewmodel.SuccessMessage = msg;
                return View("AssignIPDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
            {
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestChangeIP(code, null, null);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestChangeIPViewModel>(request);
                viewmodel.SuccessMessage = msg;
                return View("ChangeIPDetail", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestReturnIP(code, null, null);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestReturnIPViewModel>(request);
                viewmodel.SuccessMessage = msg;
                return View("ReturnIPDetail", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
            {
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestRentRack(code, null, null);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestRentRackViewModel>(request);
                viewmodel.SuccessMessage = msg;
                return View("RentRackDetail", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
            {
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestReturnRack(code, null, null);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestReturnRackViewModel>(request);
                viewmodel.SuccessMessage = msg;
                return View("ReturnRackDetail", viewmodel);
            }
            return RedirectToAction("Index");
        }
        #endregion

        #region Process Request
        [HttpPost]
        public ActionResult AddServer(RequestAddServerViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var requestCode = Session[Constants.Session.REQUEST_CODE].ToString();
            //Add request and log
            var result = RequestBLO.Current.AddRequestAddServer(customer, viewmodel.RequestInfo.Description,
                viewmodel.RequestInfo.AppointmentTime, requestCode);
            //Xoa session server
            if (Session[Constants.Session.REQUEST_CODE] != null)
            {
                Session[Constants.Session.REQUEST_CODE] = null;
            }
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = requestCode, msg = Constants.Message.CANCEL_REQUEST_ADD_SERVER });
        }

        [HttpPost]
        public ActionResult BringServerAway(RequestBringServerAwayViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //update lai trang thai server, trang thai serverIP
            var result = RequestBLO.Current.AddRequestBringServerAway(customer, viewmodel.RequestInfo.Description,
                viewmodel.ServerOfCustomer, viewmodel.RequestInfo.AppointmentTime);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.CANCEL_REQUEST_BRING_SERVER_AWAY });
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
                requestDetail.Description = viewmodel.RequestInfo.Description;
            }
            viewmodel.RequestInfo.Description = JsonConvert.SerializeObject(requestDetail);
            //Add request and log
            var result = RequestBLO.Current.AddRequestAssignIP(customer, viewmodel.RequestInfo.Description, viewmodel.SelectedServer);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.CANCEL_REQUEST_ASSIGN_IP });
        }

        [HttpPost]
        public ActionResult ChangeIp(RequestChangeIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Add request and log
            var result = RequestBLO.Current.AddRequestChangeIP(customer, viewmodel.RequestInfo.Description, viewmodel.SelectedServer, viewmodel.ReturningIPs);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.CANCEL_REQUEST_CHANGE_IP });
        }

        [HttpPost]
        public ActionResult ReturnIp(RequestReturnIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Add and log request
            var result = RequestBLO.Current.AddRequestReturnIP(customer, viewmodel.RequestInfo.Description,
                viewmodel.SelectedServer, viewmodel.ReturningIPs);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = result.RefCode, msg = Constants.Message.CANCEL_REQUEST_RETURN_IP });
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
                requestDetail.Description = viewmodel.RequestInfo.Description;
            }
            viewmodel.RequestInfo.Description = JsonConvert.SerializeObject(requestDetail);
            //Add and log request
            var result = RequestBLO.Current.AddRequestRentRack(customer, viewmodel.RequestInfo.Description);
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
            var result = RequestBLO.Current.AddRequestReturnRack(customer, viewmodel.RequestInfo.Description, viewmodel.AllRacks);
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
            var customer = GetCurrentUserName();
            var result = RequestBLO.Current.CancelRequestAddServer(viewmodel.RequestInfo.RequestCode, customer,
                viewmodel.RequestInfo.TaskCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_ADD_SERVER });
        }

        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
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
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var result = RequestBLO.Current.CancelRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                customer, viewmodel.RequestInfo.TaskCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_ASSIGN_IP });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var result = RequestBLO.Current.CancelRequestChangeIp(viewmodel.RequestInfo.RequestCode, customer,
                viewmodel.RequestInfo.TaskCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_CHANGE_IP });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var result = RequestBLO.Current.CancelRequestReturnIp(viewmodel.RequestInfo.RequestCode, customer,
                viewmodel.RequestInfo.TaskCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_RETURN_IP });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var result = RequestBLO.Current.CancelRequestRentRack(viewmodel.RequestInfo.RequestCode, customer,
                viewmodel.RequestInfo.TaskCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_RENT_RACK });
        }
        [Roles(Constants.Role.CUSTOMER)]
        [HttpPost]
        public ActionResult CancelRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            var result = RequestBLO.Current.CancelRequestReturnRack(viewmodel.RequestInfo.RequestCode, customer,
                viewmodel.RequestInfo.TaskCode);
            //dang ky ham cho client
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "Request", new
            { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.CANCEL_REQUEST_RETURN_RACK });
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
                temp.RequestCode = Session[Constants.Session.REQUEST_CODE].ToString();
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
