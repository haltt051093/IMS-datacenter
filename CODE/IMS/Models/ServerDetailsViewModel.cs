using System.Collections.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ServerDetailsViewModel
    {
        public ServerExtendedModel Server { get; set; }
        public List<AttributeExtendedModel> Attributes { get; set; }
        public List<ServerIP> CurrentIPs { get; set; } 
        public List<RackOfCustomerExtendedModel> Locations { get; set; }
    }
}