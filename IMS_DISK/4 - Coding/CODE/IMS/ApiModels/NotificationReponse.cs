using System.Collections.Generic;
using IMS.Data.Models;

namespace IMS.ApiModels
{
    public class NotificationReponse
    {
        public List<Notification> Notifications { get; set; }
        public int NumberOfUnread { get; set; }
    }
}