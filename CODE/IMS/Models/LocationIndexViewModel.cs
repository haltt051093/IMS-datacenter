using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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

        [Required(ErrorMessage = "Please input Rack Name!")]
        [RegularExpression("^[A-Z][1-9]$", ErrorMessage = "Wrong format of Rack Name! Try again!")]
        public string RackName { get; set; }
        public int? MaximumPower { get; set; }
    }
}
