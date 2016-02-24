using System;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.Models;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class RequestIPViewModel
    {
        public string Action { get; set; }
        public List<SelectListItem> Servers { get; set; }
        public List<ServerIP> ServerIPs { get; set; }
        public string SelectedServerCode { get; set; }
        public string Description { get; set; }
        public List<string> Ips { get; set; }
        public List<SelectListItem> SelectedIps { get; set; } 
        public string SelectedServer { get; set; }
        public int IpNumber { get; set; }
        public string Customer { get; set; }
        public List<SelectListItem> IpSelectListItems { get; set; } 
        public List<string> ReturningIps { get; set; } 
        public string StaffName { get; set; }
        public string StaffCode { get; set; }
        public string RequestCode { get; set; }
        public string RequestType { get; set; }
        public DateTime? RequestedTime { get; set; }
        public string StatusCode { get; set; }
        public bool IsViewed { get; set; }
    }
}