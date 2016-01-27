using System;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class AssignedShift : BaseModel
    {
        public int Id { get; set; }

        public int? ShiftId { get; set; }

        public int? GroupId { get; set; }

        public DateTime? Date { get; set; }
    }
}
