using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
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
        public string CurrentUser { get; set; }
        // Specific Info
        public List<SelectListItem> NumberOfRackOptions { get; set; }
        [Display(Name ="Returning Racks")]
        public List<string> SelectedRacks { get; set; }

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
    }
}