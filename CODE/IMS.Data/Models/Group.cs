using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Group : BaseModel
    {
        [Key]
        public int GroupId { get; set; }
        [StringLength(50)]
        public string GroupName { get; set; }
    }
}
