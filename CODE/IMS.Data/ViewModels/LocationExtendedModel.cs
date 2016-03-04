using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LocationExtendedModel
    {
        public int? Id { get; set; }
        public string LocationCode { get; set; }
        public int? RackUnit { get; set; }
        public string StatusName { get; set; }
        public string RackCode { get; set; }
        public string RackName { get; set; }
        public string ServerCode { get; set; }
        public string Request { get; set; }
        public int Size { get; set; }
        public string DefaultIP { get; set; }
    }
}
