using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

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
            var result = dao.Query(x => x.Username == username, page, pageSize);
            return result;
        }

        public int CountUserUnread(string username)
        {
            var result = dao.Query(x => x.Username == username && x.IsViewed == false);
            return result.Count;
        }
    }
}
