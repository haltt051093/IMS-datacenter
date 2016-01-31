using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    }
}