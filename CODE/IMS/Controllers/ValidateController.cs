﻿using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Data.Models;

namespace IMS.Controllers
{
    public class ValidateController : Controller
    {
        [HttpPost]
        public JsonResult CheckRackName(string RackName)
        {
            var existing = RackBLO.Current.GetByName(new Rack { RackName = RackName });
            return Json(existing == null);
        }

        [HttpPost]
        public JsonResult CheckIPAddress(string Address)
        {
            var existing = IPAddressPoolBLO.Current.GetByModel(new IPAddressPool {IPAddress = Address});
            return Json(existing == null);
        }

        [HttpPost]
        public JsonResult CheckUsername(string username)
        {
            var existing = AccountBLO.Current.GetByModel(new Account {Username = username});
            return Json(existing == null);
        }
    }
}