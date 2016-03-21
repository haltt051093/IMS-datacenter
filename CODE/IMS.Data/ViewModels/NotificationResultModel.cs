using System.Collections.Generic;

namespace IMS.Data.ViewModels
{
    public class NotificationResultModel
    {
        public NotificationResultModel()
        {
            NotificationCodes = new List<string>();
        }

        public List<string> NotificationCodes { get; set; }
    }
}
