using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Task")]
    public partial class Task : BaseModel
    {
        public string TaskCode { get; set; }
        [StringLength(50)]
        public string AssignedStaff { get; set; }

        [StringLength(50)]
        public string ShiftHead { get; set; }

        [StringLength(50)]
        public string PreAssignedStaff { get; set; }

        [StringLength(50)]
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        public DateTime? AssignedTime { get; set; }

        public string Comment { get; set; }

    }
}
