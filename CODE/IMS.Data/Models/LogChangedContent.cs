using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogChangedContent")]
    public partial class LogChangedContent : BaseModel
    {
        [StringLength(50)]
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string Staff { get; set; }

        public DateTime? LogTime { get; set; }

        [StringLength(50)]
        public string TypeOfLog { get; set; }

        [StringLength(50)]
        public string Object { get; set; }

        [StringLength(50)]
        public string ChangedValueOfObject { get; set; }

        [StringLength(50)]
        public string ServerCode { get; set; }

        [StringLength(50)]
        public string IPAddress { get; set; }

        public string Reason { get; set; }
    }
}
