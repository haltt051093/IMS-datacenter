using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Server : BaseModel
    {
        public int ServerId { get; set; }

        public int? CustomerId { get; set; }

        [StringLength(50)]
        public string Maker { get; set; }

        [StringLength(50)]
        public string Modern { get; set; }

        public int? Power { get; set; }

        public int? Size { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public int? DefaultIP { get; set; }

        public int? LocationId { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public int? RequestId { get; set; }

        public int? Outlet { get; set; }
    }
}
