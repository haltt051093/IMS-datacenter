using System.Collections.Generic;
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

        [Display(Name = "RequestType", ResourceType = typeof(Resources.Labels))]
        public string Type { get; set; }

        public List<SelectListItem> RequestTypes { get; set; }
    }
}