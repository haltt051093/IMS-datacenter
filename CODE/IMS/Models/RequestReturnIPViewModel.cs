using System.Collections.Generic;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IMS.Models
{
    public class RequestReturnIPViewModel : BaseViewModel
    {
        public RequestReturnIPViewModel()
        {
            RequestInfo = new RequestInfoModel();
        }

        // Common Info
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        [Display(Name ="Server")]
        public string SelectedServer { get; set; }
        [Display(Name = "Returining IPs")]
        public List<string> ReturningIPs { get; set; }
        public List<ServerIPExtendedModel> ServerIPs { get; set; }

        //DropdownList
        public List<SelectListItem> ServerOptions { get; set; }
    }
}