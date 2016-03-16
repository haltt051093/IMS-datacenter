
using System.Collections.Generic;
using System.Web.Mvc;

namespace IMS.Models
{
    public class IPCreateViewModel
    {
       public List<SelectListItem> NetworkIPs { get; set; } 
        public string NetworkIP { get; set; }
        public string RequestType { get; set; }
        public string RequestCode { get; set; }
        public string OldIP { get; set; }
        public string ServerCode { get; set; }
        public string NewIP { get; set; }
    }
}