using System.ComponentModel.DataAnnotations;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Status : BaseModel
    {
        [StringLength(50)]
        public string StatusCode { get; set; }

        [StringLength(50)]
        public string StatusName { get; set; }

        [StringLength(50)]
        public string Object { get; set; }

        public int Priority { get; set; }
    }
}
