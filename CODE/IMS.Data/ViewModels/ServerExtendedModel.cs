using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class ServerExtendedModel : Server
    {
        public string CustomerName { get; set; }
        public string RackCode { get; set; }
        public string RackName { get; set; }
        public int? RackUnit { get; set; }
        public string Status { get; set; }
        public string PartNumber { get; set; }
        public string SerialNumber { get; set; }
        public string Memory { get; set; }
        public string TempCode { get; set; }
        public List<RequestExtendedModel> Requests { get; set; }
    }
}
