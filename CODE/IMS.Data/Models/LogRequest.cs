namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LogRequest")]
    public partial class LogRequest
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LogRequest()
        {
        }

        [Key]
        public int LogId { get; set; }

        public int? RequestType { get; set; }

        public int? CustomerId { get; set; }

        public DateTime? AppointmentTime { get; set; }

        [StringLength(50)]
        public string AppointmentStatus { get; set; }

        public string Description { get; set; }

        public int? StaffId { get; set; }

        public string Comment { get; set; }

        public DateTime? RequestedTime { get; set; }
    }
}
