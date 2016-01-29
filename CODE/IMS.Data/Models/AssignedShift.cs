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
        public string ShiftName { get; set; }

        [StringLength(50)]
        public string GroupName { get; set; }

        public DateTime? Date { get; set; }

        public virtual Group Group { get; set; }

        public virtual Shift Shift { get; set; }
    }
}
