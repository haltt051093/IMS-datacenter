using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;
using IMS.Resources;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ServerExtendedModel : Server
    {
        [Display(Name = "Customer", ResourceType = typeof(Labels))]
        public string CustomerName { get; set; }

        public string RackCode { get; set; }

        public string RackName { get; set; }

        [Display(Name = "RackUnit", ResourceType = typeof(Labels))]
        public int? RackUnit { get; set; }

        [Display(Name = "Status", ResourceType = typeof(Labels))]
        public string Status { get; set; }

        public string PartNumber { get; set; }

        public string SerialNumber { get; set; }

        public string Memory { get; set; }

        public string TempCode { get; set; }

        public List<RequestExtendedModel> Requests { get; set; }
        public bool Checked { get; set; }
    }
}
