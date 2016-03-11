using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{
    public class HomeController : CoreController
    {
        [HttpGet]
        [Authorize(Roles = "Staff,Shift Head,Manager,Customer")]
        public ActionResult Index(HomeIndexViewModel q)
        {
            return View();
        }

        [ChildActionOnly]
        public PartialViewResult Header()
        {
            var data = new HomeHeaderViewModel();
            data.Account = GetCurrentAccount();
            return PartialView(data);
        }

        [ChildActionOnly]
        public PartialViewResult Sidebar()
        {
            var data = new HomeSidebarViewModel();
            data.Account = GetCurrentAccount();
            return PartialView(data);
        }
    }
}