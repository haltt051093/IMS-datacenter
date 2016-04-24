using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;
using IMS.Validations;

namespace IMS.Models
{
    public class RequestBringServerAwayViewModel : BaseViewModel
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
        [CustomRequired(ErrorMessage = "Appointment Time is required.")]
        public string AppointmentValidation { get; set; }
        [CustomRequired(ErrorMessage = "Please select server.")]
        public string ServerValidation { get; set; }

    }
}