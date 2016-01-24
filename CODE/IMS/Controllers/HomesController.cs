using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Controllers
{
    public class HomesController : Controller
    {
        // GET: Homes
        public ActionResult Index()
        {
            return View();
        }
    }
}