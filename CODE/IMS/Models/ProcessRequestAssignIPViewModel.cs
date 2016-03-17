﻿using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class ProcessRequestAssignIPViewModel : BaseViewModel
    {
        public ProcessRequestAssignIPViewModel()
        {
            CustomerInfo = new CustomerInfoModel();
            RequestInfo = new RequestInfoModel();

            StaffCodeOptions = new List<SelectListItem>();
        }

        // Common Info
        public CustomerInfoModel CustomerInfo { get; set; }        
        public RequestInfoModel RequestInfo { get; set; }

        // Specific Info
        public string SelectedServer { get; set; }
        public int NumberOfIP { get; set; }
        public List<string> IPs { get; set; } 
       

        //DropdownList
        public List<SelectListItem> StaffCodeOptions { get; set; }
        public List<SelectListItem> SelectedIps { get; set; }
        public List<SelectListItem> IpSelectListItems { get; set; }
    }
}