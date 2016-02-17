using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
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
using Microsoft.AspNet.SignalR;

namespace IMS.Controllers
{
    public class RequestController : Controller
    {
        private static IHubContext commandHubContext;
        //DOING
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
                if (requestcode.Equals(Constants.RequestTypeCode.UPGRADE_SERVER))
                {
                    return View("RequestUpgradeServer");
                }
                if (requestcode.Equals(Constants.RequestTypeCode.RETURN_IP))
                {
                    RequestReturnIPViewModel viewmodel = new RequestReturnIPViewModel();
                    var listServers = ServerDAO.Current.Query(x => x.Customer == Constants.Test.CUSTOMER_MANHNH);
                    //viewmodel.Servers = ListServers;
                    viewmodel.Servers = listServers.Select(x => new SelectListItem
                    {
                        Value = x.ServerCode,
                        Text = x.Modern
                    }).ToList();
                    return View("RequestReturnIP", viewmodel);
                }
            }
            return View(requesttype);
        }

        [HttpPost]
        public ActionResult RequestReturnRack(RequestReturnRackViewModel viewModel)
        {
            if (ModelState.IsValid)
            {
                var number = viewModel.RackOfCustomer.Count();
                var selected = viewModel.RackOfCustomer.Where(x => x.Selected).Select(x => x.Value).ToArray();
                //update statuscode o rack
                //xoa rackId vua nhan duoc, o bang RackOfCustomer
                //de cho chac, tat ca gia tri o cot ServerCode o bang Location de null
                //Hien tai chua can luu log
                if (number != 0)
                {
                    foreach (var item in selected)
                    {
                        //update status of a rack
                        var updateRackStatus = RackDAO.Current.Query(x => x.RackCode == item).FirstOrDefault();
                        Rack rack = updateRackStatus;
                        rack.StatusCode = Constants.StatusCode.RACK_AVAILABLE;
                        RackDAO.Current.Update(rack);
                        //delete a raw in RackOfCustomer where rack is selected
                        var rc = RackOfCustomerDAO.Current.Query(x => x.RackCode == item).FirstOrDefault();
                        RackOfCustomer remove = rc;
                        RackOfCustomerDAO.Current.Remove(remove);
                        //
                    }
                }
            }
            return View(viewModel);
        }

        public ActionResult RequestRentRack(RequestRentRackViewModel viewmodel)
        {
            //map object
            var notif = Mapper.Map<RequestRentRackViewModel, NotificationExtendedModel>(viewmodel);
            notif.TypeOfRequest = Constants.TypeOfLog.LOG_UPDATE_STATUS_REQUEST;
            //Them request
            string result = RequestBLO.Current.AddRequestRentRacks(Constants.Test.CUSTOMER_MANHNH);

            //dang ky ham cho client
            if (commandHubContext == null)
            {
                commandHubContext = GlobalHost.ConnectionManager.GetHubContext<RemoteControllerHub>();
            }
            commandHubContext.Clients.All.ExecuteCommand(result,viewmodel.RackNumbers);

            //log lai thoi diem thay doi trang thai request
            LogChangedContent requestmodel = new LogChangedContent
            {
                RequestCode = result,
                Staff = Constants.Test.STAFF_NHI,
                Object = Constants.Object.OBJECT_REQUEST,
                ChangedValueOfObject = Constants.StatusCode.REQUEST_WAITING,
                TypeOfLog = Constants.TypeOfLog.LOG_UPDATE_STATUS_REQUEST,
                LogTime = DateTime.Now
            };
            LogChangedContentBLO.Current.AddLog(requestmodel);
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult RequestAddServer(RequestAddServerViewModel viewmodel)
        {
            //Add request
            Request passRequest = new Request();
            passRequest.Customer = Constants.Test.CUSTOMER_MANHNH;
            passRequest.AppointmentTime = viewmodel.AppointmentTime;
            passRequest.Description = viewmodel.Description;
            RequestBLO.Current.AddRequestAddServer(passRequest);

            //add server, trang thai server la waiting
            //tim cach map Server va RequestAddServerViewModel, giong ten, khong can giong thu tu?

            //add server attributes

            return RedirectToActionPermanent("Index", "Server");
        }

        [HttpPost]
        public ActionResult RequestReturnIP()
        {
            // lam tuong tu request return rack
            // thay doi bang ServerIP
            // Cap nhat lai trang thai IP o bang IPAddressPool
            //Neu tra IP la default IP thi cap nhat lai bang Server
            return RedirectToActionPermanent("Index", "Server");
        }

        //[HttpPost]
        public ActionResult FetchIPs(RequestReturnIPViewModel model)
        {
            var list = ServerIPDAO.Current.Query(x => x.ServerCode == model.SelectedServerCode).ToList();
            RequestReturnIPViewModel newmodel = new RequestReturnIPViewModel();
            newmodel.ServerIPs = list;
            //ServerIPViewModel newmodel = new ServerIPViewModel();
            //newmodel.ServerIPs = list;
            //model.ServerIPs = list;
            //return View("RequestReturnIP", model);
            return PartialView("_ListServerIP", newmodel);
        }

        [HttpPost]
        public ActionResult RequestUpgradeServer()
        {
            return RedirectToActionPermanent("Index", "Server");
        }

        public ActionResult Notification()
        {
            return View();
        }
    }
}
