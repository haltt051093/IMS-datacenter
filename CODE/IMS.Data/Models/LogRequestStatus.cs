using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogRequestStatus : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? RequestId { get; set; }

        public int? StaffId { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? ChangedStatusTime { get; set; }
    }
}
