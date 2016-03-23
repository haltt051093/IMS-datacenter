using System.Web.Mvc;
using IMS.Data.Business;
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
    }
}
