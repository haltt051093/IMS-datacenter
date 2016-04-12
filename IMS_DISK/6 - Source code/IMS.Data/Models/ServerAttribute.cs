using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("ServerAttribute")]
    public partial class ServerAttribute : BaseModel
    {
        [StringLength(50)]
        public string AttributeCode { get; set; }

        [StringLength(50)]
        public string ServerCode { get; set; }

        public string AttributeValue { get; set; }

        public int UpdatedVersion { get; set; }

        public string StatusCode { get; set; }
    }
}
