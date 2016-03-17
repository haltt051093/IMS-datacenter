using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestChangeIPViewModel : BaseViewModel
    {
        public ProcessRequestChangeIPViewModel()
        {
            CustomerInfo = new CustomerInfoModel();
            RequestInfo = new RequestInfoModel();

            StaffCodeOptions = new List<SelectListItem>();
            NewIPsOptions = new List<SelectListItem>();
        }

        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }        
        public RequestInfoModel RequestInfo { get; set; }
        public string CurrentUser { get; set; }

        // Specific Info
        public string SelectedServer { get; set; }
        public List<string> ReturningIPs { get; set; }
        public List<string> NewIPs { get; set; }

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
        public List<SelectListItem> NewIPsOptions { get; set; } 
    }
}