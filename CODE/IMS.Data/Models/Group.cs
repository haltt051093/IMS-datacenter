using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Group")]
    public partial class Group : BaseModel
    {
        [Key]
        public int GroupId { get; set; }
        [StringLength(50)]
        public string GroupName { get; set; }
    }
}
