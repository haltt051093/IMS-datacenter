using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;
using System.ComponentModel.DataAnnotations;
using IMS.Validations;

namespace IMS.Models
{
    public class RequestRentRackViewModel : BaseViewModel
    {
        public RequestRentRackViewModel()
        {
            RequestInfo = new RequestInfoModel();
        }
        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }
        public RequestInfoModel RequestInfo { get; set; }

        //main info
        public List<SelectListItem> ListRackNumbers { get; set; }
        [Display(Name = "Number of racks")]
        public int RackNumbers { get; set; }
        [CustomRequired(ErrorMessage = "Please select number of racks")]
        public string RackNumValidation { get; set; }
    }

}