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

        public Notification GetByCode(string tempCode)
        {
            return dao.GetByCode(tempCode);
        }
    }
}
