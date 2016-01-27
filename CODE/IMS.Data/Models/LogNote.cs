using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogNote : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? StaffId { get; set; }

        public string Description { get; set; }

        public DateTime? LogTime { get; set; }
    }
}
