using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class LogServerDelivery : BaseModel
    {
        [Key]
        public int LogId { get; set; }

        public int? ServerId { get; set; }

        public int? StaffId { get; set; }

        public bool? IsOut { get; set; }

        public DateTime? LogTime { get; set; }

        public int? RequestId { get; set; }
    }
}
