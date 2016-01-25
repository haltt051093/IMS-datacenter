namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class LogRequestStatus
    {
        [Key]
        public int LogId { get; set; }

        public int? RequestId { get; set; }

        public int? StaffId { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public DateTime? ChangedStatusTime { get; set; }

        public virtual Account Account { get; set; }

        public virtual Request Request { get; set; }
    }
}
