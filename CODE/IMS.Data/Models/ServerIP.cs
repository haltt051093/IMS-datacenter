using System;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

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
