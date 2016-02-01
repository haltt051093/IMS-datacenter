using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class IPController : Controller
    {
        // GET: IP
        public ActionResult Index()
        {
            var data = new IPIndexViewModel();
            data.IPs = IPAddressPoolBLO.Current.GetAllIP();
            return View(data);
        }
        public ActionResult CreateIP()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateIP(IPCreateViewModel icvm)
        {
            if (ModelState.IsValid)
            {
                var ips = IPAddressPoolBLO.Current.GenerateIP(icvm.IP, icvm.BitCount);
                IPAddressPoolBLO.Current.AddIP(ips);
                return RedirectToAction("Index");
            }
            return View(icvm);
        }
    }
}