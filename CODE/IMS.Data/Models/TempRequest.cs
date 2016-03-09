using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("TempRequest")]
    public partial class TempRequest : BaseModel
    {
        [StringLength(50)]
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string ObjectType { get; set; }

        public string Data { get; set; }

        public string TempCode { get; set; }
    }
}
