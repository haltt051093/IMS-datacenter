using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    public class ServerExtendedModel
    {
        public Server Server { get; set; }
        public Location Location { get; set; }
        public Status Status { get; set; }
    }
}
