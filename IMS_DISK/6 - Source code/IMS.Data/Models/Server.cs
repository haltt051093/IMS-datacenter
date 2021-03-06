using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Server")]
    public partial class Server : BaseModel
    {
        public string ServerCode { get; set; }

        public string Customer { get; set; }

        public string Maker { get; set; }

        public string Model { get; set; }
        [Required]
        public int? Power { get; set; }

        public int? Size { get; set; }
        [Display(Name = "Server Status")]
        public string StatusCode { get; set; }
        [Display(Name = "Default IP")]
        public string DefaultIP { get; set; }
        [Display(Name = "Started Date")]
        public DateTime? RegisteredDate { get; set; }

        public string Bandwidth { get; set; }
        [Display(Name ="Part Number")]
        public string PartNumber { get; set; }
        [Display(Name ="Serial Number")]
        public string SerialNumber { get; set; }
    }
}
