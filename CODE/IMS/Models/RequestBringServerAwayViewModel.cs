using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestBringServerAwayViewModel
    {
        public RequestBringServerAwayViewModel()
        {
            RequestInfo = new RequestInfoModel();
        }
        //main content
        public int ServerNumber { get; set; }
        public string SelectedRack { get; set; }
        public int SelectedServerNumber { get; set; }

        //request info
        public RequestInfoModel RequestInfo { get; set; }

        //dropdownlist
        public List<ServerExtendedModel> ServerOfCustomer { get; set; }
        public List<SelectListItem> RackOfCustomer { get; set; }

    }
}