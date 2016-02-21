using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

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
