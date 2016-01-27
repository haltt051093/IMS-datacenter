using System;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Request : BaseModel
    {
        public int RequestId { get; set; }

        public int? RequestType { get; set; }

        public int? CustomerId { get; set; }

        public DateTime? AppointmentTime { get; set; }

        public string Description { get; set; }

        public DateTime? RequestedTime { get; set; }
    }
}
