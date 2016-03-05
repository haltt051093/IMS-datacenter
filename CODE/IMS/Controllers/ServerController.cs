using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mime;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.ViewModels;
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
            data.Server = new ServerExtendedModel();
            return View(data);
        }

        // GET: Server/Details
        public ActionResult Detail(string code)
        {
            var server = ServerBLO.Current.GetServerByCode(code);
            //var serverattributes = ServerBLO.Current.GetServerAttributes(serverCode);
            var servercurrentips = ServerBLO.Current.GetCurrentIP(code);
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
         
            var listrack = locations.OrderBy(x => x.RackName).GroupBy(x=>x.RackName).Select(x=>x.FirstOrDefault());
            data.Racks = listrack.Select(x => new SelectListItem
            {
                Value = x.RackCode,
                Text = x.RackName
            }).ToList();           
            
            data.Locations1 = locations;
            data.ServerCode = code;
            return View(data);
        }

        [HttpPost]
        public ActionResult ServerDetails(ServerDetailsViewModel sdvm)
        {
            if (sdvm.LocationCode == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bool x = LocationBLO.Current.UpdateLocation(sdvm.Server.Size, sdvm.Server.ServerCode, sdvm.LocationCode, "Change");
            if (x)
            {
                return RedirectToAction("ServerDetails");
            }
            else
            {
                return RedirectToAction("ServerDetails");
            }

        }

        [HttpGet]
        public ActionResult GetLocationByRackName(ServerDetailsViewModel model)
        {
            Server s = new Server();
            s.ServerCode = model.ServerCode;
            s.Power = model.Power;
            s.Customer = model.Customer;
            var locations = LocationBLO.Current.GetChangeLocation(s);
            var data = new ServerDetailsViewModel();
            if (!String.IsNullOrWhiteSpace(model.SelectedRack))
            {
                locations = locations.Where(r => r.RackName.Trim() == model.SelectedRack.Trim()).ToList();
            }
            data.Locations1 = locations;

            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}
