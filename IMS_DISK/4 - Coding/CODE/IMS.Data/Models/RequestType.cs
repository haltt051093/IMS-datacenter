using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("RequestType")]
    public partial class RequestType : BaseModel
    {
        [StringLength(50)]
        public string RequestTypeCode { get; set; }
        [StringLength(50)]
        public string RequestTypeName { get; set; }
    }
}
