using System.Collections.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestBringServerAwayViewModel : BaseViewModel
    {
        public ProcessRequestBringServerAwayViewModel()
        {
            CustomerInfo = new CustomerInfoModel();
            RequestInfo = new RequestInfoModel();

            StaffCodeOptions = new List<SelectListItem>();
        }

        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }        
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        public List<Server> SelectedServers { get; set; }
        public int ReturnIpNumber { get; set; }
        public int ReturnLocationNumber { get; set; }
        public List<string> Servers { get; set; }
        public List<string> ServerIps { get; set; }
        public List<string> ServerLocation { get; set; }
        public int SelectedServerNumber { get; set; }
        public List<ServerExtendedModel> ServerOfCustomer { get; set; }

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
    }
}