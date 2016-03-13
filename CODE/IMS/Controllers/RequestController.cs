using System.Collections.Generic;
using System.Linq;
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
            var request = LogChangedContentBLO.Current.GetAllRequest();
            var data = new RequestIndexViewModel();
            data.Requests = request;
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

            var _data = new RequestCreateViewModel();
            var requestTypes = RequestTypeBLO.Current.GetAll();
            _data.RequestTypes = requestTypes;
            return View(_data);
        }
        #endregion

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
                    //Add and log request
                    string requestCode = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.RETURN_RACK,
                        Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                        viewmodel.AppointmentTime, null, Constants.TypeOfLog.LOG_RETURN_RACK, null);
                    //lay ra rackcode
                    string last = selected[0];
                    List<string> racks = last.Split(',').ToList<string>();
                    racks.Reverse();
                    foreach (var item in racks)
                    {
                        //update and log rackofCustomer
                        RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, item,
                            Constants.TypeOfLog.LOG_RETURN_RACK, Constants.Test.CUSTOMER_MANHNH, null
                            , Constants.StatusCode.RACKOFCUSTOMER_CURRENT, Constants.StatusCode.RACKOFCUSTOMER_RETURNING);
                    }

                    //Notification
                    var notif = Mapper.Map<RequestReturnRackViewModel, NotificationExtendedModel>(viewmodel);
                    notif.RequestTypeName = Constants.RequestTypeName.RACK_RETURN;
                    notif.StatusName = Constants.StatusName.REQUEST_PENDING;
                    notif.RequestCode = requestCode;
                    //dang ky ham cho client
                    NotifRegister(notif);
                }
            }
            Toast(Constants.AlertType.SUCCESS, "RequestReturnRack", null, true);
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

            //Add and log request
            string result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.RENT_RACK,
                Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                null, null, Constants.TypeOfLog.LOG_RENT_RACK, null);

            //Notification
            var notif = Mapper.Map<RequestRentRackViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestTypeName.RACK_RENT;
            notif.StatusName = Constants.StatusName.REQUEST_PENDING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult AddServer(RequestAddServerViewModel viewmodel)
        {
            //add requestCode
            string uniqueRequestCode = RequestBLO.Current.GenerateCode();
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
                string result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.ADD_SERVER,
                    Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    viewmodel.AppointmentTime, serverCode, Constants.TypeOfLog.LOG_ADD_SERVER, uniqueRequestCode);

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
            notif.StatusName = Constants.StatusName.REQUEST_PENDING;
            notif.RequestCode = uniqueRequestCode;
            //dang ky ham cho client
            NotifRegister(notif);
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult BringServerAway(RequestBringServerAwayViewModel viewmodel)
        {
            //update lai trang thai server, trang thai serverIP
            var listServer = viewmodel.ServerOfCustomer;
            var requestCode = RequestBLO.Current.AddRequest(Constants.RequestTypeCode.BRING_SERVER_AWAY,
                Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                viewmodel.AppointmentTime);
            foreach (var item in listServer)
            {
                if (item.Checked)
                {
                    //get currentIps
                    var currentIps = ServerIPBLO.Current.GetIpByServer(item.ServerCode, Constants.StatusCode.SERVERIP_CURRENT);
                    //Add and log request
                    LogChangedContent logRequest = new LogChangedContent
                    {
                        RequestCode = requestCode,
                        TypeOfLog = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                        Object = Constants.Object.OBJECT_REQUEST,
                        ObjectStatus = Constants.StatusCode.REQUEST_PENDING,
                        ChangedValueOfObject = requestCode,
                        ServerCode = item.ServerCode,
                        Username = Constants.Test.CUSTOMER_MANHNH
                    };
                    LogChangedContentBLO.Current.AddLog(logRequest);
                    //log location
                    var serverLocation = LogChangedContentBLO.Current.GetLocationOfServer(item.ServerCode);
                    foreach (var item1 in serverLocation)
                    {
                        var lc = item1.RackName + "U" + item1.RackUnit;
                        LogChangedContent logLocation = new LogChangedContent
                        {
                            RequestCode = requestCode,
                            TypeOfLog = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                            Object = Constants.Object.OBJECT_LOCATION,
                            ObjectStatus = Constants.StatusCode.LOCATION_USED,
                            ChangedValueOfObject = lc,
                            ServerCode = item.ServerCode,
                            Username = Constants.Test.CUSTOMER_MANHNH
                        };
                        LogChangedContentBLO.Current.AddLog(logLocation);
                    }
                    foreach (var ip in currentIps)
                    {
                        //update and log status ip bang serverip
                        ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, item.ServerCode, ip,
                            Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVERIP_RETURNING,
                            Constants.Test.CUSTOMER_MANHNH);
                    }
                    //update and log server
                    ServerBLO.Current.UpdateServerStatus(requestCode, item.ServerCode,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_BRINGING_AWAY,
                        Constants.Test.CUSTOMER_MANHNH);

                }
            }
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult ReturnIp(RequestIPViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            var selected = viewmodel.Ips;
            if (selected.Count > 0)
            {
                //Add and log request
                string result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.RETURN_IP,
                    Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_RETURN_IP, null);

                //update and log serverip muon return
                string last = selected[0];
                List<string> ips = last.Split(',').ToList<string>();
                ips.Reverse();
                foreach (var item in ips)
                {
                    //update and log status ip bang serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(result, viewmodel.SelectedServer, item,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_RETURNING,
                        Constants.Test.CUSTOMER_MANHNH);
                }
                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_RETURN;
                notif.StatusName = Constants.StatusName.REQUEST_PENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            return RedirectToAction("Index", "Home");
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
                string result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.ASSIGN_IP,
                    Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_ASSIGN_IP, null);

                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_ASSIGN;
                notif.StatusName = Constants.StatusName.REQUEST_PENDING;
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
                string result = RequestBLO.Current.AddRequestANDLog(Constants.RequestTypeCode.CHANGE_IP,
                    Constants.StatusCode.REQUEST_PENDING, Constants.Test.CUSTOMER_MANHNH, viewmodel.Description,
                    null, viewmodel.SelectedServer, Constants.TypeOfLog.LOG_CHANGE_IP, null);
                //update and log tat ca ip muon change --> chi co serverip
                string last = selected[0];
                List<string> ips = last.Split(',').ToList<string>();
                ips.Reverse();
                foreach (var item in ips)
                {
                    //update and log status ip bang serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(result, viewmodel.SelectedServer, item,
                        Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CHANGING,
                        Constants.Test.CUSTOMER_MANHNH);
                }
                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestTypeName.IP_CHANGE;
                notif.StatusName = Constants.StatusName.REQUEST_PENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
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

        //public ActionResult SaveTempData(RequestAddServerViewModel r)
        public ActionResult SaveTempData(ServerExtendedModel server)
        {
            if (server.btnAction == Constants.FormAction.OK_ACTION)
            {
                var temp = new TempRequest();
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
            RequestAddServerViewModel pass = new RequestAddServerViewModel()
            {
                Server = server
            };
            return Json(pass, JsonRequestBehavior.AllowGet);
            //return RedirectToAction("Create", rt);
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
        #endregion

        #region cancel and rejrect request
        public ActionResult Delete(string requestCode, string requestType, string actionName)
        {

            if (requestType == Constants.TypeOfLog.LOG_ADD_SERVER)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //DOING
                    //Hoi thay lai xem co can bang serverattributes nữa ko --> bỏ attribute cho rảnh nợ
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_BRING_SERVER_AWAY)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //Update lai serverip, server, request
                    LogChangedContentBLO.Current.CancelRequestBringServerAway(requestCode);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {
                    //PENDING
                }
            }
            if (requestType == Constants.TypeOfLog.LOG_ASSIGN_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //update request status and log
                    RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            //DOING
            if (requestType == Constants.TypeOfLog.LOG_CHANGE_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //Update and log serverip, request
                    LogChangedContentBLO.Current.CancelRequestChangeIp(requestCode);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RETURN_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //Update va log serverip, request
                    LogChangedContentBLO.Current.CancelRequestReturnIp(requestCode);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RENT_RACK)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //update request status and log
                    RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RETURN_RACK)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {

                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }

            return RedirectToAction("Index", "Request");
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
