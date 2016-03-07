using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Models;

namespace IMS.Controllers
{
    public class ReportController : Controller
    {
        // GET: Report
        public ActionResult ReportBlockIP()
        {
            var listtime = new List<SelectListItem>();
            SelectListItem item0 = new SelectListItem()
            {
                Value = "Blocking IP",
                Text = "Blocking IP"
            };
            listtime.Add(item0);
            SelectListItem item = new SelectListItem()
                {
                    Value = "7",
                    Text = "1 week"
                };
                listtime.Add(item);
            SelectListItem item1 = new SelectListItem()
            {
                Value = "30",
                Text = "1 month"
            };
            listtime.Add(item1);
            SelectListItem item2 = new SelectListItem()
            {
                Value = "90",
                Text = "3 months"
            };
            listtime.Add(item2);
            SelectListItem item3 = new SelectListItem()
            {
                Value = "180",
                Text = "6 months"
            };
            listtime.Add(item3);
            var data = new ReportBlockIPViewModel();
            data.TimeRange = listtime;
            return View(data);
        }
    }
}