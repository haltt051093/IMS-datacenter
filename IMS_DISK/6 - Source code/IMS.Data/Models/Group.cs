using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Group")]
    public partial class Group : BaseModel
    {
        [StringLength(50)]
        public string GroupCode { get; set; }
    }
}
