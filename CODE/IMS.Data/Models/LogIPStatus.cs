namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class LogIPStatus
    {
        [Key]
        public int LogId { get; set; }

        public int? IPAddress { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? ChangedStatusTime { get; set; }

        public int? StaffId { get; set; }

        public string Reason { get; set; }

        public virtual Account Account { get; set; }

        public virtual IPAddressPool IPAddressPool { get; set; }
    }
}
