namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogServerDelivery")]
    public partial class LogServerDelivery
    {
        [Key]
        public int LogId { get; set; }

        public int? ServerId { get; set; }

        public int? StaffId { get; set; }

        public bool? IsOut { get; set; }

        public DateTime? LogTime { get; set; }

        public int? RequestId { get; set; }

        public virtual Account Account { get; set; }

        public virtual Request Request { get; set; }

        public virtual Server Server { get; set; }
    }
}
