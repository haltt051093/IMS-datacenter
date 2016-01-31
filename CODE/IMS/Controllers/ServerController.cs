using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using AutoMapper.Internal;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Models;

namespace IMS.Controllers
{
    public class ServerController : Controller
    {
        // GET: Server
        public ActionResult Index(string StatusSearch, string MakerSearch, string RackSearch, string searchString)
        {
            var server = ServerBLO.Current.GetAllServer();
            var data = new ServerIndexViewModel();

            //list status
            var status = new List<string>();
            var currentstatus = server.OrderBy(x => x.Status).Select(x => x.Status).ToList();
            status.AddRange(currentstatus.Distinct());
            ViewBag.StatusSearch = new SelectList(status);
            //list maker
            var makers = new List<string>();
            var currentmaker = server.OrderBy(x => x.Maker).Select(x => x.Maker).ToList();
            makers.AddRange(currentmaker.Distinct());
            ViewBag.MakerSearch = new SelectList(makers);
            //list rack
            var racks = new List<string>();
            var currentrack = server.OrderBy(x => x.RackCode).Select(x => x.RackCode).ToList();
            racks.AddRange(currentrack.Distinct());
            ViewBag.RackSearch = new SelectList(racks);

            if (!String.IsNullOrEmpty(searchString))
            {
                server = server.Where(s => s.Customer.Contains(searchString.Trim())).ToList();
            }
            if (!String.IsNullOrWhiteSpace(RackSearch))
            {
                server = server.Where(r => r.RackCode.Trim() == RackSearch.Trim()).ToList();
            }
            if (!String.IsNullOrEmpty(MakerSearch))
            {
                server = server.Where(m => m.Maker.Trim() == MakerSearch.Trim()).ToList();
            }
            if (!String.IsNullOrEmpty(StatusSearch))
            {
                server = server.Where(st => st.Status.Trim() == StatusSearch.Trim()).ToList();
            }
            data.Servers = server;
            return View(data);
        }

        // GET: Server/Details
        public ActionResult ServerDetails(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var server = ServerBLO.Current.GetServerById(id);
            var serverattributes = ServerBLO.Current.GetServerAttributes(id);
            var servercurrentips = ServerBLO.Current.GetCurrentIP(id);
            if (server == null)
            {
                return HttpNotFound();
            }
            var data = new ServerDetailsViewModel();
            data.Attributes = serverattributes;
            data.Server = server;
            data.CurrentIPs = servercurrentips;
            return View(data);
        }
    }
}
