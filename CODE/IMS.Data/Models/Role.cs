using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Role")]
    public partial class Role : BaseModel
    {
        [StringLength(50)]
        public string RoleName { get; set; }
    }
}
