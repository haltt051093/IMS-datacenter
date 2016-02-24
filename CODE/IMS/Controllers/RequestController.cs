using System;
using System.Collections.Generic;
using System.Linq;
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

namespace IMS.Controllers
{
    public class RequestController : CoreController
    {
        public ActionResult RequestAssignIP2()
        {
            return View();
        }
        public ActionResult RequestAddServer2()
        {
            return View();
        }

        public ActionResult RequestAddServerInfo2()
        {
            return View();
        }

        public ActionResult RequestAssignIPInfo2()
        {
            return View();
        }

        public ActionResult AddServerInfo()
        {
            return View();
        }

        public ActionResult ListNotifications2()
        {
            return View();
        }
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
            return View();
        }
        private static IHubContext commandHubContext;

        [HttpGet]
        public ActionResult Index(RequestType requesttype)
        {
            string requestcode = requesttype.RequestTypeCode;
            if (!string.IsNullOrEmpty(requestcode))
            {
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_RACK))
                {
                    RequestReturnRackViewModel viewmodel = new RequestReturnRackViewModel();
                    var result = RackOfCustomerDAO.Current.EmptyRentedRack(Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.RackOfCustomer = result.Select(x => new SelectListItem
                    {
                        Value = x.RackCode,
                        Text = x.RackName
                    }).ToList();
                    return View("RequestReturnRack", viewmodel);
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RENT_RACK))
                {
                    return View("RequestRentRack");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.ADD_SERVER))
                {
                    var data = new RequestAddServerViewModel();
                    var attrList = AttributeBLO.Current.GetAll();
                    data.AttributeList = attrList
                        .Select(x => new SelectListItem { Value = x.AttributeCode, Text = x.AttributeName })
                        .ToList();
                    return View("RequestAddServer", data);
                }
                //DOING
                if (requestcode.Equals(Constants.RequestTypeCode.UPGRADE_SERVER))
                {
                    return View("RequestUpgradeServer");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_IP))
                {
                    RequestIPViewModel viewmodel = new RequestIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.Servers = listServers.Select(x => new SelectListItem
                    {
                        Value = x.ServerCode,
                        Text = x.Model
                    }).ToList();
                    return View("RequestReturnIP", viewmodel);
                }
                if (requestcode.Equals(Constants.RequestTypeCode.CHANGE_IP))
                {
                    {
                        RequestIPViewModel viewmodel = new RequestIPViewModel();
                        var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                        viewmodel.Servers = listServers.Select(x => new SelectListItem
                        {
                            Value = x.ServerCode,
                            Text = x.Model
                        }).ToList();
                        return View("RequestChangeIP", viewmodel);
                    }
                }
                if (requestcode.Equals(Constants.RequestTypeCode.ASSIGN_IP))
                {
                    RequestIPViewModel viewmodel = new RequestIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.Servers = listServers.Select(x => new SelectListItem
                    {
                        Value = x.ServerCode,
                        Text = x.Model
                    }).ToList();
                    return View("RequestAssignIP", viewmodel);
                }
            }
            return View(requesttype);
        }

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
                    //get appointment time
                    string dateOnly = viewmodel.AppointmentTime.ToString(Constants.Format.DATE);
                    string time = DateTime.Parse(viewmodel.Time).ToString(Constants.Format.TIME);
                    string datetime = dateOnly + ' ' + time;
                    viewmodel.AppointmentTime = DateTime.Parse(datetime);

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
                        //update status of a rack
                        var updateRackStatus = RackDAO.Current.Query(x => x.RackCode == item).FirstOrDefault();
                        Rack rack = updateRackStatus;
                        rack.StatusCode = Constants.StatusCode.RACK_RETURNING;
                        RackDAO.Current.Update(rack);
                    }

                    //Add Log Request
                    LogChangedContent logRequest = new LogChangedContent
                    {
                        RequestCode = result,
                        TypeOfLog = Constants.TypeOfLog.LOG_RENT_RACK,
                        Object = Constants.Object.OBJECT_REQUEST,
                        ChangedValueOfObject = result,
                        ObjectStatus = Constants.StatusCode.REQUEST_SENDING
                    };
                    LogChangedContentBLO.Current.AddLog(logRequest);

                    //Add Log Rack status
                    foreach (var item in selected)
                    {
                        LogChangedContent logServer = new LogChangedContent
                        {
                            RequestCode = result,
                            TypeOfLog = Constants.TypeOfLog.LOG_RETURN_RACK,
                            Object = Constants.Object.OBJECT_RACK,
                            ChangedValueOfObject = item,
                            ObjectStatus = Constants.StatusCode.RACK_RETURNING,
                        };
                        LogChangedContentBLO.Current.AddLog(logServer);
                    }

                    //Notification
                    var notif = Mapper.Map<RequestReturnRackViewModel, NotificationExtendedModel>(viewmodel);
                    notif.RequestTypeName = Constants.RequestType.RACK_RETURN;
                    notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                    notif.RequestCode = result;
                    //dang ky ham cho client
                    NotifRegister(notif);
                }
            }
            return RedirectToAction("Index");
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

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult RequestAddServer(RequestAddServerViewModel viewmodel)
        {
            viewmodel.Customer = Constants.Test.CUSTOMER_MANHNH;
            //get appointment time
            string dateOnly = viewmodel.AppointmentTime.ToString("dd/MM/yyyy");
            string time = DateTime.Parse(viewmodel.Time).ToString("HH:mm:ss");
            string datetime = dateOnly + ' ' + time;
            viewmodel.AppointmentTime = DateTime.Parse(datetime);
            //Add request
            Request passRequest = new Request
            {
                Customer = viewmodel.Customer,
                Description = viewmodel.Description,
                AppointmentTime = viewmodel.AppointmentTime
            };
            string result = RequestBLO.Current.AddRequest(passRequest, Constants.RequestTypeCode.ADD_SERVER);

            //add server, trang thai server la waiting
            var server = Mapper.Map<RequestAddServerViewModel, Server>(viewmodel);
            string serverCode = ServerDAO.Current.AddServer(server);

            //lay thong tin attributes, đã lấy được, giờ tìm cách gộp 2 mảng song song
            List<string> attributeValues = viewmodel.AttributeValues;
            List<string> attributeCodes = viewmodel.SelectedAttributes;
            List<ServerAttribute> serverAttributes = new List<ServerAttribute>();
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
                ObjectStatus = Constants.StatusCode.REQUEST_SENDING
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
            };
            LogChangedContentBLO.Current.AddLog(logServer);

            //Notification
            var notif = Mapper.Map<RequestAddServerViewModel, NotificationExtendedModel>(viewmodel);
            notif.RequestTypeName = Constants.RequestType.SERVER_ADD;
            notif.StatusName = Constants.StatusName.REQUEST_SENDING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);
            return RedirectToAction("Index");
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
                    ChangedValueOfObject = result
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
                        ObjectStatus = Constants.StatusCode.IP_USED,
                        ServerCode = viewmodel.SelectedServerCode,
                    };
                    LogChangedContentBLO.Current.AddLog(logIps);
                    //update serverIP IsReturned
                    var statusObject = ServerIPDAO.Current.Query(x => x.CurrentIP == item).FirstOrDefault();
                    ServerIPDAO.Current.Update(statusObject);
                }
                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestType.IP_RETURN;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult FetchIPs(RequestIPViewModel model)
        {
            var list = ServerIPDAO.Current.Query(x => x.ServerCode == model.SelectedServerCode
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
                string description = viewmodel.IpNumber.ToString();
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
                    ServerCode = viewmodel.SelectedServerCode,

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
            return RedirectToAction("Index");
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
                    ChangedValueOfObject = result
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
                        TypeOfLog = Constants.TypeOfLog.LOG_CHANGE_IP,
                        Object = Constants.Object.OBJECT_IP,
                        ChangedValueOfObject = item,
                        //object status
                        ObjectStatus = Constants.StatusCode.IP_USED,
                        ServerCode = viewmodel.SelectedServerCode,
                    };
                    LogChangedContentBLO.Current.AddLog(logIps);
                    //update serverIP IsReturned
                    var statusObject = ServerIPDAO.Current.Query(x => x.CurrentIP == item).FirstOrDefault();
                    ServerIPDAO.Current.Update(statusObject);
                }
                //Notification
                var notif = Mapper.Map<RequestIPViewModel, NotificationExtendedModel>(viewmodel);
                notif.RequestTypeName = Constants.RequestType.IP_CHANGE;
                notif.StatusName = Constants.StatusName.REQUEST_SENDING;
                notif.RequestCode = result;
                //dang ky ham cho client
                NotifRegister(notif);
            }
            return RedirectToAction("Index");
        }
        //DOING
        [HttpPost]
        public ActionResult RequestUpgradeServer()
        {
            return RedirectToAction("Index");
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

        public ActionResult Notification()
        {
            return View();
        }

        //Tam thoi cho VIew notification se dan den requestdetail --> thuc te thi view list notification chi dua ra popup thong tin de xem or confirm
        public ActionResult ListNotifications()
        {
            NotificationViewModel viewmodel = new NotificationViewModel();
            viewmodel.NotificationList = RequestBLO.Current.ListAllNotification();
            return View("Notification", viewmodel);
        }

        [HttpGet]
        public ActionResult RequestDetais(string rType, string rCode)
        {
            //DOING
            if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
            {
                return View("ProcessRequestAddServer");
            }
            //DOING
            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestBLO.Current.GetRequestByRequestCode(rCode);
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    //Lay so luong IP muon assign, tam thoi fix cung
                    var ipNumber = Constants.Number.NUMBER_5;
                    viewmodel.IpNumber = ipNumber;
                    //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                    var serverCode = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode);
                    viewmodel.SelectedServer = serverCode;
                    //Lay list available ip cung vung
                    var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(serverCode);
                    if (listAvailableIps.Count > ipNumber)
                    {
                        //selected values
                        var randomList = IPAddressPoolBLO.Current.SelectRandomIps(listAvailableIps, 3);
                        viewmodel.Ips = randomList;
                        //cho hien thi multiple list
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
                return View("ProcessRequestAssignIP", viewmodel);
            }
            //DOING
            if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
            {
                return View("ProcessRequestChangeIP");
            }

            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                RequestIPViewModel viewmodel = new RequestIPViewModel();
                var request = RequestDAO.Current.Query(x => x.RequestCode == rCode).FirstOrDefault();
                if (request != null)
                {
                    viewmodel = Mapper.Map<Request, RequestIPViewModel>(request);
                    //List returning IPs
                    viewmodel.Ips = LogChangedContentBLO.Current.GetIpRequestReturnIp(rCode);
                }
                return View("ProcessRequestReturnIP", viewmodel);
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
                return View("ProcessRequestReturnRack");
            }
            return RedirectToAction("ListNotifications");
        }

        [HttpPost]
        public ActionResult ProcessRequestAddServer()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(RequestRentRackViewModel viewmodel)
        {

            //Change request status, tu 
            RequestBLO.Current.LogUpdateRequestStatus(Constants.StatusCode.REQUEST_DONE, viewmodel.RequestCode);

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
        public ActionResult ProcessRequesReturnIp(RequestIPViewModel viewmodel)
        {
            //Change request status 
            RequestBLO.Current.LogUpdateRequestStatus(Constants.StatusCode.REQUEST_DONE, viewmodel.RequestCode);

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

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(RequestIPViewModel viewmodel)
        {
            //Change request status 
            RequestBLO.Current.LogUpdateRequestStatus(Constants.StatusCode.REQUEST_DONE, viewmodel.RequestCode);

            //add ip vo serverip
            foreach (var item in viewmodel.Ips)
            {
                var serverIp = new ServerIP
                {
                    StatusCode = Constants.StatusCode.SERVERIP_CURRENT,
                    AssignedDate = DateTime.Now,
                    CurrentIP = item,
                    PreviousId = 0,
                    ServerCode = viewmodel.SelectedServer
                };
                ServerIPBLO.Current.Add(serverIp);
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

        [HttpPost]
        public ActionResult ProcessRequestChangeIp(RequestIPViewModel viewmodel)
        {
            return View();
        }
    }
}
