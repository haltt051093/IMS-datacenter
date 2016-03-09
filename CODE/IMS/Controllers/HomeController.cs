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
        public PartialViewResult Header(object role)
        {
            return PartialView(role);
        }

        [ChildActionOnly]
        public PartialViewResult Sidebar(object role)
        {
            return PartialView(role);
        }
    }
}