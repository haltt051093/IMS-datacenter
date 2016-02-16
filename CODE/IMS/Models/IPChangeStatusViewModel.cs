using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.WebPages.Html;

namespace IMS.Models
{
    public class IPChangeStatusViewModel
    {
        public int Id { get; set; }
        public string IPAddress { get; set; }
        public string Gateway { get; set; }
        public string Subnetmask { get; set; }
        public string Staff { get; set; }
        public DateTime? RegisteredDate { get; set; }
        public string StatusCode { get; set; }
        public bool IsDefault { get; set; }
        public string Status { get; set; }

    }
}