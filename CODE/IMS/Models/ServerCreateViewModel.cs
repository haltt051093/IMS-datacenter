using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class ServerCreateViewModel
    {
        public int Id { get; set; }
        public string ServerCode { get; set; }
        public string Customer { get; set; }
        public string Maker { get; set; }
        public string Modern { get; set; }
        public int? Power { get; set; }
        public int? Size { get; set; }
        public string Status { get; set; }
        public string DefaultIP { get; set; }
        public string LocationCode { get; set; }
        public DateTime? RegisteredDate { get; set; }
        public int? Outlet { get; set; }
    }
}