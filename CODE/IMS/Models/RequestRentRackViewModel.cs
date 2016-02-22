using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.Models;

namespace IMS.Models
{
    public class RequestRentRackViewModel
    {
        public int RackNumbers { get; set; }

        public string Customer { get; set; }
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public string Description { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string StatusCode { get; set; }
        public bool IsViewed { get; set; }
        //public List<SelectListItem> AvailableRacks { get; set; }
        public MultiSelectList AvailableRacks { get; set; }
        public List<string> SelectedRacks { get; set; } 
    }
}