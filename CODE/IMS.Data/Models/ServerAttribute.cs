namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ServerAttribute")]
    public partial class ServerAttribute
    {
        [Key]
        public int AttributeId { get; set; }

        public int? ServerId { get; set; }

        [StringLength(50)]
        public string AttributeName { get; set; }

        public string AttributeValue { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public virtual Server Server { get; set; }
    }
}
