using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TypeOfLog")]
    public partial class TypeOfLog : BaseModel
    {
        [StringLength(50)]
        public string TypeCode { get; set; }

        public string TypeName { get; set; }
    }
}
