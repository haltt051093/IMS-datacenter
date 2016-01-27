using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AssignedShift")]
    public partial class AssignedShift : BaseModel
    {
        public int Id { get; set; }

        public int? ShiftId { get; set; }

        public int? GroupId { get; set; }

        public DateTime? Date { get; set; }

        public virtual Shift Shift { get; set; }

        public virtual ShiftGroup ShiftGroup { get; set; }
    }
}
