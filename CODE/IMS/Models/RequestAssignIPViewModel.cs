using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;
using System.ComponentModel.DataAnnotations;
using IMS.Validations;
using IMS.Core;

namespace IMS.Models
{
    public class RequestAssignIPViewModel : BaseViewModel
    {
        public RequestAssignIPViewModel()
        {
            RequestInfo = new RequestInfoModel();
        }

        // Common Info
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        [Display(Name = "Server")]
        public string SelectedServer { get; set; }
        [Display(Name = "Number of IPs")]
        public int NumberOfIP { get; set; }
        [CustomRequired(ErrorMessage = "Please select server.")]
        public string ServerValidation { get; set; }
        [CustomRequired(Constants.Validation.REQUIRED_A, ErrorMessage = "Please select IP address")]
        public string IPNumValidation { get; set; }

        //DropdownList
        public List<SelectListItem> ServerOptions { get; set; }
        public List<SelectListItem> NumberOfIPOptions { get; set; }
    }
}