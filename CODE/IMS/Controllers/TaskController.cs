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
        public ActionResult UpdateTaskStatus(string code)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                //foreach (var item in viewmodel.Tasks)
                //{
                //    if (item != null)
                //    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(code, Constants.StatusCode.TASK_DOING);
                //    }
                //}
            }
            if (Request.Form[Constants.FormAction.CANCEL_ACTION] != null)
            {
                //DOING
                //co note ghi ly do not finished --> note nay gui den shifthead o dau? ntn
                //foreach (var item in viewmodel.Tasks)
                //{
                //    if (item != null)
                //    {
                //        //update task
                //        TaskBLO.Current.UpdateTaskStatus(item.RequestCode, Constants.StatusCode.TASK_NOTFINISH);
                //    }
                //}
            }
            return RedirectToAction("Index");
        }
    }
}
