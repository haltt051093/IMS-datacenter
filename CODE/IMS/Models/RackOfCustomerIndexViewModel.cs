using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    }
}