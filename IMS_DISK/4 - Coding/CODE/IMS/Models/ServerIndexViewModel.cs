using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class ServerIndexViewModel
    {
        public ServerIndexViewModel()
        {
            Servers = new List<ServerExtendedModel>();
        }

        public ServerExtendedModel Server { get; set; }

        public List<ServerExtendedModel> Servers { get; set; }
        public List<SelectListItem> ServerStatus { get; set; }
        public string SelectedStatus { get; set; }
    }
}