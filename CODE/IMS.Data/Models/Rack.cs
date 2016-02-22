using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Rack")]
    public partial class Rack : BaseModel
    {
        [StringLength(50)]
        public string RackCode { get; set; }

        [StringLength(50)]
        public string RackName { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        public DateTime? AddedDate { get; set; }

        public int? MaximumPower { get; set; }

        public int? MaximumOutlet { get; set; }
    }
}
