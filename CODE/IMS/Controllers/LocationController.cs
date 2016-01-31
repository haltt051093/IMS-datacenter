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
        public ActionResult Index()
        {
            var data = new LocationIndexViewModel();
            data.Locations = LocationBLO.Current.GetAllLocation();
            return View(data);
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
                RackBLO.Current.AddRackAndLocation(rack);
                return RedirectToAction("Index");
            }
            return View();

        }

    }
}