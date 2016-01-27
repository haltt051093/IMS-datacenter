using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogIPStatus : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? IPAddress { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? ChangedStatusTime { get; set; }

        public int? StaffId { get; set; }

        public string Reason { get; set; }
    }
}
