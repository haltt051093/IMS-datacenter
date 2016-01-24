namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogServerMoving")]
    public partial class LogServerMoving
    {
        [Key]
        public int LogId { get; set; }

        public int? ServerId { get; set; }

        public int? StaffId { get; set; }

        public int? MovedLocation { get; set; }

        public string Reason { get; set; }

        public DateTime? LogTime { get; set; }

        public virtual Account Account { get; set; }

        public virtual Location Location { get; set; }

        public virtual Server Server { get; set; }
    }
}
