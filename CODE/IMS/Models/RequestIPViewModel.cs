using System.Collections.Generic;
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
        public int IpNumber { get; set; }
        public string Customer { get; set; }
    }
}