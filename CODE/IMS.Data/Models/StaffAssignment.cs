using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("StaffAssignment")]
    public partial class StaffAssignment : BaseModel
    {
        [StringLength(50)]
        public string AssignedStaff { get; set; }

        [StringLength(50)]
        public string ShiftHead { get; set; }

        [StringLength(50)]
        public string PreAssignedStaff { get; set; }

        [StringLength(50)]
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string AssignmentStatus { get; set; }

        public DateTime? ChangedStatusTime { get; set; }

        public string Comment { get; set; }

    }
}
