using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;

namespace IMS.Controllers
{
    public class TaskController : CoreController
    {
        public ActionResult Index(string code)
        {
            var staff = GetCurrentUserName();
            var data = new TaskIndexViewModel();
            data.Tasks = TaskBLO.Current.ListTaskOfStaff(staff);
            return View(data);
        }

        [HttpPost]
        public ActionResult UpdateTaskStatus(TaskIndexViewModel viewmodel)
        {
            if (viewmodel.Action == Constants.FormAction.ACCEPT_ACTION)
            {
                //update task
                TaskBLO.Current.UpdateTaskStatus(viewmodel.TaskCode, Constants.StatusCode.TASK_DOING);
                //khi task la doing thi shifthead
            }
            if (viewmodel.Action == Constants.FormAction.CANCEL_ACTION)
            {
                //DOING
                //co note ghi ly do not finished --> note nay gui den shifthead o dau? ntn
                //update task
                TaskBLO.Current.UpdateTaskStatus(viewmodel.TaskCode, Constants.StatusCode.TASK_NOTFINISH);
            }
            return RedirectToAction("Index");
        }
    }
}
