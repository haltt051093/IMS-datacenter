using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Resources;

namespace IMS.Models
{
    public class HomeIndexViewModel
    {
        [Display(Name = "SearchBy", ResourceType = typeof(Resources.Labels))]
        public string Type { get; set; }

        public List<SelectListItem> RequestTypes { get; set; }
    }
}
