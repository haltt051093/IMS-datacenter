using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestIndexViewModel
    {
        public RequestIndexViewModel()
        {
            Request = new List<RequestExtendedModel>();
        }
        public List<RequestExtendedModel> Request { get; set; }
    }
}