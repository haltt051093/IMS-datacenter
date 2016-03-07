﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class RackController : Controller
    {
        // GET: Rack
        public ActionResult Index(string CustomerSearch, string RackSearch)
        {
            var racks = RackOfCustomerBLO.Current.GetAllRackOfCustomer();
            var data = new RackOfCustomerIndexViewModel();

            var customer = new List<string>();
            var cus = racks.OrderBy(x => x.Customer).Select(x => x.Customer).ToList();
            customer.AddRange(cus.Distinct());
            ViewBag.CustomerSearch = new SelectList(customer);
            if (!String.IsNullOrWhiteSpace(CustomerSearch))
            {
                racks = racks.Where(r => r.Customer.Trim() == CustomerSearch.Trim()).ToList();
            }

            var rack = new List<string>();
            var ra = racks.OrderBy(x => x.RackName).Select(x => x.RackName).ToList();
            rack.AddRange(ra.Distinct());
            ViewBag.RackSearch = new SelectList(rack);
            if (!String.IsNullOrWhiteSpace(RackSearch))
            {
                racks = racks.Where(r => r.RackName.Trim() == RackSearch.Trim()).ToList();
            }
            data.Racks = racks;
            return View(data);
        }
    }
}