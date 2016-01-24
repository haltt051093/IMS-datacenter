using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;

namespace IMS.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var allAccount = AccountBLO.Current.GetAll();
            var allServer = ServerBLO.Current.GetAll();

            return View();
        }
    }
}