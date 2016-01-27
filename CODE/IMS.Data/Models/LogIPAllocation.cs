using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogIPAllocation : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? ServerId { get; set; }

        public int? AssignedIP { get; set; }

        public int? StaffId { get; set; }

        public string Reason { get; set; }

        public DateTime? LogTime { get; set; }
    }
}
