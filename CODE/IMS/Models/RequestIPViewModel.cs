﻿using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.Models;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class RequestIPViewModel : BaseViewModel
    {
        public RequestIPViewModel()
        {
            ServerOptions = new List<SelectListItem>();
            NumberOfIPOptions = new List<SelectListItem>();
            SelectedIps = new List<SelectListItem>();
            IpSelectListItems = new List<SelectListItem>();
        }

        public List<SelectListItem> ServerOptions { get; set; }
        public List<ServerIP> ServerIPs { get; set; }
        public string Description { get; set; }
        public List<string> Ips { get; set; }
        public List<SelectListItem> SelectedIps { get; set; } 
        public string SelectedServer { get; set; }
        public int NumberOfIP { get; set; }
        public string Customer { get; set; }
        public string CustomerName { get; set; }
        public List<SelectListItem> IpSelectListItems { get; set; } 
        public List<string> ReturningIps { get; set; } 
        public string StaffName { get; set; }
        public string StaffCode { get; set; }
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string StatusCode { get; set; }
        public string StatusName { get; set; }
        public bool IsViewed { get; set; }
        public int CountAvailableIps { get; set; }
        public List<SelectListItem> NumberOfIPOptions { get; set; }
    }
}