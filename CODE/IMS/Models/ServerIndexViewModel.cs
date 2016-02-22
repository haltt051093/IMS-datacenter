using System.Collections.Generic;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ServerIndexViewModel
    {
        public ServerIndexViewModel()
        {
            Servers = new List<ServerExtendedModel>();
        }
        public List<ServerExtendedModel> Servers { get; set; } 
    }
}