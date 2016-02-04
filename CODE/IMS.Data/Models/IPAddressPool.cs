using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("IPAddressPool")]
    public partial class IPAddressPool : BaseModel
    {
        [StringLength(50)]
        public string IPAddress { get; set; }

        [StringLength(50)]
        public string Gateway { get; set; }

        [StringLength(50)]
        public string Subnetmask { get; set; }

        [StringLength(50)]
        public string Staff { get; set; }

        public DateTime? RegisteredDate { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        public bool IsDefault { get; set; }
    }
}
