using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class IPIndexViewModel
    {
        public IPIndexViewModel()
        {
            IPs = new List<IPExtendedModel>();
        }
        public List<IPExtendedModel> IPs { get; set; }
        public string Request { get; set; }
        public string OldIP { get; set; }
        public string NewIP { get; set; }
        public string ServerCode { get; set; }
        public List<SelectListItem> ListNewIP { get; set; }
    }
}