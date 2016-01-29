using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    public class ServerExtendedModel : Server
    {
        public Server Server { get; set; }
        public string RackCode { get; set; }
        public int? RackUnit { get; set; }
        public string Status { get; set; }
        //public Status Status { get; set; }
        //public string UInRack { get; set; }
        //public Status Status1 { get; set; }
    }
}
