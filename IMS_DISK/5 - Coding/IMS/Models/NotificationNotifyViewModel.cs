using System.Collections.Generic;

namespace IMS.Models
{
    public class NotificationNotifyViewModel
    {
        public string Username { get; set; }
        public List<string> NotificationCodes { get; set; }
        public string Message { get; set; }
    }
}