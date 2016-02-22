using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AssignedShift")]
    public partial class AssignedShift :  BaseModel
    {
        [StringLength(50)]
        public string ShiftCode { get; set; }

        [StringLength(50)]
        public string GroupCode { get; set; }

        public DateTime? StartedTime { get; set; }

        public DateTime? EndedTime { get; set; }
    }
}
