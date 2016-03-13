using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("LogChangedContent")]
    public partial class LogChangedContent : BaseModel
    {
        [StringLength(50)]
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        public DateTime? LogTime { get; set; }

        [StringLength(50)]
        public string TypeOfLog { get; set; }

        [StringLength(50)]
        public string Object { get; set; }

        [StringLength(50)]
        public string ChangedValueOfObject { get; set; }
        public string ObjectStatus { get; set; }
        [StringLength(50)]
        public string ServerCode { get; set; }

        [StringLength(50)]
        public string IPAddress { get; set; }

        public string Description { get; set; }

        public int PreviousId { get; set; }
    }
}
