using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestReturnRackViewModel
    {
        //main info
        public List<RackOfCustomerExtendedModel> AllRacks { get; set; }
       
        //request info
        public RequestInfoModel RequestInfo { get; set; }
        public List<string> SelectedRacks { get; set; }
    }
}