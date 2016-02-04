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
        public ActionResult Index(string GatewaySearch, string StatusSearch)
        {
            var ips = IPAddressPoolBLO.Current.GetAllIP();
            var data = new IPIndexViewModel();

            var status = new List<string>();
            var currentstatus = ips.OrderBy(x => x.Status).Select(x => x.Status).ToList();
            status.AddRange(currentstatus.Distinct());
            ViewBag.StatusSearch = new SelectList(status);

            var racks = new List<string>();
            var currentgateway = ips.OrderBy(x => x.Gateway).Select(x => x.Gateway).ToList();
            racks.AddRange(currentgateway.Distinct());
            ViewBag.GatewaySearch = new SelectList(racks);

            if (!String.IsNullOrEmpty(StatusSearch))
            {
                ips = ips.Where(st => st.Status.Trim() == StatusSearch.Trim()).ToList();
            }

            if (!String.IsNullOrWhiteSpace(GatewaySearch))
            {
                ips = ips.Where(r => r.Gateway.Trim() == GatewaySearch.Trim()).ToList();
            }
            data.IPs = ips;
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