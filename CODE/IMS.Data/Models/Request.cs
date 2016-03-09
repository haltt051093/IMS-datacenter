using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Request")]
    public partial class Request : BaseModel
    {
        [StringLength(50)]
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string RequestType { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }

        public DateTime? AppointmentTime { get; set; }

        public string Description { get; set; }

        public DateTime? RequestedTime { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        public bool IsViewed { get; set; }
    }
}
