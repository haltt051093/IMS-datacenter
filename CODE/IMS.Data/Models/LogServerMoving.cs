using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogServerMoving : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? ServerId { get; set; }

        public int? StaffId { get; set; }

        public int? MovedLocation { get; set; }

        public string Reason { get; set; }

        public DateTime? LogTime { get; set; }
    }
}
