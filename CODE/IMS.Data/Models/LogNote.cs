namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogNote")]
    public partial class LogNote
    {
        [Key]
        public int LogId { get; set; }

        public int? StaffId { get; set; }

        public string Description { get; set; }

        public DateTime? LogTime { get; set; }

        public virtual Account Account { get; set; }
    }
}
