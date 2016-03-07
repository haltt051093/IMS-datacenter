using System.Linq;
using System.Web.Mvc;
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
            return View();
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