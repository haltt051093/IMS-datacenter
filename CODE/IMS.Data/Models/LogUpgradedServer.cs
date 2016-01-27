using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogUpgradedServer : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? ServerId { get; set; }

        public int? StaffId { get; set; }

        public string UpgradedContent { get; set; }

        public DateTime? LogTime { get; set; }

        public int? RequestId { get; set; }
    }
}
