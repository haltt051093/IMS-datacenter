using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestIndexViewModel : BaseViewModel
    {
        public RequestIndexViewModel()
        {
            Requests = new List<LogExtentedModel>();
        }

        public List<LogExtentedModel> Requests { get; set; }

        //dropdownlist
        public List<SelectListItem> FilterByRequestType { get; set; }
        public List<SelectListItem> FilterByStatus { get; set; }
        public List<SelectListItem> FilterByPeriodOfTime { get; set; }
    }
}