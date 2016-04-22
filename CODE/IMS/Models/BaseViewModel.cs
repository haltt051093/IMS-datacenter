using System.Collections.Generic;
using System.Web.Mvc;

namespace IMS.Models
{
    public class BaseViewModel
    {
        public string Action { get; set; }
        public string Username { get; set; }
        public string FormController { get; set; }
        public string FormAction { get; set; }
        public string SuccessMessage { get; set; }
        public string ErrorMessage { get; set; }
        public bool IsAssignedUser { get; set; }
        //dropdownlist
        public List<SelectListItem> FilterByRequestType { get; set; }
        public List<SelectListItem> FilterByStatus { get; set; }
        public List<SelectListItem> FilterByPeriodOfTime { get; set; }
    }
}