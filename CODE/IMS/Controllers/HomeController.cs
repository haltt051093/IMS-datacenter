using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using IMS.Models;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    [AllowAnonymous]
    public class HomeController : CoreController
    {
        [HttpGet]
        public ActionResult Index(HomeIndexViewModel q)
        {            
            var data = new HomeIndexViewModel();
            var requestTypes = RequestTypeBLO.Current.GetAll();
            data.RequestTypes = requestTypes
                .Select(x => new SelectListItem {Text = x.RequestTypeName, Value = x.RequestTypeCode})
                .ToList();
            return View(data);
        }

        [ChildActionOnly]
        public PartialViewResult Header(object role)
        {
            return PartialView(role);
        }

        [ChildActionOnly]
        public PartialViewResult Sidebar(object role)
        {
            return PartialView(role);
        }
    }
}