using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("IPAddressPool")]
    public partial class IPAddressPool : BaseModel
    {
        [StringLength(50)]
        public string IPAddress { get; set; }

        [StringLength(50)]
        public string Gateway { get; set; }

        public string NetworkIP { get; set; }

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
