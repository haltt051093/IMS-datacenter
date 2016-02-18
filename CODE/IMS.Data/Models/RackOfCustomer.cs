using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("RackOfCustomer")]
    public partial class RackOfCustomer : BaseModel
    {
        [Required]
        [StringLength(50)]
        public string RackCode { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public bool IsHired { get; set; }
    }
}
