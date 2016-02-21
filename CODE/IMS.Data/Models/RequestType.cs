using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("RequestType")]
    public partial class RequestType : BaseModel
    {
        [StringLength(50)]
        public string RequestTypeCode { get; set; }
        [StringLength(50)]
        public string RequestTypeName { get; set; }
    }
}
