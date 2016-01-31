using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.WebPages.Html;

namespace IMS.Models
{
    public class RackCreateViewModel
    {
        public int Id { get; set; }
        public string RackCode { get; set; }
        public string RackName { get; set; }
        public DateTime? RegisteredDate { get; set; }
        public int? MaximumPower { get; set; }
        public int? MaximumOutlet { get; set; }
        public string LocationCode { get; set; }
        public int? RackUnit { get; set; }
        public string StatusCode { get; set; }
    }
}