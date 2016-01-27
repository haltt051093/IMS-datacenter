using System;
using System.Collections.Generic;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Rack : BaseModel
    {
        public int RackId { get; set; }

        public int? RackNumber { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public int? MaximumPower { get; set; }

        public int? MaximumOutlet { get; set; }
    }
}
