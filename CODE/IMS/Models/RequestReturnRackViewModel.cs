using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestReturnRackViewModel : BaseViewModel
    {
        //main info
        public List<RackOfCustomerExtendedModel> AllRacks { get; set; }
       
        //request info
        public RequestInfoModel RequestInfo { get; set; }
        public List<string> SelectedRacks { get; set; }
    }
}