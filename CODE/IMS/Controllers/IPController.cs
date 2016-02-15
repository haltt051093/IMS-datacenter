using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Data.Repository;
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
            var currentstatus = IPAddressPoolBLO.Current.GetIPStatus().ToList();
            status.AddRange(currentstatus.Distinct());
            ViewBag.StatusSearch = new SelectList(status);

            var gateways = new List<string>();
            var currentgateway = ips.OrderBy(x => x.Gateway).Select(x => x.Gateway).ToList();
            gateways.AddRange(currentgateway.Distinct());
            ViewBag.GatewaySearch = new SelectList(gateways);

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
                var gateway = IPAddressPoolBLO.Current.GenerateIP(icvm.IP, icvm.BitCount).FirstOrDefault().Gateway;
                var exist = IPAddressPoolDAO.Current.Query(x => x.Gateway == gateway);
                if (exist.Count > 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                else
                {
                    IPAddressPoolBLO.Current.AddIP(ips);
                    return RedirectToAction("Index");
                }
            }
            return View(icvm);
        }
        public ActionResult AssignIP(string request, string IP, string servercode, string GatewaySearch)
        {
            IP = "192.168.0.1";
            //request = "Change";
            request = "AddIPForNewServer";
            //request = "AssignMoreIP";
            servercode = "BJIWEHDHQ";
            if (request == "Change")
            {
                string gateway = IPAddressPoolBLO.Current.GetGatewayByIP(IP);
                var data = new IPIndexViewModel();
                data.IPs = IPAddressPoolBLO.Current.GetIPSameGateway(gateway);
                data.OldIP = IP;
                data.Request = request;
                data.ListNewIP = data.IPs.Select(x => new SelectListItem
                {
                    Value = x.IPAddress
                }).ToList();
                return View(data);
            }
            else if (request == "AddIPForNewServer")
            {
                var data = new IPIndexViewModel();
                var ips = IPAddressPoolBLO.Current.GetIPAvailable();
                data.ServerCode = servercode;
                data.Request = request;
                data.ListNewIP = data.IPs.Select(x => new SelectListItem
                {
                    Value = x.IPAddress
                }).ToList();
                var gateways = new List<string>();
                var currentgateway = ips.OrderBy(x => x.Gateway).Select(x => x.Gateway).ToList();
                gateways.AddRange(currentgateway.Distinct());
                ViewBag.GatewaySearch = new SelectList(gateways);

                if (!String.IsNullOrWhiteSpace(GatewaySearch))
                {
                    ips = ips.Where(r => r.Gateway.Trim() == GatewaySearch.Trim()).ToList();
                }
                data.IPs = ips;
                return View(data);
            }
            else
            {
                var data = new IPIndexViewModel();
                string gateway = IPAddressPoolBLO.Current.GetGatewayByServerCode(servercode);
                data.IPs = IPAddressPoolBLO.Current.GetIPSameGateway(gateway);
                data.Request = request;
                data.ServerCode = servercode;
                data.ListNewIP = data.IPs.Select(x => new SelectListItem
                {
                    Value = x.IPAddress
                }).ToList();
                return View(data);
            }
        }

        [HttpPost]
        public ActionResult AssignIP(IPIndexViewModel ivm)
        {
            var listNewIP = new List<string>();
            if (ivm.Request.Equals("Change"))
            {
                if (ivm.NewIP == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            }
            if (ivm.Request.Equals("AddIPForNewServer"))
            {
                if (ivm.NewIP == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            }
            if (ivm.Request.Equals("AssignMoreIP"))
            {
                for (int i = 0; i < ivm.ListNewIP.Count; i++)
                {
                    if (ivm.ListNewIP[i].Selected == true)
                    {
                        listNewIP.Add(ivm.ListNewIP[i].Value);
                    }
                }
                int j = 0;
                for (int i = 0; i < ivm.ListNewIP.Count; i++)
                {
                    if (ivm.ListNewIP[i].Selected == true)
                    {
                        j++;
                    }
                }
                if (j == 0)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
            }


            bool x = IPAddressPoolBLO.Current.UpdateIP(ivm.ServerCode, ivm.OldIP, ivm.NewIP, listNewIP, ivm.Request);
            if (x)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("AssignIP");
            }
        }
    }
}