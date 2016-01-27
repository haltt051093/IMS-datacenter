using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace IMS.Models
{
    public class ServerCreateViewModel
    {
        public int ServerId { get; set; }
        public int? CustomerId { get; set; }
        public string Maker { get; set; }
        public string Modern { get; set; }
        public int? Power { get; set; }
        public int? Size { get; set; }
        public string Status { get; set; }
        public int? DefaultIP { get; set; }
        public int? LocationId { get; set; }
        public DateTime? RegisteredDate { get; set; }
        public int? RequestId { get; set; }
        public int? Outlet { get; set; }
    }
}