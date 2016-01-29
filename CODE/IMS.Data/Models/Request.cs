using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

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
        public string Status { get; set; }
    }
}
