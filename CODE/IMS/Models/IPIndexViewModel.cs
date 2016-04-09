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
            IPs = new List<IPAddressPoolExtendedModel>();
        }
        public List<IPAddressPoolExtendedModel> IPs { get; set; }
        public string Request { get; set; }
        public string OldIP { get; set; }
        public string NewIP { get; set; }
        public string ServerCode { get; set; }
        public List<SelectListItem> ListNewIP { get; set; }
        public List<SelectListItem> NetIPAvai { get; set; } 
        public List<SelectListItem> NetworkIPs { get; set; }
        public List<SelectListItem> ListNetmask { get; set; } 
        public string NetworkIP { get; set; }
        public string Action { get; set; }
        public string SuccessMessage { get; set; }
        public string FailBlock { get; set; }
        public string FailUnBlock { get; set; }

        [Required(ErrorMessage = "Please select type of Gateway!")]
        public string Option { get; set; }

        [Required(ErrorMessage = "Please input Network Address!")]
        [RegularExpression("^([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\." +
        "([01]?\\d\\d?|2[0-4]\\d|25[0-5])$", ErrorMessage = "Wrong format of Network Address! Try again!")]
        [Remote("CheckIPAddress", "Validate", ErrorMessage = "IP Address is existed", HttpMethod = "POST")]
        public string Address { get; set; }
        public int Netmask { get; set; }
       
        public string Confirm { get; set; }

        [Required(ErrorMessage = "Please input Description")]
        public string Description { get; set; }
        public int Id { get; set; }
    }
}