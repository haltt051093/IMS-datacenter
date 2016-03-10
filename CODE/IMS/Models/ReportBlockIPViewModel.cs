using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Models
{
    public class ReportBlockIPViewModel
    {
        public List<SelectListItem> TimeRange { get; set; } 
        public string TimeSelect { get; set; }
        public int Count { get; set; }
    }
}