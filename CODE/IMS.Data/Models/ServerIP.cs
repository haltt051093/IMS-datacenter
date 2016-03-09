using System;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("ServerIP")]
    public partial class ServerIP : BaseModel
    {
        public string ServerCode { get; set; }

        public string StatusCode { get; set; }

        public DateTime? AssignedDate { get; set; }

        public string CurrentIP { get; set; }

        public int PreviousId { get; set; }
    }
}
