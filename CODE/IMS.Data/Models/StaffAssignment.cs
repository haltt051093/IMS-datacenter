using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class StaffAssignment : BaseModel
    {
        public int Id { get; set; }

        public int? StaffId { get; set; }

        public int? ShiftHeadId { get; set; }

        public int? RequestId { get; set; }

        [StringLength(50)]
        public string AssignmentStatus { get; set; }

        public DateTime? ChangedStatusTime { get; set; }

        public string Comment { get; set; }
    }
}
