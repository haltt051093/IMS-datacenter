using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.WebPages.Html;
using IMS.Data.Models;

namespace IMS.Models
{
    public class RequestReturnIPViewModel
    {
        public List<SelectListItem> ServerIPs { get; set; }
        public List<Server> Servers { get; set; }
    }
}