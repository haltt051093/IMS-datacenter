using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Status : BaseModel
    {
        [Key]
        [StringLength(50)]
        public string StatusCode { get; set; }

        [Column("Status")]
        [StringLength(50)]
        public string Status1 { get; set; }

        [StringLength(50)]
        public string Object { get; set; }

    }
}
