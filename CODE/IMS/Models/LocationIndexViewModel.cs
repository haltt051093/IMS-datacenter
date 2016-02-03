using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class LocationIndexViewModel
    {
        public LocationIndexViewModel()
        {
            Locations = new List<LocationExtendedModel>();

        }

        public List<LocationExtendedModel> Locations { get; set; }
        public string Request { get; set; }
        public Server Server { get; set; }
        public string LocationCode { get; set; }
    }
}
