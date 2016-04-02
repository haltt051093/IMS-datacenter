using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestAssignIPViewModel : BaseViewModel
    {
        public ProcessRequestAssignIPViewModel()
        {
            CustomerInfo = new CustomerInfoModel();
            RequestInfo = new RequestInfoModel();

            StaffCodeOptions = new List<SelectListItem>();
        }

        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }        
        public RequestInfoModel RequestInfo { get; set; }
        public string CurrentUser { get; set; }

        // Specific Info
        [Display(Name = "Server")]
        public string SelectedServer { get; set; }
        public string SelectedDefaultIP { get; set; }
        [Display(Name ="Required number of IPs")]
        public int NumberOfIP { get; set; }
        public int NumberOfAvailableIP { get; set; }
        public int NumberOfSelectedIP { get; set; }
        [Display(Name = "Assigned IPs")]
        public List<string> IPs { get; set; } 

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
        public List<SelectListItem> SelectedIps { get; set; }
        public List<SelectListItem> IpSelectListItems { get; set; }
    }
}