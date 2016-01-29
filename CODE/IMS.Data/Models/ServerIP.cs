using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ServerIP")]
    public partial class ServerIP : BaseModel
    {
        [Required]
        [StringLength(50)]
        public string ServerCode { get; set; }

        [Required]
        [StringLength(50)]
        public string CurrentIP { get; set; }
    }
}
