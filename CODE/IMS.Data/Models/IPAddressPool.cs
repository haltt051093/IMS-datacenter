namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("IPAddressPool")]
    public partial class IPAddressPool
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string IPAddress { get; set; }

        [StringLength(50)]
        public string Gateway { get; set; }

        [StringLength(50)]
        public string Subnetmask { get; set; }

        public int? StaffId { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public virtual Account Account { get; set; }
    }
}
