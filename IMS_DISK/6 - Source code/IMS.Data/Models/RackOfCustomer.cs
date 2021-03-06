using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("RackOfCustomer")]
    public partial class RackOfCustomer : BaseModel
    {
        [Required]
        [StringLength(50)]
        public string RackCode { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }

        public DateTime? RentedDate { get; set; }

        public int PreviousId { get; set; }

        public string StatusCode { get; set; }
    }
}
