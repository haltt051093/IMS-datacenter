using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
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
        public string Time { get; set; }
        //[Required]
        //[Display(Name = "Appointment Time")]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MMM/yyyy}")]
        //public DateTime AppointmentTime { get; set; }
        public string Description { get; set; }
    }
}