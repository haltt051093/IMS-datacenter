using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Queries;
using IMS.Data.Repository;
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
                item.Requests = LogChangedContentBLO.Current.ListWaitingRequestOfServer(item.ServerCode);
            }
            var listStatus = StatusBLO.Current.GetStatusByObject(Constants.Object.OBJECT_SERVER);
            data.ServerStatus = listStatus
                        .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                        .ToList();
            data.Servers = servers;
            data.Server = new ServerExtendedModel();
            return View(data);
        }

        // GET: Server/Details
        public ActionResult Detail(string code)
        {
            var data = new ServerDetailsViewModel();
            data.Server = ServerBLO.Current.GetServerByCode(code, Constants.StatusCode.SERVER_RUNNING);
            //var serverattributes = ServerBLO.Current.GetServerAttributes(serverCode);
            data.CurrentIPs = ServerBLO.Current.GetCurrentIP(code);
            //them list location
            //data.Locations = LocationBLO.Current.GetLocationsOfServer(data.Server.ServerCode);
            //var locations = LocationBLO.Current.GetChangeLocation(data.Server);
            //var listrack = locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            //data.Racks = listrack.Select(x => new SelectListItem
            //{
            //    Value = x.RackCode,
            //    Text = x.RackName
            //}).ToList();
            //data.Locations1 = locations;
            data.ServerCode = code;
            //get customer
            data.CustomerInfo = AccountBLO.Current.GetAccountByCode(data.Server.Customer);
            return View(data);
        }

        [HttpPost]
        public ActionResult Detail(ServerDetailsViewModel sdvm)
        {

            var selectedLocationCodes = sdvm.Selected
                .Where(x => x.IsSelected)
                .Select(x => x.LocationCode)
                .ToList();
            if (selectedLocationCodes.Count == 0)
            {
                return View(sdvm);
            }
            var location = LocationBLO.Current.GetByModel(new Location { LocationCode = selectedLocationCodes[0] });
            if (location == null)
            {
                return View(sdvm);
            }

            var locations = LocationBLO.Current.GetAllLocation(new GetLocationQuery { RackCode = location.RackCode });
            var startIndex = -1;
            var endIndex = -1;
            for (var i = 0; i < locations.Count; i++)
            {
                var l = locations[i];
                if (startIndex == -1 && selectedLocationCodes.Contains(l.LocationCode))
                {
                    startIndex = i;
                }
                if (startIndex != -1 && selectedLocationCodes.Contains(l.LocationCode))
                {
                    endIndex = i;
                }
                if (startIndex != -1 && !selectedLocationCodes.Contains(l.LocationCode))
                {
                    break;
                }
            }

            if ((endIndex - startIndex + 1) != sdvm.Size || (locations[startIndex].ServerCode != null) || (locations[endIndex].ServerCode != null))
            {
                Alert("Change Location Fail!");
                return RedirectToAction("Detail", new { code = sdvm.ServerCode });
            }


            bool result = LocationBLO.Current.UpdateLocation(sdvm.ServerCode, selectedLocationCodes, "Change");
            if (result)
            {
                Success("Change Location Successfully!");
                return RedirectToAction("Detail", new { code = sdvm.ServerCode });
            }
            else
            {
                Alert("Change Location Fail!");
                return RedirectToAction("Detail", new { code = sdvm.ServerCode });
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
