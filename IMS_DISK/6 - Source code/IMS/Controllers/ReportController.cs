using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using IMS.Data.Business;
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
                Value = "blocked",
                Text = "Blocking IP"
            };
            listtime.Add(item0);
            SelectListItem item = new SelectListItem()
                {
                    Value = "7",
                    Text = "Blocked in 1 week"
                };
                listtime.Add(item);
            SelectListItem item1 = new SelectListItem()
            {
                Value = "30",
                Text = "Blocked in 1 month"
            };
            listtime.Add(item1);
            SelectListItem item2 = new SelectListItem()
            {
                Value = "90",
                Text = "Blocked in 3 months"
            };
            listtime.Add(item2);
            SelectListItem item3 = new SelectListItem()
            {
                Value = "180",
                Text = "Blocked in 6 months"
            };
            listtime.Add(item3);
            var data = new ReportBlockIPViewModel();
            data.TimeRange = listtime;
            var list = LogBLO.Current.GetAllLogIP();
            int count = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i].Unblocktime == null)
                {
                    count++;
                }
            }
            data.Count = count;
            return View(data);
        }

        public ActionResult ReportUsedIP()
        {
            var data = new ReportUsedIPViewModel();
            var uselist = new List<SelectListItem>();
            SelectListItem item = new SelectListItem()
            {
                Value = "used",
                Text = "Used and Using IP"
            };
            uselist.Add(item);
            var list = LogBLO.Current.GetLogUsedIP();
            var listNetworkIP = list.OrderBy(x => x.NetworkIP).GroupBy(x => x.NetworkIP).Select(x => x.FirstOrDefault()).Where(x => x.NetworkIP != null);
            var listnet = listNetworkIP.Select(x => new SelectListItem
            {
                Value = x.NetworkIP,
                Text = "Network " + x.NetworkIP
            }).ToList();
            
            uselist.AddRange(listnet);
            data.ListConditions = uselist;
            return View(data);
        }
    }
}