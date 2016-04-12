using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Request")]
    public partial class Request : BaseModel
    {
        public string RequestCode { get; set; }

        [StringLength(50)]
        public string RequestType { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }

        [Display(Name = "Appointment Time")]
        public DateTime? AppointmentTime { get; set; }

        public string Description { get; set; }

        [Display(Name = "Requested Time")]
        public DateTime? RequestedTime { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        public bool IsViewed { get; set; }

        public string Assignee { get; set; }
        [Display(Name = "Rejected Reason")]
        public string Reason { get; set; }
    }
}
