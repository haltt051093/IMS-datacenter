using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Data.ViewModels
{
    public class ServerDetailModel
    {
        public string TempCode { get; set; }
        public string Customer { get; set; }
        public string Maker { get; set; }
        public string Model { get; set; }
        public int? Power { get; set; }
        public int? Size { get; set; }
        public string DefaultIP { get; set; }
        public string LocationCode { get; set; }
        public int? Outlet { get; set; }
        public string AssignedName { get; set; }
        public string Identification { get; set; }
        public string Bandwidth { get; set; }
        public string PartNumber { get; set; }
        public string SerialNumber { get; set; }
        public string Memory { get; set; }
    }
}
