namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Shift")]
    public partial class Shift
    {
        public int ShiftId { get; set; }

        [StringLength(50)]
        public string ShiftName { get; set; }

        public int? GroupId { get; set; }

        public DateTime? StartedTime { get; set; }

        public DateTime? EndedTime { get; set; }

        public virtual ShiftGroup ShiftGroup { get; set; }
    }
}
