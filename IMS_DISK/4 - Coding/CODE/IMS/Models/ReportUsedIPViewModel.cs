using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Models
{
    public class ReportUsedIPViewModel
    {
        public List<SelectListItem> ListConditions { get; set; } 
        public string Condition { get; set; }
    }
}