using System.Collections.Generic;
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
        public string SelectedStatus { get; set; }
    }
}