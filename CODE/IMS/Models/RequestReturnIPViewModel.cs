using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.WebPages.Html;
using IMS.Data.Models;
using SelectListItem = System.Web.Mvc.SelectListItem;

namespace IMS.Models
{
    public class RequestReturnIPViewModel
    {
        public List<SelectListItem> Servers { get; set; }
        public List<ServerIP> ServerIPs { get; set; }
        public string SelectedServerCode { get; set; }
    }

    public class ServerExtModel
    {
        public Server Sever { get; set; }
        public List<IPAddressPool> IPs { get; set; }
    }
}