using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Location")]
    public partial class Location : BaseModel
    {
        [StringLength(50)]
        public string LocationCode { get; set; }

        [StringLength(50)]
        public string RackCode { get; set; }

        public int? RackUnit { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        [StringLength(50)]
        public string ServerCode { get; set; }
    }
}
