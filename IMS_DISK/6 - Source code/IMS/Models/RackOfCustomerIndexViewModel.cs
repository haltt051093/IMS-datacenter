using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RackOfCustomerIndexViewModel
    {
        public RackOfCustomerIndexViewModel()
        {
            Racks = new List<RackOfCustomerExtendedModel>();
        }
        public List<RackOfCustomerExtendedModel> Racks { get; set; }
        public List<SelectList> Customers { get; set; }
        public string RackCode { get; set; }
        public List<SelectListItem> RackSelectList { get; set; } 
        public string CustomerCode { get; set; }
    }
}