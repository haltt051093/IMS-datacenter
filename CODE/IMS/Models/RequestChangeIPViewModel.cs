﻿using System.Collections.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Validations;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class RequestChangeIPViewModel : BaseViewModel
    {
        public RequestChangeIPViewModel()
        {
            RequestInfo = new RequestInfoModel();
        }

        // Common Info
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        [Display(Name = "Server")]
        public string SelectedServer { get; set; }
        [Display(Name = "IPs of Server")]
        [CustomRequired(ErrorMessage = "Please select IP Address.")]
        public List<string> ReturningIPs { get; set; }
        public List<string> SelectedIPs { get; set; } 
        public List<ServerIPExtendedModel> ServerIPs { get; set; }
        [CustomRequired(ErrorMessage = "Please select server.")]
        public string ServerValidation { get; set; }

        //DropdownList
        public List<SelectListItem> ServerOptions { get; set; }
    }
}