using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Object")]
    public partial class Object : BaseModel
    {
        [Column("Object")]
        [StringLength(50)]
        public string Object1 { get; set; }
    }
}
