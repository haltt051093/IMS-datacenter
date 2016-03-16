using System.Collections.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestAddServerViewModel : BaseViewModel
    {
        public ProcessRequestAddServerViewModel()
        {
            CustomerInfo = new CustomerInfoModel();
            RequestInfo = new RequestInfoModel();

            StaffCodeOptions = new List<SelectListItem>();
        }

        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }        
        public RequestInfoModel RequestInfo { get; set; }

        //Specific Info
        public ServerExtendedModel Server { get; set; }
        public List<ServerExtendedModel> Servers { get; set; }
        public List<SelectListItem> NetworkIPs { get; set; }
        public string NetworkIP { get; set; }
        public string NewIP { get; set; }
        public string ServerCode { get; set; }
        public string RequestType { get; set; }
        public string RequestCode { get; set; }
        public string OldIP { get; set; }
        public string Button { get; set; }

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
    }
}