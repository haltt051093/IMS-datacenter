
using System.ComponentModel.DataAnnotations;

namespace IMS.Data.ViewModels
{
    public class LocationViewModel
    {
        public int? Id { get; set; }
        public string LocationCode { get; set; }
        public int? RackUnit { get; set; }
        public string StatusName { get; set; }
        public string RackCode { get; set; }
        [Required]
        public string RackName { get; set; }
        public string ServerCode { get; set; }
        public string Request { get; set; }
        public int? Size { get; set; }
        public string DefaultIP { get; set; }
        public string RackStatus { get; set; }
        public string Fullname { get; set; }
        public string ServerOwner { get; set; }
        public int? Power { get; set; }
        public string ServerStatus { get; set; }
        public string Bandwidth { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
       
    }
}
