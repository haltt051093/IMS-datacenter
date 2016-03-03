using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;
using IMS.Data.ViewModels;

namespace IMS.Models
{
    public class IPIndexViewModel
    {
        public IPIndexViewModel()
        {
            IPs = new List<IPExtendedModel>();
        }
        public List<IPExtendedModel> IPs { get; set; }
        public string Request { get; set; }
        public string OldIP { get; set; }
        public string NewIP { get; set; }
        public string ServerCode { get; set; }
        public List<SelectListItem> ListNewIP { get; set; }

        
        [Required(ErrorMessage = "Please input Network Address!")]
        [RegularExpression("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$", ErrorMessage = "Wrong format of Network Address! Try again!")]
        public string Address { get; set; }
        public int Netmask { get; set; }

        public string Description { get; set; }
        public int Id { get; set; }
    }
}