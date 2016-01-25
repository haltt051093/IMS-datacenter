namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StaffAssignment")]
    public partial class StaffAssignment
    {
        public int Id { get; set; }

        public int? StaffId { get; set; }

        public int? ShiftHeadId { get; set; }

        public int? RequestId { get; set; }

        [StringLength(50)]
        public string AssignmentStatus { get; set; }

        public DateTime? ChangedStatusTime { get; set; }

        public virtual Account Account { get; set; }

        public virtual Account Account1 { get; set; }
    }
}
