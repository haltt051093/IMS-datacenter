
using IMS.ApiModels;
using IMS.Data.Business;

namespace IMS.ApiControllers
{
    public class NotificationController : BaseApiController
    {
        public NotificationReponse GetNotifications()
        {
            var result = new NotificationReponse();
            var username = GetCurrentUserName();
            if (string.IsNullOrEmpty(username))
            {
                return result;
            }
            result.Notifications = NotificationBLO.Current.GetByUser(username);
            result.NumberOfUnread = NotificationBLO.Current.CountUserUnread(username);
            return result;
        }
    }
}
