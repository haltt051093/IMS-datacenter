using System.Linq;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    [AllowAnonymous]
    public class HomeController : CoreController
    {
        [Authorize(Roles = "Staff,Shift Head,Manager,Customer")]
        [HttpGet]
        public ActionResult Index(HomeIndexViewModel q)
        {
            if (Session[Constants.Session.USER_LOGIN] == null)
            {
                return View("../Account/Login");
            }
            else
            {
                return View();
            }
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