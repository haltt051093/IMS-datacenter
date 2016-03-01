using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestAddServerViewModel
    {
        public ServerDetailModel Server { get; set; }
        public List<ServerDetailModel> Servers { get; set; }
        
        public string Time { get; set; }
        [Required]
        [Display(Name = "Appointment Time")]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MMM/yyyy}")]
        public DateTime AppointmentTime { get; set; }

        public string Description { get; set; }

        public List<SelectListItem> AttributeList { get; set; }
        public List<string> SelectedAttributes { get; set; }
        public List<string> AttributeValues { get; set; }
    }
}