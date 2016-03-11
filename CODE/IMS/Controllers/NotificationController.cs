using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Models;

namespace IMS.Controllers
{
    public class NotificationController : Controller
    {
        //Tam thoi cho VIew notification se dan den requestdetail --> thuc te thi view list notification chi dua ra popup thong tin de xem or confirm
        [Authorize]
        public ActionResult Index()
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
            return View(viewmodel);
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
            return RedirectToAction("Index");
        }
    }
}