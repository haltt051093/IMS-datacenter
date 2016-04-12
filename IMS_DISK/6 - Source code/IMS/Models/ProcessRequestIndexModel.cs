using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ProcessRequestIndexModel : BaseViewModel
    {
        public List<RequestExtendedModel> Requests { get; set; }
    }
}