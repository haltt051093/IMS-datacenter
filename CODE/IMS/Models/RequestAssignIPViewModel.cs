using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

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
        public string SelectedServer { get; set; }
        public int NumberOfIP { get; set; }

        //DropdownList
        public List<SelectListItem> ServerOptions { get; set; }
        public List<SelectListItem> NumberOfIPOptions { get; set; }
    }
}