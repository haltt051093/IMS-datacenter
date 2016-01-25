using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Server")]
    public partial class Server : BaseModel
    {
        public int ServerId { get; set; }

        public int? CustomerId { get; set; }

        [StringLength(50)]
        public string Maker { get; set; }

        [StringLength(50)]
        public string Modern { get; set; }

        [StringLength(50)]
        public string Power { get; set; }

        public int? Size { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public int? DefaultIP { get; set; }

        public int? LocationId { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public int? RequestId { get; set; }

        public virtual Account Account { get; set; }

        public virtual Location Location { get; set; }
    }
}
