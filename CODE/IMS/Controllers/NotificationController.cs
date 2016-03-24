using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Models;
using IMS.Services;

namespace IMS.Controllers
{
    public class NotificationController : CoreController
    {
        [Authorize]
        public ActionResult Index()
        {
            var userName = GetCurrentUserName();
            var data = new NotificationViewModel();
            //data.FilterByRequestType = RequestTypeBLO.Current
            //    .GetAll()
            //    .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
            //    .ToList();
            //data.FilterByStatus = StatusBLO.Current
            //    .GetStatusByObject(Constants.Object.OBJECT_REQUEST)
            //    .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
            //    .ToList();
            data.NotificationList = NotificationBLO.Current.ListNotification(userName);
            return View(data);
        }

        public ActionResult Detail(string code)
        {
            var notif = NotificationBLO.Current.GetByKeys(new Notification { NotificationCode = code });
            if (notif == null)
            {
                return View();
            }

            notif.IsViewed = true;
            NotificationBLO.Current.Update(notif);
            if (GetCurrentUserRole() == Constants.Role.CUSTOMER)
            {
                return RedirectToAction("Detail", "Request", new { code = notif.RefCode });
            }
            else
            {
                return RedirectToAction("Detail", "ProcessRequest", new { code = notif.RefCode });
            }
            //return View();
        }


        [HttpPost]
        public JsonResult Notify(NotificationNotifyViewModel q)
        {
            RemoteControllerHub.Current.Clients.User(q.Username).NotifyTest(q.Message);
            //RemoteControllerHub.Current.Clients.All.Notify(q.Message);
            return Json(true);
        }
    }
}