using System.Collections.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IMS.Models
{
    public class RequestIndexViewModel
    {
        public RequestIndexViewModel()
        {
            RequestTypes = new List<SelectListItem>();
        }

        public List<RequestExtendedModel> Request { get; set; }
        public List<Request> ListRequest { get; set; }
        [Display(Name = "RequestType", ResourceType = typeof(Resources.Labels))]
        public string Type { get; set; }
        public List<SelectListItem> RequestTypes { get; set; }
    }
}