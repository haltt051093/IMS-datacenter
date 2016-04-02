using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class LocationIndexViewModel
    {
        public LocationIndexViewModel()
        {
            Locations = new List<LocationViewModel>();
        }

        public string SearchTerm { get; set; }

        public List<LocationViewModel> Locations { get; set; }
        public string Request { get; set; }
        public string RequestType { get; set; }
        public string RequestCode { get; set; }
        public string ServerCode { get; set; }
        public Server Server { get; set; }
        public string LocationCode { get; set; }
        public List<SelectListItem> Racks { get; set; }
        public List<SelectListItem> Racks1 { get; set; }
        public string RackCode { get; set; }
        public string RackCode1 { get; set; }
        public string Notice { get; set; }
        public int Size { get; set; }
        public List<SelectLocationViewModel> Selected { get; set; }
        public string SuccessMessage { get; set; }
        public string FailMessage { get; set; }

        [Required(ErrorMessage = "Please input Rack Name!")]
        [RegularExpression("^[A-Z][1-9]?[0-9]+$", ErrorMessage = "Wrong format of Rack Name! Try again!")]

        [Remote("CheckRackName", "Validate", ErrorMessage = "RackName is existed", HttpMethod = "POST")]
        [Display(Name ="Rack Name")]
        public string RackName { get; set; }
        public int? MaximumPower { get; set; }
        public int RackAvailableCount { get; set; }
        public List<SelectListItem> ListPower { get; set; } 
        public string Power { get; set; }
    }
}
