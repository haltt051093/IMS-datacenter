using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    [Roles(Constants.Role.STAFF)]
    public class TaskController : CoreController
    {
        public ActionResult Index(string code)
        {
            var staff = GetCurrentUserName();
            var data = new TaskIndexViewModel();
            data.Tasks = TaskBLO.Current.ListTaskOfStaff(staff);
            data.FilterByRequestType = RequestTypeBLO.Current
                .GetAll()
                .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
                .ToList();
            data.FilterByStatus = StatusBLO.Current
                .GetStatusByObject(Constants.Object.OBJECT_TASK)
                .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                .ToList();
            data.FilterByPeriodOfTime = new List<SelectListItem>
            {
                new SelectListItem() {Value = "0", Text = "Today", Selected = true },
                new SelectListItem() {Value = "7", Text = "One Week"},
                new SelectListItem() {Value = "30", Text = "One Month"},
                new SelectListItem() {Value = "99999", Text = "All"}
            };
            return View(data);
        }
        #region accept task
        public ActionResult AcceptTask(string requestCode, string taskCode)
        {
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_DOING);
            return RedirectToAction("Detail", "ProcessRequest",
                new { code = requestCode, msg = Constants.Message.ACCEPT_TASK });
        }
        #endregion

        #region not finish task
        [HttpPost]
        public ActionResult NotFinishTask(string reason, string taskcode, string requestcode)
        {
            var result = RequestBLO.Current.NotFinishRequest(taskcode, reason);
            Notify(result.NotificationCodes);
            return RedirectToAction("Detail", "ProcessRequest",
               new { code = requestcode, msg = Constants.Message.NOT_FINISHED_TASK });
        }
        #endregion
    }
}
