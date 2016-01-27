using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class RequestType : BaseModel
    {
        public int RequestTypeId { get; set; }

        [Column("RequestType")]
        [StringLength(50)]
        public string RequestType1 { get; set; }
    }
}
