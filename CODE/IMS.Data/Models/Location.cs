using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Location : BaseModel
    {
        public int LocationId { get; set; }

        public int? RackId { get; set; }

        public int? RackUnit { get; set; }

        [StringLength(50)]
        public string Status { get; set; }
    }
}
