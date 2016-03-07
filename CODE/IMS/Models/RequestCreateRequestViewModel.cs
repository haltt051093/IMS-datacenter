using System.ComponentModel.DataAnnotations;

namespace IMS.Models
{
    public class RequestCreateRequestViewModel
    {
        [Display(Name = "SearchBy", ResourceType = typeof(Resources.Labels))]
        public string Type { get; set; }
    }
}