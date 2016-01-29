using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ServerAttribute")]
    public partial class ServerAttribute : BaseModel
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string AttributeName { get; set; }

        [StringLength(50)]
        public string ServerCode { get; set; }

        public string AttributeValue { get; set; }
    }
}
