using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Attribute")]
    public partial class Attribute : BaseModel
    {
        [StringLength(50)]
        public string AttributeCode { get; set; }
        [StringLength(50)]
        public string AttributeName { get; set; }
    }
}
