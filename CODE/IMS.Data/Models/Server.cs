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
        [Display(Name = "ServerCode", ResourceType = typeof(Labels))]
        [StringLength(50)]
        public string ServerCode { get; set; }

        [Display(Name = "Customer", ResourceType = typeof(Labels))]
        [StringLength(50)]
        public string Customer { get; set; }

        [StringLength(50)]
        public string Maker { get; set; }

        [StringLength(50)]
        public string Model { get; set; }

        public int? Power { get; set; }

        public int? Size { get; set; }

        [StringLength(50)]
        public string StatusCode { get; set; }

        [Display(Name = "DefaultIP", ResourceType = typeof(Labels))]
        [StringLength(50)]
        public string DefaultIP { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public int? Outlet { get; set; }

        public string Bandwidth { get; set; }
    }
}
