using System.Collections.Generic;
using System.Web.Mvc;
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
        public Account CustomerInfo { get; set; }
        public List<LocationViewModel> Locations1 { get; set; }
        public string LocationCode { get; set; }
        public List<SelectListItem> Racks { get; set; }
        public string SelectedRack { get; set; }
        public string ServerCode { get; set; }
        public string Customer { get; set; }
        public int Power { get; set; }
        public int Size { get; set; }
        public string RackCode { get; set; }
        public List<SelectLocationViewModel> Selected { get; set; }
        public string SuccessMessage { get; set; }
        public string UserRole { get; set; }
    }
}