using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web.Mvc;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using IMS.Services;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.SignalR;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    public class RequestController : CoreController
    {
        public ActionResult RequestChangeIP2()
        {
            return View();
        }

        public ActionResult RequestChangeIPInfo2()
        {
            return View();
        }

        public ActionResult RequestRentRack2()
        {
            return View();
        }

        public ActionResult RequestRentRackInfo2()
        {
            return View();
        }

        public ActionResult RequestReturnRack2()
        {
            return View();
        }

        public ActionResult RequestReturnRackInfo2()
        {
            return View();
        }

        public ActionResult RequestReturnIP2()
        {
            return View();
        }

        public ActionResult RequestReturnIPInfo2()
        {
            return View();
        }

        public ActionResult RequestUpgradeServer2()
        {
            return View();
        }

        public ActionResult RequestUpgradeServerInfo2()
        {
            return View();
        }

        public ActionResult RequestBringAwayServer2()
        {
            return View();
        }

        public ActionResult RequestBringAwayServerInfo2()
        {
            return View();
        }

        public ActionResult RequestHistory2()
        {
            //var data = RequestDAO.Current.GetAll();
            var request = RequestBLO.Current.GetAllRequest();
            var data = new RequestIndexViewModel();
            data.Request = request;
            return View(data);
        }
        private static IHubContext commandHubContext;

        [HttpPost]
        public ActionResult RequestReturnRack(RequestReturnRackViewModel viewmodel)
        {
            if (ModelState.IsValid)
            {
                var number = viewmodel.RackOfCustomer.Count;
                viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
                var selected = viewmodel.RackOfCustomer.Where(x => x.Selected).Select(x => x.Value).ToArray();
                if (number != 0)
                {
                    //Add request
                    Request passRequest = new Request
                    {
                        Customer = viewmodel.Customer,
                        Description = viewmodel.Description
                    };
                    string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.RETURN_RACK);

                    //Update rack status
                    foreach (var item in selected)
                    {
                        //update status of a rackOfCustomer
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

                    //Add Log Request
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
                    notif.RequestTypeName = Constants.RequestType.RACK_RETURN;
                    notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                    notif.RequestCode = result;
                    //dang ky ham cho client
                    NotifRegister(notif);
                }
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult RequestRentRack(RequestRentRackViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            //Edit description
            string description = viewmodel.RackNumbers.ToString();
            var totalDes = new StringBuilder();
            if (!viewmodel.Description.IsNullOrWhiteSpace())
            {
                //description = description + "\r\n" + viewmodel.Description;
                totalDes.AppendLine(description);
                totalDes.AppendLine(viewmodel.Description);
            }
            //Add request
            Request passRequest = new Request
            {
                Customer = viewmodel.Customer,
                Description = totalDes.ToString()
            };
            string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.RENT_RACK);

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
            notif.RequestTypeName = Constants.RequestType.RACK_RENT;
            notif.StatusName = Constants.StatusName.REQUEST_SENDING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);

            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult SaveTempData(RequestAddServerViewModel viewmodel)
        {
            var temp = new TempRequest();
            temp.RequestCode = Session[Constants.Session.REQUEST_CODE].ToString();
            temp.Data = JsonConvert.SerializeObject(viewmodel.Server);
            temp.TempCode = TempRequestBLO.Current.GenerateCode();
            TempRequestBLO.Current.Add(temp);

            RequestType rt = new RequestType();
            rt.RequestTypeCode = Constants.RequestTypeCode.ADD_SERVER;
            return RedirectToAction("Index", "Home", rt);
        }

        public ActionResult DeleteTempServer(string tempCode)
        {
            //delete temp server
            var temp = TempRequestBLO.Current.GetByCode(tempCode);
            TempRequestBLO.Current.Remove(temp);
            //quay lai trang cu
            RequestType rt = new RequestType();
            rt.RequestTypeCode = Constants.RequestTypeCode.ADD_SERVER;
            return RedirectToAction("Index", "Home", rt);
        }

        [HttpPost]
        public ActionResult RequestAddServer(RequestAddServerViewModel viewmodel)
        {

            //get appointment time
            //string dateOnly = viewmodel.AppointmentTime.ToString("dd/MM/yyyy");
            //string time = DateTime.Parse(viewmodel.Time).ToString("HH:mm:ss");
            //string datetime = dateOnly + ' ' + time;
            //viewmodel.AppointmentTime = DateTime.Parse(datetime);

            //Add request
            Request passRequest = new Request
            {
                Customer = Constants.Test.CUSTOMER_MANHNH,
                Description = viewmodel.Description,
                AppointmentTime = viewmodel.AppointmentTime,
            };
            string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.ADD_SERVER);

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

                // log request status
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = result,
                    TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                    Object = Constants.Object.OBJECT_REQUEST,
                    ChangedValueOfObject = result,
                    ObjectStatus = Constants.StatusCode.REQUEST_SENDING,
                    ServerCode = serverCode
                };
                LogChangedContentBLO.Current.AddLog(logRequest);

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

            //Notification
            var notif = Mapper.Map<RequestAddServerViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestType.SERVER_ADD;
            notif.StatusName = Constants.StatusName.REQUEST_SENDING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult RequestReturnIp(RequestIPViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            var selected = viewmodel.Ips;
            if (selected.Count > 0)
            {
                //luu vo bang request 
                Request passRequest = new Request
                {
                    Customer = viewmodel.Customer,
                    Description = viewmodel.Description
                };
                string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.RETURN_IP);

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
                notif.RequestTypeName = Constants.RequestType.IP_RETURN;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
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

        [HttpPost]
        public ActionResult RequestAssignIp(RequestIPViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            if (ModelState.IsValid)
            {
                //Edit description
                var totalDes = new StringBuilder();
                var requestDetail = new RequestDetailModel();
                if (!viewmodel.Description.IsNullOrWhiteSpace())
                {
                    requestDetail.NumberOfIp = viewmodel.IpNumber;
                    requestDetail.Description = viewmodel.Description;
                }
                //Add request
                Request passRequest = new Request
                {
                    Customer = viewmodel.Customer,
                    Description = JsonConvert.SerializeObject(requestDetail)
                };
                string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.ASSIGN_IP);

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
                notif.RequestTypeName = Constants.RequestType.IP_ASSIGN;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult RequestChangeIp(RequestIPViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            var selected = viewmodel.Ips;
            if (selected.Count > 0)
            {
                //luu vo bang request 
                Request passRequest = new Request
                {
                    Customer = viewmodel.Customer,
                    Description = viewmodel.Description
                };
                string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.CHANGE_IP);



                // log request status
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = result,
                    TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
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
                notif.RequestTypeName = Constants.RequestType.IP_CHANGE;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index", "Home");
        }

        public void NotifRegister(NotificationExtendedModel model)
        {
            if (commandHubContext == null)
            {
                commandHubContext = GlobalHost.ConnectionManager.GetHubContext<RemoteControllerHub>();
            }
            commandHubContext.Clients.All.ExecuteCommand(
                model.RequestCode,
                model.RequestTypeName,
                model.Customer,
                model.Description,
                model.AppointmentTime,
                model.StatusName);
        }

        //Tam thoi cho VIew notification se dan den requestdetail --> thuc te thi view list notification chi dua ra popup thong tin de xem or confirm
        public ActionResult ListNotifications()
        {
            NotificationViewModel viewmodel = new NotificationViewModel();
            viewmodel.NotificationList = RequestBLO.Current.ListAllNotification();
            return View("ListNotifications", viewmodel);
        }

        //Accept request
        public ActionResult AcceptRequest(string requestCode, string requestType)
        {
            //doi trang thai cua request
            RequestBLO.Current.UpdateRequestStatus(requestCode, Constants.StatusCode.REQUEST_WAITING);
            //redirect lai list notif
            return RedirectToAction("ListNotifications");
        }

        [HttpGet]
        public ActionResult RequestDetais(string rType, string rCode)
        {
            if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
            {
                //Get request
                RequestAddServerViewModel viewmodel = new RequestAddServerViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                viewmodel.RequestCode = rCode;
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
                        var server = ServerBLO.Current.GetServerByCode(servercode);
                        //lay serverattribute
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

                return View("RequestAddServerInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    //Lay so luong IP muon assign, tam thoi fix cung
                    var reqDetail = JsonConvert.DeserializeObject<RequestDetailModel>(viewmodel.Description);
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
                        var randomList = IPAddressPoolBLO.Current.SelectRandomIps(listAvailableIps, viewmodel.IpNumber);
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
                return View("RequestAssignIPInfo", viewmodel);
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
                    var returningIps = ServerIPBLO.Current.GetReturningIps(serverCode);
                    viewmodel.ReturningIps = returningIps;
                    //Lay so luong IP muon change, tam thoi fix cung
                    viewmodel.IpNumber = returningIps.Count;
                    //Lay list available ip cung vung
                    var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(serverCode);
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
                return View("ProcessRequestChangeIP", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestDAO.Current.Query(x => x.RequestCode == rCode).FirstOrDefault();
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    //get servercode = requestcode
                    var servercode = LogChangedContentBLO.Current.GetServerCodeByRequestCode(request.RequestCode).FirstOrDefault();
                    viewmodel.SelectedServer = servercode;
                    viewmodel.StatusName = StatusBLO.Current.GetStatusName(viewmodel.StatusCode);
                    var customer = AccountBLO.Current.GetAccountByCode(viewmodel.Customer);
                    viewmodel.CustomerName = customer.Fullname;
                    //List returning IPs
                    viewmodel.Ips = LogChangedContentBLO.Current.GetIpRequestReturnIp(rCode);
                }
                return View("RequestReturnIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
            {
                //chưa cắt số lượng rack từ string của description được
                RequestRentRackViewModel viewmodel = new RequestRentRackViewModel();
                var request = RequestDAO.Current.Query(x => x.RequestCode == rCode).FirstOrDefault();

                // trang view cho hien thi: Customer, request time, rack number, description --> yeu cau cua khach hang
                // Phan thuc hien cua staff -->  chọn số lượng rack còn trống
                if (request != null)
                {
                    //Mapping
                    viewmodel = Mapper.Map<Request, RequestRentRackViewModel>(request);
                    //Tam thoi fix cung rack numbers
                    viewmodel.RackNumbers = Constants.Number.NUMBER_1;
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
                return View("ProcessRequestRentRack", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
            {
                RequestReturnRackViewModel viewmodel = new RequestReturnRackViewModel();
                //tu requestcode se lay duoc khach hang
                var customer = RequestBLO.Current.GetCustomerOfRequest(rCode);
                //lay rack dang o trang thai returning cua khach hang cu the
                var rackOfCustomer = RackOfCustomerBLO.Current.GetReturningRacks(customer);
                var request = RequestDAO.Current.Query(x => x.RequestCode == rCode).FirstOrDefault();
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestReturnRackViewModel>(request);
                    viewmodel.RackOfCustomer = rackOfCustomer.Select(x => new SelectListItem
                    {
                        Value = x,
                        Text = x
                    }).ToList(); ;
                }

                return View("ProcessRequestReturnRack", viewmodel);
            }
            return RedirectToAction("ListNotifications");
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(RequestRentRackViewModel viewmodel)
        {

            //Change request status, tu 
            RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_DONE);

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

            //Add log Khach hang rent rack
            foreach (var item in viewmodel.SelectedRacks)
            {
                LogChangedContent logRack = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_RENT_RACK,
                    Object = Constants.Object.OBJECT_RACK,
                    ChangedValueOfObject = item,
                    ObjectStatus = Constants.StatusCode.RACK_RENTED,
                    Staff = viewmodel.StatusCode
                };
                LogChangedContentBLO.Current.AddLog(logRack);
            }

            // add vo bang rack of customer
            foreach (var item in viewmodel.SelectedRacks)
            {
                var rackOfCustomer = new RackOfCustomer
                {
                    RackCode = item,
                    Customer = viewmodel.Customer,
                    RentedDate = DateTime.Now,
                };
                RackOfCustomerBLO.Current.Add(rackOfCustomer);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult ProcessRequestReturnRack(RequestReturnRackViewModel viewmodel)
        {
            //Change request status 
            RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_DONE);


            //update status rackofcustomer
            foreach (var item in viewmodel.RackOfCustomer)
            {
                //update statuscode cua RackOfCustomer
                RackOfCustomerBLO.Current.UpdateStatusRackOfCustomer(item.Value, viewmodel.Customer
                    , Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_OLD);
                // update statuscode cua bang rack
                RackBLO.Current.UpdateRackStatus(item.Value, Constants.StatusCode.RACK_AVAILABLE);
                //Add log trang thai rack
                LogChangedContent logRack = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_RETURN_RACK,
                    Object = Constants.Object.OBJECT_RACK,
                    ChangedValueOfObject = item.Value,
                    ObjectStatus = Constants.StatusCode.RACK_AVAILABLE,
                    Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logRack);
                //log trang thai rack of customer
                LogChangedContent logRackOfCustomer = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_RETURN_RACK,
                    Object = Constants.Object.OBJECT_RACKOFCUSTOMER,
                    ChangedValueOfObject = item.Value,
                    ObjectStatus = Constants.StatusCode.RACKOFCUSTOMER_OLD,
                    Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logRackOfCustomer);
            }
            //Add Log Request
            LogChangedContent logRequest = new LogChangedContent
            {
                RequestCode = viewmodel.RequestCode,
                TypeOfLog = Constants.TypeOfLog.LOG_RETURN_RACK,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = viewmodel.RequestCode,
                ObjectStatus = Constants.StatusCode.REQUEST_DONE,
                Staff = viewmodel.StaffCode
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult ProcessRequesReturnIp(RequestIPViewModel viewmodel)
        {
            //Change request status 
            RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_DONE);

            //change status cua IP o IPAddresspool
            foreach (var item in viewmodel.Ips)
            {
                IPAddressPoolBLO.Current.UpdateStatusIp(Constants.StatusCode.IP_AVAILABLE, item);
                // update statuscode cua bang serverIP
                ServerIPBLO.Current.UpdateStatusServerIp(Constants.StatusCode.SERVERIP_RETURNING,
                    Constants.StatusCode.SERVERIP_OLD, item);
                //Add log trang thai IP
                LogChangedContent logIp = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_RETURN_IP,
                    Object = Constants.Object.OBJECT_IP,
                    ChangedValueOfObject = item,
                    ObjectStatus = Constants.StatusCode.IP_AVAILABLE,
                    Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logIp);
            }
            //Add Log Request
            LogChangedContent logRequest = new LogChangedContent
            {
                RequestCode = viewmodel.RequestCode,
                TypeOfLog = Constants.TypeOfLog.LOG_RETURN_IP,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = viewmodel.RequestCode,
                ObjectStatus = Constants.StatusCode.REQUEST_DONE,
                Staff = viewmodel.StaffCode
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            return RedirectToAction("Index", "Home");
        }

        //DOING
        [HttpPost]
        public ActionResult ProcessRequestAddServer(RequestAddServerViewModel viewmodel)
        {
            var listServer = viewmodel.Servers;
            foreach (var server in listServer)
            {
                ServerBLO.Current.UpdateServerStatus(server.ServerCode, Constants.StatusCode.SERVER_RUNNING);
                ServerAttributeBLO.Current.UpdateServerAttributeStatus(server.ServerCode, Constants.StatusCode.SERVERATTRIBUTE_NEW);
                //doi trang thai cua request
                RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_DONE);
                //luu IP address
                //Luu location

                //log server status
                LogChangedContent logServer = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                    Object = Constants.Object.OBJECT_SERVER,
                    ChangedValueOfObject = viewmodel.RequestCode,
                    ObjectStatus = Constants.StatusCode.SERVER_RUNNING,
                    ServerCode = server.ServerCode
                    //Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logServer);

                //log request status
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                    Object = Constants.Object.OBJECT_REQUEST,
                    ChangedValueOfObject = viewmodel.RequestCode,
                    ObjectStatus = Constants.StatusCode.REQUEST_DONE,
                    ServerCode = server.ServerCode
                    //Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logRequest);
            }
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(RequestIPViewModel viewmodel)
        {
            if (Request.Form["Approve"] != null)
            {
                //Change request status 
                RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_DONE);

                //add ip vo serverip
                foreach (var item in viewmodel.Ips.ToList())
                {
                    ServerIPBLO.Current.AddServerIp(viewmodel.SelectedServer, item, 0);
                    //change status cua IP o IPAddresspool
                    IPAddressPoolBLO.Current.UpdateStatusIp(Constants.StatusCode.IP_USED, item);
                    //Add log trang thai IP
                    LogChangedContent logIp = new LogChangedContent
                    {
                        RequestCode = viewmodel.RequestCode,
                        TypeOfLog = Constants.TypeOfLog.LOG_ASSIGN_IP,
                        Object = Constants.Object.OBJECT_IP,
                        ChangedValueOfObject = item,
                        ObjectStatus = Constants.StatusCode.IP_USED,
                        Staff = viewmodel.StaffCode
                    };
                    LogChangedContentBLO.Current.AddLog(logIp);
                }
                //Add Log Request
                LogChangedContent logRequest = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Object = Constants.Object.OBJECT_REQUEST,
                    ChangedValueOfObject = viewmodel.RequestCode,
                    ObjectStatus = Constants.StatusCode.REQUEST_DONE,
                    Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logRequest);
                return RedirectToAction("Index", "Home");
            }
            else if (Request.Form["Reject"] != null)
            {
                //O giao dien hien popup Yes/No reject

                //Change request status 
                RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_REJECTED);

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
            return RedirectToAction("Index", "Home");
        }
        //DOING
        [HttpPost]
        public ActionResult ProcessRequestChangeIp(RequestIPViewModel viewmodel)
        {
            //Lam cach nao de luu gia tri cua moi dropdownlist, trong do co nhieu dropdownlist, ko ro so luong???
            //Change request status 
            RequestBLO.Current.UpdateRequestStatus(viewmodel.RequestCode, Constants.StatusCode.REQUEST_DONE);

            //update ServerIP
            foreach (var item in viewmodel.SelectedIps)
            {
                //get previous ip
                var preId = ServerIPBLO.Current.GetPreviousIp(viewmodel.SelectedServer, item.Value);

                //add ip vo serverip
                foreach (var ip in viewmodel.Ips)
                {
                    ServerIPBLO.Current.AddServerIp(viewmodel.SelectedServer, ip, preId);
                    //Update status cua IP moi o IPAddressPool
                    IPAddressPoolBLO.Current.UpdateStatusIp(Constants.StatusCode.IP_USED, ip);
                    //Add log trang thai IP moi
                    LogChangedContent logIp = new LogChangedContent
                    {
                        RequestCode = viewmodel.RequestCode,
                        TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                        Object = Constants.Object.OBJECT_IP,
                        ChangedValueOfObject = ip,
                        ObjectStatus = Constants.StatusCode.IP_USED,
                        Staff = viewmodel.StaffCode
                    };
                    LogChangedContentBLO.Current.AddLog(logIp);
                }

                //Update status cua IP cu o IPAddressPool
                IPAddressPoolBLO.Current.UpdateStatusIp(Constants.StatusCode.IP_AVAILABLE, item.Value);
                //update previous ip status
                ServerIPBLO.Current.UpdateStatusServerIp(Constants.StatusCode.RACKOFCUSTOMER_RETURNING,
                    Constants.StatusCode.RACKOFCUSTOMER_OLD, item.Value);
                //Add log trang thai IP moi cu
                LogChangedContent logPreIp = new LogChangedContent
                {
                    RequestCode = viewmodel.RequestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                    Object = Constants.Object.OBJECT_IP,
                    ChangedValueOfObject = item.Value,
                    ObjectStatus = Constants.StatusCode.IP_AVAILABLE,
                    Staff = viewmodel.StaffCode
                };
                LogChangedContentBLO.Current.AddLog(logPreIp);
            }

            LogChangedContent logRequest = new LogChangedContent
            {
                RequestCode = viewmodel.RequestCode,
                TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = viewmodel.RequestCode,
                ObjectStatus = Constants.StatusCode.REQUEST_DONE,
                Staff = viewmodel.StaffCode
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            return RedirectToAction("Index", "Home");
        }
    }
}
