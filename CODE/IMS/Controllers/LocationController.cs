using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Queries;
using IMS.Models;

namespace IMS.Controllers
{
    public class LocationController : CoreController
    {
        [Authorize(Roles = "Staff,Shift Head,Manager")]
        public ActionResult Index()
        {
            var data = new LocationIndexViewModel();
            var locations = LocationBLO.Current.GetAllLocation();
            var list = locations.Where(x => x.RackStatus == Constants.StatusCode.RACK_AVAILABLE);
            var listavailablerack =
                list.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            data.RackAvailableCount = listavailablerack.Count();
            var listrack = locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            data.Racks = listrack.Select(x => new SelectListItem
            {
                Value = x.RackCode,
                Text = "Rack " + x.RackName
            }).ToList();

            var listpow = new List<SelectListItem>();
            int[] listp = new int[] {3, 4, 5, 6, 7, 8, 9, 10};
            foreach (var i in listp)
            {
                string num = (i).ToString();
                SelectListItem item = new SelectListItem()
                {
                    Value = num,
                    Text = num + "KW"
                };
                listpow.Add(item);
            }
            data.ListPower = listpow;
            data.Locations = locations;
            return View(data);
        }

        [HttpPost]
        public ActionResult Index(LocationIndexViewModel livm)
        {
            //if (IsAuthorized())
            //{
            if (ModelState.IsValid)
            {
                var rack = new Rack();
                rack.RackName = livm.RackName;
                rack.MaximumPower = livm.MaximumPower;
                RackBLO.Current.AddRackAndLocation(rack);

                Success("New Rack added successfully!");
                return RedirectToAction("Index");

            }
            return RedirectToAction("Index");
        }

        public ActionResult AssignLocation(string ServerCode, string rType, string rCode, int Size)
        {
            var data = new LocationIndexViewModel();
            data.Size = Size;
            var server = ServerBLO.Current.GetServerByCode(ServerCode, Constants.StatusCode.SERVER_WAITING);
            var locationserver = LocationBLO.Current.GetLocationsOfServer(ServerCode);
            if (locationserver.Count==0)
            {
                var locations = LocationBLO.Current.GetNewLocation(server);
                var listrack = locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
                data.Racks = listrack.Select(x => new SelectListItem
                {
                    Value = x.RackCode,
                    Text = x.RackName
                }).ToList();

            }
            data.RequestCode = rCode;
            data.RequestType = rType;
            data.ServerCode = ServerCode;
            //if (request == "Change")
            //{
            //    var locations = LocationBLO.Current.GetChangeLocation(s);
            //    data.Server = s;
            //    data.Request = request;
            //    var racks = new List<string>();
            //    var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
            //    racks.AddRange(currentrack.Distinct());
            //    ViewBag.RackSearch = new SelectList(racks);
            //    if (!String.IsNullOrWhiteSpace(RackSearch))
            //    {
            //        locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
            //    }
            //    data.Locations = locations;
            //    return View(data);
            //}
            ////Get locations available for new server
            //else
            //{
            //    var locations = LocationBLO.Current.GetNewLocation(s);
            //    data.Server = s;
            //    data.Request = request;
            //    var racks = new List<string>();
            //    var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
            //    racks.AddRange(currentrack.Distinct());
            //    ViewBag.RackSearch = new SelectList(racks);
            //    if (!String.IsNullOrWhiteSpace(RackSearch))
            //    {
            //        locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
            //    }
            //    data.Locations = locations;
            return View(data);

            // }
            //}

            //[HttpPost]
            //public ActionResult AssignLocation(LocationIndexViewModel livm)
            //{
            //    if (livm.LocationCode == null)
            //    {
            //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            //    }
            //    bool x = LocationBLO.Current.UpdateLocation(livm.Server.Size, livm.Server.ServerCode, livm.LocationCode, livm.Request);
            //    if (x)
            //    {
            //        return RedirectToAction("Index");
            //    }
            //    else
            //    {
            //        return RedirectToAction("AssignLocation");
            //    }

            //}

        }

        [HttpPost]
        public ActionResult AssignLocation(LocationIndexViewModel livm)
        {
            var selectedLocationCodes = livm.Selected
     .Where(x => x.IsSelected)
     .Select(x => x.LocationCode)
     .ToList();
            if (selectedLocationCodes.Count == 0)
            {
                return View(livm);
            }
            var location = LocationBLO.Current.GetByModel(new Location { LocationCode = selectedLocationCodes[0] });
            if (location == null)
            {
                return View(livm);
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

            if ((endIndex - startIndex + 1) != livm.Size || (locations[startIndex].ServerCode != null) || (locations[endIndex].ServerCode != null))
            {
                Alert("Assign Location Fail!");
                return RedirectToAction("Detais","ProcessRequest", new { rType = livm.RequestType,rCode = livm.RequestCode });
            }


            bool result = LocationBLO.Current.UpdateLocation(livm.ServerCode, selectedLocationCodes, "Change");
            if (result)
            {
                return RedirectToAction("Detais", "ProcessRequest", new { rType = livm.RequestType, rCode = livm.RequestCode });
            }
            else
            {
                Alert("Assign Location Fail!");
                return RedirectToAction("Detais", "ProcessRequest", new { rType = livm.RequestType, rCode = livm.RequestCode });
            }
        }
    }
}