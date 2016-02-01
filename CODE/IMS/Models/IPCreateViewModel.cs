using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.WebPages.Html;

namespace IMS.Models
{
    public class IPCreateViewModel
    {
        public string IP { get; set; }
        public int BitCount { get; set; }
    }
}