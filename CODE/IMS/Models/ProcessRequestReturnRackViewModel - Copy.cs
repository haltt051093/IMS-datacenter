using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestReturnRackViewModel : BaseViewModel
    {
        public ProcessRequestReturnRackViewModel()
        {
            CustomerInfo = new CustomerInfoModel();
            RequestInfo = new RequestInfoModel();

            StaffCodeOptions = new List<SelectListItem>();
        }

        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }        
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        public List<SelectListItem> RackOfCustomer { get; set; }
        public List<SelectListItem> NumberOfRackOptions { get; set; }
        public List<string> SelectedRacks { get; set; }

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
    }
}