using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Role : BaseModel
    {
        public int RoleId { get; set; }

        [StringLength(50)]
        public string RoleName { get; set; }
    }
}
