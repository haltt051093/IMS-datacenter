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
        [StringLength(50)]
        public string ServerCode { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }

        [StringLength(50)]
        public string Maker { get; set; }

        [StringLength(50)]
        public string Model { get; set; }

        public int? Power { get; set; }

        public int? Size { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        [StringLength(50)]
        public string DefaultIP { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public int? Outlet { get; set; }

        public string Bandwidth { get; set; }
    }
}
