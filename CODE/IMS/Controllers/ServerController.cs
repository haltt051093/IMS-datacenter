using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Models;

namespace IMS.Controllers
{
    public class ServerController : Controller
    {
        // GET: Server
        public ActionResult Index2()
        {
            return View();
        }
        public ActionResult Index(string statusSearch, string makerSearch, string rackSearch, string searchString)
        {
            var server = ServerBLO.Current.GetAllServer();
            var data = new ServerIndexViewModel();

            //list status
            var currentstatus = StatusBLO.Current.GetAll().Where(x => x.Object.Trim() == "Request").Select(x => x.Status1);
            ViewBag.statusSearch = new SelectList(currentstatus);
            //list maker
            var makers = new List<string>();
            var currentmaker = server.OrderBy(x => x.Maker).Select(x => x.Maker.Trim()).ToList();
            makers.AddRange(currentmaker.Distinct());
            ViewBag.makerSearch = new SelectList(makers);
            //list rack
            var currentrack = RackBLO.Current.GetAll().OrderBy(x => x.RackCode).Select(x => x.RackName);
            ViewBag.rackSearch = new SelectList(currentrack);

            if (!String.IsNullOrEmpty(searchString))
            {
                server = server.Where(s => s.Customer.Contains(searchString.Trim())).ToList();
            }
            if (!String.IsNullOrWhiteSpace(rackSearch))
            {
                Rack result = new Rack();
                result.RackName = rackSearch;
                var rackcode = RackBLO.Current.GetByName(result).RackCode;
                server = server.Where(r => r.RackCode.Trim() == rackcode.Trim()).ToList();
            }
            if (!String.IsNullOrEmpty(makerSearch))
            {
                server = server.Where(m => m.Maker.Trim() == makerSearch.Trim()).ToList();
            }
            if (!String.IsNullOrEmpty(statusSearch))
            {
                var searchedStatus = StatusDAO.Current.Query(x => x.Status1 == statusSearch)
                    .Select(x => x.StatusCode).FirstOrDefault();
                server = server.Where(st => st.Status.Trim() == searchedStatus).ToList();
            }
            data.Servers = server;
            return View(data);
        }

        // GET: Server/Details
        public ActionResult ServerDetails(int id)
        {
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
