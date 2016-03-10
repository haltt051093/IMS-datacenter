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
using IMS.Services;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    public class RequestController : CoreController
    {
        public ActionResult Index()
        {
            //var data = new RequestIndexViewModel();
            //var requestTypes = RequestTypeBLO.Current.GetAll();
            //data.RequestTypes = requestTypes
            //    .Select(x => new SelectListItem { Text = x.RequestTypeName, Value = x.RequestTypeCode })
            //    .ToList();
            //return View(data);

            //lay request theo nhom, 1 request la 
            // trong cai request, moi object gom 1 request o trang thai som nhat, va list nhung request o trang thai cu
            var request = LogChangedContentBLO.Current.GetAllRequest();
            var data = new RequestHistoryViewModel();
            data.Request = request;
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
                    var rCode = Session[Constants.Session.REQUEST_CODE].ToString();
                    var serverInfos = TempRequestBLO.Current.GetByRequestCode(rCode);
                    foreach (var serverInfo in serverInfos)
                    {
                        var server = JsonConvert.DeserializeObject<ServerExtendedModel>(serverInfo.Data);
                        server.TempCode = serverInfo.TempCode;
                        data.Servers.Add(server);
                    }
                    var attrList = AttributeBLO.Current.GetAll();
                    data.AttributeList = attrList
                        .Select(x => new SelectListItem { Value = x.AttributeCode, Text = x.AttributeName })
                        .ToList();
                    data.ServerSizes = new int[] { 1, 2, 4 }
                        .Select(x => new SelectListItem { Value = x.ToString(), Text = x.ToString() })
                        .ToList();

                    return View("AddServer", data);

                }
                else if (requestTypeCode == Constants.RequestTypeCode.ASSIGN_IP)
                {
                    var data = new RequestIPViewModel();

                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    data.Servers = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.Model })
                        .ToList();
                    return View("AssignIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.BRING_SERVER_AWAY)
                {
                    var data = new RequestBringServerAwayViewModel();
                    //lay server cua customer
                    data.ServerOfCustomer = ServerBLO.Current.GetServerOfCustomer(Constants.Test.CUSTOMER_MANHNH);
                    //Muon hien thi number of server trong rack tuy theo viec lua chon dropdownlist
                    data.ServerNumber = data.ServerOfCustomer.Count();
                    //rack cua server, select all va list cua rack, neu ko co thi ko hien
                    var rackOfCustomer = RackOfCustomerBLO.Current.GetRacksOfCustomer(Constants.Test.CUSTOMER_MANHNH,
                        Constants.StatusCode.RACKOFCUSTOMER_CURRENT);

                    if (rackOfCustomer.Count > 0)
                    {
                        data.RackOfCustomer = rackOfCustomer
                        .Select(x => new SelectListItem { Value = x.RackCode, Text = x.RackName })
                        .ToList();
                    }

                    return View("BringServerAway", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.CHANGE_IP)
                {
                    //co the change duoc nhieu IP--> bo sung t
                    var data = new RequestIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    data.Servers = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.Model })
                        .ToList();
                    return View("ChangeIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RENT_RACK)
                {
                    var data = new RequestRentRackViewModel();
                    List<SelectListItem> myList = new List<SelectListItem>();
                    for (int i = 0; i < 10; i++)
                    {
                        string num = (i + 1).ToString();
                        SelectListItem item = new SelectListItem()
                        {
                            Value = num,
                            Text = num
                        };
                        myList.Add(item);
                    }
                    data.Numbers = myList;
                    return View("RentRack", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RETURN_IP)
                {
                    var data = new RequestIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    data.Servers = listServers
                        .Select(x => new SelectListItem { Value = x.ServerCode, Text = x.Model })
                        .ToList();
                    return View("ReturnIP", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RETURN_RACK)
                {
                    var data = new RequestReturnRackViewModel();
                    data.AllRacks = RackOfCustomerBLO.Current.CountServerPerRack(Constants.Test.CUSTOMER_MANHNH);
                    return View("ReturnRack", data);
                }
                else if (requestTypeCode == Constants.RequestTypeCode.RETURN_RACK)
                {
                    return View("ReturnRack");
                }
            }

            var _data = new RequestIndexViewModel();
            var requestTypes = RequestTypeBLO.Current.GetAll();
            _data.RequestTypes = requestTypes
                .Select(x => new SelectListItem { Text = x.RequestTypeName, Value = x.RequestTypeCode })
                .ToList();
            return View(_data);
        }
        #endregion

        public ActionResult EditRequestHistory(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Request request = RequestBLO.Current.GetById(id);
            if (request == null)
            {
                return HttpNotFound();
            }
            Mapper.CreateMap<Request, RequestCreateViewModel>();
            var requestViewmodel = Mapper.Map<Request, RequestCreateViewModel>(request);
            return View(requestViewmodel);
        }

        [HttpPost]
        public ActionResult EditRequestHistory(RequestCreateViewModel requestViewmodel)
        {
            Mapper.CreateMap<RequestCreateViewModel, Request>();
            Request request = Mapper.Map<RequestCreateViewModel, Request>(requestViewmodel);

            RequestBLO.Current.AddOrUpdate(request);
            return RedirectToAction("Index", "Request");
        }

        #region Process Request
        [HttpPost]
        public ActionResult ReturnRack(RequestReturnRackViewModel viewmodel)
        {
            if (ModelState.IsValid)
            {
                var selected = viewmodel.SelectedRacks;
                viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
                if (selected.Count > 0)
                {
                    //Add request and log
                    string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.RETURN_RACK,
                        Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                        viewmodel.AppointmentTime, null, Constants.TypeOfLog.LOG_RETURN_RACK, null);
                    //lay ra rackcode
                    string last = selected[0];
                    List<string> racks = last.Split(',').ToList<string>();
                    racks.Reverse();
                    foreach (var item in racks)
                    {
                        //ko update status cua bang Rack, chi update rackOfCustomer
                        RackOfCustomerBLO.Current.UpdateStatusRackOfCustomer(item, viewmodel.Customer
                            , Constants.StatusCode.RACKOFCUSTOMER_CURRENT, Constants.StatusCode.RACKOFCUSTOMER_RETURNING);
                        //Add log rack
                        LogChangedContent logServer = new LogChangedContent
                        {
                            RequestCode = result,
                            TypeOfLog = Constants.TypeOfLog.LOG_RETURN_RACK,
                            Object = Constants.Object.OBJECT_RACKOFCUSTOMER,
                            ChangedValueOfObject = item,
                            ObjectStatus = Constants.StatusCode.RACKOFCUSTOMER_RETURNING,
                        };
                        LogChangedContentBLO.Current.AddLog(logServer);
                    }
                    //Add Log Request, ko lien quan den servercode
                    LogChangedContent logRequest = new LogChangedContent
                    {
                        RequestCode = result,
                        TypeOfLog = Constants.TypeOfLog.LOG_RETURN_RACK,
                        Object = Constants.Object.OBJECT_REQUEST,
                        ChangedValueOfObject = result,
                        ObjectStatus = Constants.StatusCode.REQUEST_SENDING
                    };
                    LogChangedContentBLO.Current.AddLog(logRequest);
                    //Notification
                    var notif = Mapper.Map<RequestReturnRackViewModel, NotificationExtendedModel>(viewmodel);
                    notif.RequestTypeName = Constants.RequestTypeName.RACK_RETURN;
                    notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                    notif.RequestCode = result;
                    //dang ky ham cho client
                    NotifRegister(notif);
                }
            }
            Alert(Constants.AlertType.SUCCESS, "RequestReturnRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult RentRack(RequestRentRackViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            //Edit description
            var requestDetail = new RequestDetailViewModel();
            requestDetail.NumberOfRack = viewmodel.RackNumbers;
            requestDetail.Description = viewmodel.Description;
            viewmodel.Description = JsonConvert.SerializeObject(requestDetail);

            //Add request and log
            string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.RENT_RACK,
                Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                null, null, Constants.TypeOfLog.LOG_RENT_RACK, null);

            //log lai thoi diem thay doi trang thai request
            LogChangedContent requestmodel = new LogChangedContent
            {
                RequestCode = result,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = Constants.StatusCode.REQUEST_SENDING,
                TypeOfLog = Constants.TypeOfLog.LOG_RENT_RACK
            };
            LogChangedContentBLO.Current.AddLog(requestmodel);

            //Notification
            var notif = Mapper.Map<RequestRentRackViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestTypeName.RACK_RENT;
            notif.StatusName = Constants.StatusName.REQUEST_SENDING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);
            Alert(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult SaveTempData(RequestAddServerViewModel r)
        {

            if (r.Action == Constants.FormAction.OK_ACTION)
            {
                var temp = new TempRequest();
                temp.RequestCode = Session[Constants.Session.REQUEST_CODE].ToString();
                temp.Data = JsonConvert.SerializeObject(r.Server);
                temp.TempCode = TempRequestBLO.Current.GenerateCode();
                TempRequestBLO.Current.Add(temp);
            }
            else if (r.Action == Constants.FormAction.EDIT_ACTION)
            {
                //DOING
                var tempRequest = new TempRequest
                {
                    TempCode = r.Server.TempCode,
                    Data = JsonConvert.SerializeObject(r.Server)
                };
                TempRequestBLO.Current.Update(tempRequest);
            }
            RequestCreateViewModel rt = new RequestCreateViewModel();
            rt.Type = Constants.RequestTypeCode.ADD_SERVER;
            return RedirectToAction("Create", rt);
        }

        public ActionResult DeleteTempServer(string code)
        {
            //delete temp server
            var temp = TempRequestBLO.Current.GetByModel(new TempRequest { TempCode = code });
            TempRequestBLO.Current.Remove(temp);
            //quay lai trang cu
            RequestType rt = new RequestType();
            rt.RequestTypeCode = Constants.RequestTypeCode.ADD_SERVER;
            return RedirectToAction("Index", "Home", rt);
        }

        [HttpPost]
        public ActionResult AddServer(RequestAddServerViewModel viewmodel)
        {

            //add requestCode
            string UniqueRequestCode = RequestBLO.Current.GenerateCode();
            //add server, trang thai server la waiting
            foreach (var item in viewmodel.Servers)
            {
                var server = Mapper.Map<ServerExtendedModel, Server>(item);
                server.Customer = Constants.Test.CUSTOMER_MANHNH;
                string serverCode = ServerDAO.Current.AddServer(server);

                //add server attribute serial number, part number, memory

                List<ServerAttribute> serverAttributes = new List<ServerAttribute>();
                List<string> attributeCodes = new List<string>();
                attributeCodes.Add(Constants.ServerAttributeCode.PART_NUMBER);
                attributeCodes.Add(Constants.ServerAttributeCode.SERIAL_NUMBER);
                attributeCodes.Add(Constants.ServerAttributeCode.MEMORY);
                List<string> attributeValues = new List<string>();
                attributeValues.Add(item.PartNumber);
                attributeValues.Add(item.SerialNumber);
                attributeValues.Add(item.Memory);
                for (int i = 0; i < attributeValues.Count; i++)
                {
                    ServerAttribute sa = new ServerAttribute();
                    sa.AttributeValue = attributeValues[i];
                    sa.AttributeCode = attributeCodes[i];
                    sa.ServerCode = serverCode;
                    sa.UpdatedVersion = 0;
                    sa.StatusCode = Constants.StatusCode.SERVERATTRIBUTE_UPDATING;
                    serverAttributes.Add(sa);
                }
                //add server attributes
                ServerAttributeBLO.Current.AddMany(serverAttributes);

                //Add request and log
                string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.ADD_SERVER,
                    Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    viewmodel.AppointmentTime, null, Constants.TypeOfLog.LOG_ADD_SERVER, UniqueRequestCode);

                // log object server
                LogChangedContent logServer = new LogChangedContent
                {
                    RequestCode = result,
                    TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                    Object = Constants.Object.OBJECT_SERVER,
                    ChangedValueOfObject = serverCode,
                    //object status
                    ObjectStatus = Constants.StatusCode.SERVER_WAITING,
                    ServerCode = serverCode
                };
                LogChangedContentBLO.Current.AddLog(logServer);
            }

            ////lay thong tin attributes, đã lấy được, giờ tìm cách gộp 2 mảng song song
            //List<string> attributeValues = viewmodel.AttributeValues;
            //List<string> attributeCodes = viewmodel.SelectedAttributes;
            //List<ServerAttribute> serverAttributes = new List<ServerAttribute>();
            //for (int i = 0; i < attributeValues.Count; i++)
            //{
            //    ServerAttribute sa = new ServerAttribute();
            //    sa.AttributeValue = attributeValues[i];
            //    sa.AttributeCode = attributeCodes[i];
            //    sa.ServerCode = serverCode;
            //    sa.UpdatedVersion = 0;
            //    sa.StatusCode = Constants.StatusCode.SERVERATTRIBUTE_UPDATING;
            //    serverAttributes.Add(sa);
            //}
            ////add server attributes
            //ServerAttributeBLO.Current.AddMany(serverAttributes);

            //Xoa session server
            if (Session[Constants.Session.REQUEST_CODE] != null)
            {
                Session[Constants.Session.REQUEST_CODE] = null;
            }
            //Notification
            var notif = Mapper.Map<RequestAddServerViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestTypeName.SERVER_ADD;
            notif.StatusName = Constants.StatusName.REQUEST_SENDING;
            notif.RequestCode = UniqueRequestCode;
            //dang ky ham cho client
            NotifRegister(notif);
            Alert(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult BringServerAway(RequestBringServerAwayViewModel viewmodel)
        {
            //lay servercode, serverIP (gồm cả defaultIP và current IP
            //update lai trang thai server, trang thai serverIP
            var listServer = viewmodel.ServerOfCustomer;
            //Add request and log
            string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.BRING_SERVER_AWAY,
                Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                viewmodel.AppointmentTime, null, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, null);

            foreach (var item in listServer)
            {
                if (item.Checked)
                {
                    //update serverstatus
                    ServerBLO.Current.UpdateServerStatus(item.ServerCode, Constants.StatusCode.SERVER_BRINGING_AWAY);
                    //update serverip status
                    var currentIps = ServerIPBLO.Current.GetIpByServer(item.ServerCode);
                    foreach (var ip in currentIps)
                    {
                        ServerIPBLO.Current.UpdateStatusServerIp(Constants.StatusCode.SERVERIP_CURRENT,
                        Constants.StatusCode.SERVERIP_RETURNING, ip);
                    }
                    // log request status
                    LogChangedContent logRequest = new LogChangedContent
                    {
                        RequestCode = result,
                        TypeOfLog = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                        Object = Constants.Object.OBJECT_REQUEST,
                        ObjectStatus = Constants.StatusCode.REQUEST_SENDING,
                        ChangedValueOfObject = result,
                        ServerCode = item.ServerCode,
                    };
                    LogChangedContentBLO.Current.AddLog(logRequest);
                }
            }
            Alert(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult ReturnIp(RequestIPViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            var selected = viewmodel.Ips;
            if (selected.Count > 0)
            {
                //Add request and log
                string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.RETURN_IP,
                    Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    null, null, Constants.TypeOfLog.LOG_RETURN_IP, null);

                // log request status
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = result,
                    TypeOfLog = Constants.TypeOfLog.LOG_RETURN_IP,
                    Object = Constants.Object.OBJECT_REQUEST,
                    ObjectStatus = Constants.StatusCode.REQUEST_SENDING,
                    ChangedValueOfObject = result,
                    ServerCode = viewmodel.SelectedServer,
                };
                LogChangedContentBLO.Current.AddLog(logRequest);

                //log tat ca ip muon change
                string last = selected[0];
                List<string> ips = last.Split(',').ToList<string>();
                ips.Reverse();
                foreach (var item in ips)
                {
                    LogChangedContent logIps = new LogChangedContent
                    {
                        RequestCode = result,
                        TypeOfLog = Constants.TypeOfLog.LOG_RETURN_IP,
                        Object = Constants.Object.OBJECT_IP,
                        ChangedValueOfObject = item,
                        //object status
                        ObjectStatus = Constants.StatusCode.SERVERIP_RETURNING,
                        ServerCode = viewmodel.SelectedServer,
                    };
                    LogChangedContentBLO.Current.AddLog(logIps);
                    //update serverIP IsReturned
                    var serverip = ServerIPDAO.Current.Query(x => x.CurrentIP == item).FirstOrDefault();
                    if (serverip != null)
                    {
                        serverip.StatusCode = Constants.StatusCode.SERVERIP_RETURNING;
                        ServerIPDAO.Current.Update(serverip);
                    }

                }
                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_RETURN;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            Alert(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpGet]
        public ActionResult FetchIPs(RequestIPViewModel model)
        {
            var list = ServerIPDAO.Current.Query(x => x.ServerCode == model.SelectedServer
                            && x.StatusCode == Constants.StatusCode.SERVERIP_CURRENT).ToList();
            RequestIPViewModel newmodel = model;
            newmodel.ServerIPs = list;
            return Json(newmodel, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult AssignIp(RequestIPViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            if (ModelState.IsValid)
            {
                //Edit description
                var requestDetail = new RequestDetailViewModel();
                if (!string.IsNullOrWhiteSpace(viewmodel.Description))
                {
                    requestDetail.NumberOfIp = viewmodel.IpNumber;
                    requestDetail.Description = viewmodel.Description;
                }
                viewmodel.Description = JsonConvert.SerializeObject(requestDetail);
                //Add request and log
                string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.ASSIGN_IP,
                    Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    null, null, Constants.TypeOfLog.LOG_ASSIGN_IP, null);

                //Add Log Request
                //ko luu servercode o request duoc, vi moi request co the co nhieu servercode. Luc load len se lay tu bang log
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = result,
                    TypeOfLog = Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Object = Constants.Object.OBJECT_REQUEST,
                    ChangedValueOfObject = result,
                    ObjectStatus = Constants.StatusCode.REQUEST_SENDING,
                    ServerCode = viewmodel.SelectedServer,

                };
                LogChangedContentBLO.Current.AddLog(logRequest);

                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_ASSIGN;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult ChangeIp(RequestIPViewModel viewmodel)
        {
            var selected = viewmodel.Ips;
            if (selected.Count > 0)
            {
                //Add request and log
                string result = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.CHANGE_IP,
                    Constants.StatusCode.REQUEST_SENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_CHANGE_IP, null);

                //log tat ca ip muon change
                string last = selected[0];
                List<string> ips = last.Split(',').ToList<string>();
                ips.Reverse();
                foreach (var item in ips)
                {
                    //update status ip bang serverip
                    ServerIPBLO.Current.UpdateStatusServerIp(Constants.StatusCode.SERVERIP_CURRENT,
                        Constants.StatusCode.SERVERIP_RETURNING, item);
                    LogChangedContent logIps = new LogChangedContent
                    {
                        RequestCode = result,
                        TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                        Object = Constants.Object.OBJECT_IP,
                        ChangedValueOfObject = item,
                        //object status
                        ObjectStatus = Constants.StatusCode.IP_USED,
                        ServerCode = viewmodel.SelectedServer,
                    };
                    LogChangedContentBLO.Current.AddLog(logIps);
                }
                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_CHANGE;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index", "Home");
        }
        #endregion

        #region list notif, accept request
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

        //Tam thoi cho VIew notification se dan den requestdetail --> thuc te thi view list notification chi dua ra popup thong tin de xem or confirm
        [Authorize]
        public ActionResult ListNotifications()
        {
            //get role
            var obj = Session[Constants.Session.USER_LOGIN];
            Account a = (Account)obj;
            var role = a.Role;

            //neu la kh, se co username kh
            var customer = Constants.Test.CUSTOMER_MANHNH;

            NotificationViewModel viewmodel = new NotificationViewModel();

            //do du lieu vao filter
            viewmodel.FilterByRequestType = RequestTypeBLO.Current.GetAll().Select(x => new SelectListItem
            {
                Value = x.RequestTypeCode,
                Text = x.RequestTypeName
            }).ToList();
            viewmodel.FilterByStatus = StatusBLO.Current.GetStatusByObject(Constants.Object.OBJECT_REQUEST)
                .Select(x => new SelectListItem()
                {
                    Value = x.StatusCode,
                    Text = x.StatusName
                }).ToList();

            viewmodel.NotificationList = RequestBLO.Current.ListNotification(role, customer);
            return View("ListNotifications", viewmodel);
        }

        //Accept request
        public ActionResult AcceptRequest(string requestCode, string requestType)
        {
            //doi trang thai cua request
            if (requestType == Constants.RequestTypeCode.BRING_SERVER_AWAY)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                    Constants.StatusCode.REQUEST_WAITING, Constants.Test.STAFF_NHI);
            }
            if (requestType == Constants.RequestTypeCode.ADD_SERVER)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                    Constants.StatusCode.REQUEST_WAITING, Constants.Test.STAFF_NHI);
            }
            if (requestType == Constants.RequestTypeCode.ASSIGN_IP)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Constants.StatusCode.REQUEST_PROCESSING, Constants.Test.STAFF_NHI);
            }
            if (requestType == Constants.RequestTypeCode.CHANGE_IP)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                    Constants.StatusCode.REQUEST_PROCESSING, Constants.Test.STAFF_NHI);
            }
            if (requestType == Constants.RequestTypeCode.RETURN_IP)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                    Constants.StatusCode.REQUEST_PROCESSING, Constants.Test.STAFF_NHI);
            }
            if (requestType == Constants.RequestTypeCode.RENT_RACK)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                    Constants.StatusCode.REQUEST_PROCESSING, Constants.Test.STAFF_NHI);
            }
            if (requestType == Constants.RequestTypeCode.RETURN_RACK)
            {
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_PROCESSING, Constants.Test.STAFF_NHI);
            }
            //redirect lai list notif
            return RedirectToAction("ListNotifications");
        }
        #endregion

    }
}
