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
            //data.FilterByRequestType = RequestTypeBLO.Current
            //    .GetAll()
            //    .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
            //    .ToList();
            //data.FilterByStatus = StatusBLO.Current
            //    .GetStatusByObject(Constants.Object.OBJECT_REQUEST)
            //    .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
            //    .ToList();
            data.NotificationList = RequestBLO.Current.ListNotification(role, userName);
            return View(data);
        }

        
    }
}