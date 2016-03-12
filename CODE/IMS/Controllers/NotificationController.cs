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
    public class NotificationController : CoreController
    {
        //Tam thoi cho VIew notification se dan den requestdetail --> thuc te thi view list notification chi dua ra popup thong tin de xem or confirm
        [Authorize]
        public ActionResult Index()
        {
            var userName = GetCurrentUserName();
            var role = GetCurrentUserRole();

            var data = new NotificationViewModel();

            data.FilterByRequestType = RequestTypeBLO.Current
                .GetAll()
                .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
                .ToList();
            data.FilterByStatus = StatusBLO.Current
                .GetStatusByObject(Constants.Object.OBJECT_REQUEST)
                .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                .ToList();

            data.NotificationList = RequestBLO.Current.ListNotification(role, userName);
            return View(data);
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