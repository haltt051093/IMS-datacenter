using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestAddServerViewModel : BaseViewModel
    {
        
        // Common Info
        public RequestInfoModel RequestInfo { get; set; }
        
        //Specific Info
        public string TempCode { get; set; }
        public ServerExtendedModel Server { get; set; }

        [Remote("CheckAddServer", "Validate", ErrorMessage = "No server added.", HttpMethod = "POST")]
        public string ServerCount { get; set; }

        public List<ServerExtendedModel> Servers { get; set; }

        //dropdownlist
        public List<SelectListItem> ServerSizes { get; set; }

    }
}