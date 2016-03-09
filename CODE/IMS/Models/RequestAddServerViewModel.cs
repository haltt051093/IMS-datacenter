using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class RequestAddServerViewModel : BaseViewModel
    {
        public ServerExtendedModel Server { get; set; }
        public List<ServerExtendedModel> Servers { get; set; }

        //public string Time { get; set; }
        //[Required]
        //[Display(Name = "Appointment Time")]
        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MMM/yyyy}")]
        public DateTime AppointmentTime { get; set; }

        //Customer
        public string Customer { get; set; }
        public string CustomerName { get; set; }
        public string Identification { get; set; }
        public string AssignedPerson { get; set; }
        //Request
        public string RequestCode { get; set; }
        public string RequestedTime { get; set; }
        public string StatusName { get; set; }
        public string StatusCode { get; set; }
        public string Description { get; set; }
        public string RequestType { get; set; }

        //IP
        public List<SelectListItem> NetworkIPs { get; set; }
        public string NetworkIP { get; set; }
        public string NewIP { get; set; }
        public string ServerCode { get; set; }

        public string Button { get; set; }
       


        public List<SelectListItem> ServerSizes { get; set; }
        public List<SelectListItem> AttributeList { get; set; }
        public List<string> SelectedAttributes { get; set; }
        public List<string> AttributeValues { get; set; }

        public string TempCode { get; set; }
    }
}