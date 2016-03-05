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
using IMS.Models;

namespace IMS.Controllers
{
    public class LocationController : CoreController
    {
        public ActionResult Index2()
        {
            var data = new LocationIndexViewModel();
            var locations = LocationBLO.Current.GetAllLocation();
            var list = locations.Where(x => x.RackStatus == Constants.StatusCode.RACK_AVAILABLE);
            var listavailablerack = list.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            data.RackAvailableCount = listavailablerack.Count();
            var listrack = locations.OrderBy(x => x.RackName).GroupBy(x => x.RackName).Select(x => x.FirstOrDefault());
            data.Racks = listrack.Select(x => new SelectListItem
            {
                Value = x.RackCode,
                Text = "Rack " + x.RackName
            }).ToList();
            
            data.Locations = locations;
            return View(data);
        }
        [HttpPost]
        public ActionResult Index2(LocationIndexViewModel livm)
        {
            //if (IsAuthorized())
            //{
            if (ModelState.IsValid)
            {
                var rack = new Rack();
                rack.RackName = livm.RackName;
                rack.MaximumPower = livm.MaximumPower;
                if (RackBLO.Current.AddRackAndLocation(rack) == true)
                {
                    Alert("New Rack added successfully!");
                    return RedirectToAction("Index2");
                }
                Alert("The Rack Name was existed. Please try again!");
            }
            //}

            return RedirectToAction("Index2");
        }
        // GET: Location
        //public ActionResult Index(string StatusSearch, string RackSearch)
        //{
        //    var data = new LocationIndexViewModel();
        //    var locations = LocationBLO.Current.GetAllLocation();

        //    var status = new List<string>();
        //    var currentstatus = LocationBLO.Current.GetLocationStatus().ToList();
        //    status.AddRange(currentstatus.Distinct());
        //    ViewBag.StatusSearch = new SelectList(status);

        //    var racks = new List<string>();
        //    var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
        //    racks.AddRange(currentrack.Distinct());
        //    ViewBag.RackSearch = new SelectList(racks);

        //    if (!String.IsNullOrEmpty(StatusSearch))
        //    {
        //        locations = locations.Where(st => st.StatusName.Trim() == StatusSearch.Trim()).ToList();
        //    }

        //    if (!String.IsNullOrWhiteSpace(RackSearch))
        //    {
        //        locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
        //    }
        //    data.Locations = locations;
        //    return View(data);
        //}
        public ActionResult AssignLocation(Server server, string request, string RackSearch)
        {
            var s = new Server();
            s.ServerCode = "BJIWEHDHQ";
            s.Power = 750;
            s.Size = 2;
            s.Customer = "manhnh";
            request = "Change";
            //request = "New";
            var data = new LocationIndexViewModel();
            //Get locations available for change
            if (request == "Change")
            {
                var locations = LocationBLO.Current.GetChangeLocation(s);
                data.Server = s;
                data.Request = request;
                var racks = new List<string>();
                var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
                racks.AddRange(currentrack.Distinct());
                ViewBag.RackSearch = new SelectList(racks);
                if (!String.IsNullOrWhiteSpace(RackSearch))
                {
                    locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
                }
                data.Locations = locations;
                return View(data);
            }
            //Get locations available for new server
            else
            {
                var locations = LocationBLO.Current.GetNewLocation(s);
                data.Server = s;
                data.Request = request;
                var racks = new List<string>();
                var currentrack = locations.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
                racks.AddRange(currentrack.Distinct());
                ViewBag.RackSearch = new SelectList(racks);
                if (!String.IsNullOrWhiteSpace(RackSearch))
                {
                    locations = locations.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
                }
                data.Locations = locations;
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
        //public ActionResult CreateLocation()
        //{
        //    //check group hien tai co duoc quyen them rack ko 
        //    //redirect lai trang view 
        //    IsAuthorized();
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult CreateLocation(RackCreateViewModel rcvm)
        //{
        //    //check group hien tai co duoc quyen them rack ko 
        //    //ViewBag.IsForbidden = !IsAuthorized();
        //    if (IsAuthorized())
        //    {
        //        if (ModelState.IsValid)
        //        {
        //            var rack = Mapper.Map<RackCreateViewModel, Rack>(rcvm);
        //            if (RackBLO.Current.AddRackAndLocation(rack) == true)
        //            {
        //                return RedirectToAction("Index");
        //            }
        //            return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //        }
        //    }
        //    return View();
        //}

    }
}