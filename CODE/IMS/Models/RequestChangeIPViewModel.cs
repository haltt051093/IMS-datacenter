using System.Collections.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class RequestChangeIPViewModel : BaseViewModel
    {
        public RequestChangeIPViewModel()
        {
            RequestInfo = new RequestInfoModel();
        }

        // Common Info
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        public string SelectedServer { get; set; }
        public List<string> ReturningIPs { get; set; }
        public List<string> SelectedIPs { get; set; } 
        public List<ServerIP> ServerIPs { get; set; } 

        //DropdownList
        public List<SelectListItem> ServerOptions { get; set; }
    }
}