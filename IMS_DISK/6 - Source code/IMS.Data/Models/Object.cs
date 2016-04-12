using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Object")]
    public partial class Object : BaseModel
    {
        [Column("Object")]
        [StringLength(50)]
        public string Object1 { get; set; }
    }
}
