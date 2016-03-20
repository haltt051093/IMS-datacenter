using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestRentRackViewModel : BaseViewModel
    {
        public ProcessRequestRentRackViewModel()
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
        public List<RackExtendedModel> listRackByRows { get; set; }
        public string SelectedRow { get; set; }
        public List<string> RentedRacks { get; set; }
        public int RackNumbers { get; set; }

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
        public List<SelectListItem> ListRows { get; set; }

    }
}