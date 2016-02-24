using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace IMS.Models
{
    public class RequestReturnRackViewModel
    {
        public List<SelectListItem> RackOfCustomer { get; set; }
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public string Customer { get; set; }
        public string Time { get; set; }
        [Required]
        [Display(Name = "Appointment Time")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MMM/yyyy}")]
        public DateTime AppointmentTime { get; set; }
        public string Description { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string StatusCode { get; set; }
        public string StaffCode { get; set; }
    }
}