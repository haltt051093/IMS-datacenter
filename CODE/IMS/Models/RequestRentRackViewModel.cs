using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestRentRackViewModel
    {
        //public RequestExtendedModel SpecificRequest { get; set; }
        public int RackNumbers { get; set; }
        public string Customer { get; set; }
        public string Message { get; set; }
        public string AppointmentTime { get; set; }
    }
}