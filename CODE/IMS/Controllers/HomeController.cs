using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            //var allAccount = AccountBLO.Current.GetAll();
            //var allServer = ServerBLO.Current.GetServers();
            //var data = new HomeIndexViewModel
            //{
            //    Servers = allServer
            //};
            //return View(data);
            return View();
        }
    }
}