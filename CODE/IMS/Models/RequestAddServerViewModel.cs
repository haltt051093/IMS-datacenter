using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Models
{
    public class RequestAddServerViewModel
    {
        public string Customer { get; set; }
        public string Maker { get; set; }
        public string Modern { get; set; }
        public int? Power { get; set; }
        public int? Size { get; set; }
        public string DefaultIP { get; set; }
        public string LocationCode { get; set; }
        public int? Outlet { get; set; }
        public DateTime? AppointmentTime { get; set; }
        public string Description { get; set; }
        public List<SelectListItem> AttributeList { get; set; }
        public List<string> SelectedAttributes { get; set; }
        public List<string> AttributeValues { get; set; }
    }
}