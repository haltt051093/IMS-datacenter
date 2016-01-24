namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogAppointment")]
    public partial class LogAppointment
    {
        [Key]
        public int LogId { get; set; }

        public int? LogRequestedId { get; set; }

        public int? StaffId { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? LogTime { get; set; }

        public virtual Account Account { get; set; }

        public virtual LogRequest LogRequest { get; set; }
    }
}
