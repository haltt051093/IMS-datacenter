using System.ComponentModel.DataAnnotations.Schema;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class NotificationExtendedModel
    {
        public string RequestCode { get; set; }
        public string TypeOfRequest { get; set; }
        public string Customer { get; set; }
        public string AppointmentTime { get; set; }
        public string RequestStatus { get; set; }
        public string Description { get; set; }

    }
}
