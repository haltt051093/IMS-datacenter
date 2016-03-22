using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class NotificationBLO : BaseBLO<Notification>
    {
        protected NotificationDAO dao;
        private static NotificationBLO instance;

        public static NotificationBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new NotificationBLO();
                }
                return instance;
            }
        }


        private NotificationBLO()
        {
            baseDao = NotificationDAO.Current;
            dao = NotificationDAO.Current;
        }

        public List<Notification> GetByUser(string username, int page = 0, int pageSize = 20)
        {
            var result = dao.Query(x => x.Username == username && x.IsViewed == false, page, pageSize);
            return result;
        }

        public int CountUserUnread(string username)
        {
            var result = dao.Query(x => x.Username == username && x.IsViewed == false);
            return result.Count;
        }

        public string AddNotification(string refCode, string refType, string username, string description)
        {
            var notifCode = GenerateCode();
            var notif = new Notification()
            {
                NotificationCode = notifCode,
                RefCode = refCode,
                RefType = refType,
                Username = username,
                Description = description,
                IsViewed = false
            };

            dao.Add(notif);
            return notifCode;
        }

        public List<NotificationExtendedModel> ListServerSideNotification()
        {
            return dao.ListServerSideNotification();
        }

        public List<NotificationExtendedModel> ListClientSideNotification(string customer)
        {
            return dao.ListClientSideNotification(customer);
        }

        public List<NotificationExtendedModel> ListNotification(string role, string customer)
        {
            var list = new List<NotificationExtendedModel>();
            if (role == Constants.Role.CUSTOMER && customer != null)
            {
                list = ListClientSideNotification(customer);
            }
            else if (role == Constants.Role.SHIFT_HEAD || role == Constants.Role.STAFF || role == Constants.Role.MANAGER)
            {
                list = ListServerSideNotification();
            }
            return list;
        }



        private string GenerateCode()
        {
            var code = "N" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.NotificationCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "N" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.NotificationCode == code).FirstOrDefault();
            }
            return code;
        }
    }
}
