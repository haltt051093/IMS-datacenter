using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;
using IMS.Resources;

namespace IMS.Data.Models
{
    [Table("Server")]
    public partial class Server : BaseModel
    {
        public string ServerCode { get; set; }

        public string Customer { get; set; }

        public string Maker { get; set; }

        public string Model { get; set; }

        public int? Power { get; set; }

        public int? Size { get; set; }

        public string StatusCode { get; set; }

        public string DefaultIP { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public string Bandwidth { get; set; }

        public string PartNumber { get; set; }

        public string SerialNumber { get; set; }
    }
}
