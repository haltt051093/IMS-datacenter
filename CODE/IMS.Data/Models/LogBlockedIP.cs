namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogBlockedIP")]
    public partial class LogBlockedIP
    {
        [Key]
        public int LogId { get; set; }

        public int? BlockedIP { get; set; }

        public int? ServerId { get; set; }

        public int? StaffId { get; set; }

        public string Reason { get; set; }

        public DateTime? LogTime { get; set; }

        public virtual Account Account { get; set; }

        public virtual IPAddressPool IPAddressPool { get; set; }

        public virtual Server Server { get; set; }
    }
}
