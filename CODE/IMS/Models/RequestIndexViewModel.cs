using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestIndexViewModel
    {
        public RequestIndexViewModel()
        {
            Requests = new List<LogExtentedModel>();
        }

        public List<LogExtentedModel> Requests { get; set; }
    }
}