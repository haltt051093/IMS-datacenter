using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class ServerController : CoreController
    {
        public ActionResult Index()
        {
            var servers = ServerBLO.Current.GetAllServer();
            //get requests cua server
            var data = new ServerIndexViewModel();
            foreach (var item in servers)
            {
                var requestOfServer = LogChangedContentBLO.Current.ListWaitingRequestOfServer(item.ServerCode);
                item.Requests = requestOfServer;
            }
            data.Servers = servers;
            return View(data);
        }

        // GET: Server/Details
        public ActionResult ServerDetails(string serverCode, string RackSearch)
        {
            var server = ServerBLO.Current.GetServerByCode(serverCode);
            //var serverattributes = ServerBLO.Current.GetServerAttributes(serverCode);
            var servercurrentips = ServerBLO.Current.GetCurrentIP(serverCode);
            if (server == null)
            {
                return HttpNotFound();
            }
            var data = new ServerDetailsViewModel();
            //them list location
            data.Locations = LocationBLO.Current.GetLocationsOfServer(server.ServerCode);
            //data.Attributes = serverattributes;
            data.Server = server;
            data.CurrentIPs = servercurrentips;

            var locations = LocationBLO.Current.GetChangeLocation(server);
         
            var racks = new List<string>();
            var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
            racks.AddRange(currentrack.Distinct());
            ViewBag.RackSearch = new SelectList(racks);
            if (!String.IsNullOrWhiteSpace(RackSearch))
            {
                locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
            }
            data.Locations1 = locations;
            return View(data);
        }
    }
}
