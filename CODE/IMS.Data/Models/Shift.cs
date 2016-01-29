using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Shift")]
    public partial class Shift : BaseModel
    {
        [StringLength(50)]
        public string ShiftName { get; set; }

        public TimeSpan? StartedTime { get; set; }

        public TimeSpan? EndedTime { get; set; }
    }
}
