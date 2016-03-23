using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class NotificationResultModel : Notification
    {
        public NotificationResultModel()
        {
            NotificationCodes = new List<string>();
        }

        public List<string> NotificationCodes { get; set; }
    }
}
