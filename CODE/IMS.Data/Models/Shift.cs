using System;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Shift : BaseModel
    {
        public int ShiftId { get; set; }

        [StringLength(50)]
        public string ShiftName { get; set; }

        public DateTime? StartedTime { get; set; }

        public DateTime? EndedTime { get; set; }
    }
}
