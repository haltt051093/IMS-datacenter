using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogConfirmedRequest : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? RequestId { get; set; }

        public int? StaffId { get; set; }

        public int? ServerId { get; set; }

        public int? IPAddressId { get; set; }

        public bool? IsConfirmed { get; set; }

        public DateTime? LogTime { get; set; }

        public string Comment { get; set; }
    }
}
