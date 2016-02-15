using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AutoMapper;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Models;

namespace IMS.Controllers
{
    public class LocationController : Controller
    {
        // GET: Location
        public ActionResult Index(string StatusSearch, string RackSearch)
        {
            var data = new LocationIndexViewModel();
            var locations = LocationBLO.Current.GetAllLocation();

            var status = new List<string>();
            var currentstatus = LocationBLO.Current.GetLocationStatus().ToList();
            status.AddRange(currentstatus.Distinct());
            ViewBag.StatusSearch = new SelectList(status);

            var racks = new List<string>();
            var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
            racks.AddRange(currentrack.Distinct());
            ViewBag.RackSearch = new SelectList(racks);

            if (!String.IsNullOrEmpty(StatusSearch))
            {
                locations = locations.Where(st => st.Status.Trim() == StatusSearch.Trim()).ToList();
            }

            if (!String.IsNullOrWhiteSpace(RackSearch))
            {
                locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
            }
            data.Locations = locations;
            return View(data);
        }
        public ActionResult AssignLocation(Server server, string request)
        {
            var s = new Server();
            s.ServerCode = "BJIWEHDHQ";
            s.Power = 750;
            s.Size = 2;
            s.Customer = "manhnh";
            request = "Change";
            //request = "New";
            var data = new LocationIndexViewModel();
            if (request == "Change")
            {
                data.Locations = LocationBLO.Current.GetChangeLocation(s);
                data.Server = s;
                data.Request = request;
                return View(data);
            }
            else
            {
                data.Locations = LocationBLO.Current.GetNewLocation(s);
                data.Server = s;
                data.Request = request;
                return View(data);

            }
        }

        [HttpPost]
        public ActionResult AssignLocation(LocationIndexViewModel livm)
        {
            if (livm.LocationCode == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            bool x = LocationBLO.Current.UpdateLocation(livm.Server.Size, livm.Server.ServerCode, livm.LocationCode, livm.Request);
            if (x)
            {
                return RedirectToAction("Index");
            }
            else
            {
                return RedirectToAction("AssignLocation");
            }


        }
        public ActionResult CreateLocation()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateLocation(RackCreateViewModel rcvm)
        {
            if (ModelState.IsValid)
            {
                var rack = Mapper.Map<RackCreateViewModel, Rack>(rcvm);
                if (RackBLO.Current.AddRackAndLocation(rack) == true)
                {
                    return RedirectToAction("Index");
                }
                else return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            return View();

        }

    }
}