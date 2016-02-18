using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using Microsoft.Ajax.Utilities;
using Microsoft.AspNet.SignalR;

namespace IMS.Controllers
{
    public class RequestController : Controller
    {
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
                    RequestReturnIPViewModel viewmodel = new RequestReturnIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    viewmodel.Servers = listServers.Select(x => new SelectListItem
                    {
                        Value = x.ServerCode,
                        Text = x.Model
                    }).ToList();
                    return View("RequestReturnIP", viewmodel);
                }
                //DOING
                if (requestcode.Equals(Constants.RequestTypeCode.CHANGE_IP))
                {
                    RequestReturnIPViewModel viewmodel = new RequestReturnIPViewModel();
                    return View("RequestReturnIP", viewmodel);
                }
                //DOING
                if (requestcode.Equals(Constants.RequestTypeCode.ASSIGN_IP))
                {
                    RequestReturnIPViewModel viewmodel = new RequestReturnIPViewModel();
                    return View("RequestReturnIP", viewmodel);
                }
            }
            return View(requesttype);
        }

        [HttpPost]
        public ActionResult RequestReturnRack(RequestReturnRackViewModel viewmodel)
        {
            if (ModelState.IsValid)
            {
                var number = viewmodel.RackOfCustomer.Count();
                var selected = viewmodel.RackOfCustomer.Where(x => x.Selected).Select(x => x.Value).ToArray();
                if (number != 0)
                {
                    //get appointment time
                    string dateOnly = viewmodel.AppointmentTime.ToString("dd/MM/yyyy");
                    string time = DateTime.Parse(viewmodel.Time).ToString("HH:mm:ss");
                    string datetime = dateOnly + ' ' + time;
                    viewmodel.AppointmentTime = DateTime.Parse(datetime);

                    //Add request
                    Request passRequest = new Request
                    {
                        Customer = Constants.Test.CUSTOMER_MANHNH,
                        Description = viewmodel.Description
                    };
                    string result = RequestBLO.Current.AddRequestReturnRack(passRequest);

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
                        ObjectStatus = Constants.StatusCode.REQUEST_WAITING,
                        LogTime = DateTime.Now
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
                            LogTime = DateTime.Now,
                            PreviousId = 0
                        };
                        LogChangedContentBLO.Current.AddLog(logServer);
                    }

                    //Notification
                    var notif = Mapper.Map<RequestReturnRackViewModel, NotificationExtendedModel>(viewmodel);
                    notif.TypeOfRequest = Constants.RequestType.RACK_RETURN;
                    notif.Customer = Constants.Test.CUSTOMER_MANHNH;
                    notif.RequestStatus = Constants.StatusName.REQUEST_WAITING;
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
                Customer = Constants.Test.CUSTOMER_MANHNH,
                Description = totalDes.ToString()
            };
            string result = RequestBLO.Current.AddRequestRentRacks(passRequest);

            //log lai thoi diem thay doi trang thai request
            LogChangedContent requestmodel = new LogChangedContent
            {
                RequestCode = result,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = Constants.StatusCode.REQUEST_WAITING,
                TypeOfLog = Constants.TypeOfLog.LOG_RENT_RACK,
                LogTime = DateTime.Now
            };
            LogChangedContentBLO.Current.AddLog(requestmodel);

            //Notification
            var notif = Mapper.Map<RequestRentRackViewModel, NotificationExtendedModel>(viewmodel);
            notif.TypeOfRequest = Constants.RequestType.RACK_RENT;
            notif.Customer = Constants.Test.CUSTOMER_MANHNH;
            notif.RequestStatus = Constants.StatusName.REQUEST_WAITING;
            notif.RequestCode = result;
            //dang ky ham cho client
            NotifRegister(notif);

            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult RequestAddServer(RequestAddServerViewModel viewmodel)
        {
            //get appointment time
            string dateOnly = viewmodel.AppointmentTime.ToString("dd/MM/yyyy");
            string time = DateTime.Parse(viewmodel.Time).ToString("HH:mm:ss");
            string datetime = dateOnly + ' ' + time;
            viewmodel.AppointmentTime = DateTime.Parse(datetime);
            //Add request
            Request passRequest = new Request
            {
                Customer = Constants.Test.CUSTOMER_MANHNH,
                Description = viewmodel.Description,
                AppointmentTime = viewmodel.AppointmentTime
            };
            string result = RequestBLO.Current.AddRequestAddServer(passRequest);

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
                ObjectStatus = Constants.StatusCode.REQUEST_WAITING,
                LogTime = DateTime.Now
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
                LogTime = DateTime.Now,
                PreviousId = 0
            };
            LogChangedContentBLO.Current.AddLog(logServer);

            return RedirectToAction("Index");
        }

        //DOING 1
        [HttpPost]
        public ActionResult RequestReturnIP(RequestReturnIPViewModel viewmodel)
        {
            var test = viewmodel.ServerIPs;
            //for (int i = 0; i < test.Count; i++)
            //{
            //    var count = i;
            //    count++;
            //}
            // lam tuong tu request return rack
            // thay doi bang ServerIP
            // Cap nhat lai trang thai IP o bang IPAddressPool
            //Neu tra IP la default IP thi cap nhat lai bang Server
            return RedirectToAction("Index");
        }

        public ActionResult FetchIPs(RequestReturnIPViewModel model)
        {
            var list = ServerIPDAO.Current.Query(x => x.ServerCode == model.SelectedServerCode).ToList();
            RequestReturnIPViewModel newmodel = new RequestReturnIPViewModel();
            newmodel.ServerIPs = list;
            return PartialView("_ListServerIP", newmodel);
        }

        //DOING
        [HttpPost]
        public ActionResult RequestUpgradeServer()
        {
            return RedirectToActionPermanent("Index", "Server");
        }

        public void NotifRegister(NotificationExtendedModel model)
        {
            if (commandHubContext == null)
            {
                commandHubContext = GlobalHost.ConnectionManager.GetHubContext<RemoteControllerHub>();
            }
            commandHubContext.Clients.All.ExecuteCommand(
                model.RequestCode,
                model.TypeOfRequest,
                model.Customer,
                model.Description,
                model.AppointmentTime,
                model.RequestStatus);
        }

        public ActionResult Notification()
        {
            return View();
        }

        public ActionResult ListNotifications()
        {
            NotificationViewModel viewmodel = new NotificationViewModel();
            //doing
            return View("Notification", viewmodel);
        }
    }
}
