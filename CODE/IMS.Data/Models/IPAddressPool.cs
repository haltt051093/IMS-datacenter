using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class IPAddressPool : BaseModel
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

        [StringLength(50)]
        public string Status { get; set; }
    }
}
