namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogConfirmedRequest")]
    public partial class LogConfirmedRequest
    {
        [Key]
        public int LogId { get; set; }

        public int? LogRequestedId { get; set; }

        public int? StaffId { get; set; }

        public int? ServerId { get; set; }

        public bool? IsConfirmed { get; set; }

        public DateTime? LogTime { get; set; }

        public virtual Account Account { get; set; }

        public virtual LogRequest LogRequest { get; set; }

        public virtual Server Server { get; set; }
    }
}
