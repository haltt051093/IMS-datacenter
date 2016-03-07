using System;
namespace IMS.Models
{
    public class RequestCreateViewModel
    {
        public string Type { get; set; }

        public int Id { get; set; }

        public string RequestCode { get; set; }

        public string RequestType { get; set; }

        public string Customer { get; set; }

        public DateTime? AppointmentTime { get; set; }

        public string Description { get; set; }

        public DateTime? RequestedTime { get; set; }

        public string StatusCode { get; set; }

        public bool IsViewed { get; set; }
    }
}