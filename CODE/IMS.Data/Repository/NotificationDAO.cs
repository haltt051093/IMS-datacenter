using System.Collections.Generic;
using System.Linq;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class NotificationDAO : BaseDAO<Notification>
    {
        public static NotificationDAO instance;

        public static NotificationDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new NotificationDAO();
                }
                return instance;
            }
        }

        public override Notification GetByKeys(Notification entry)
        {
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.NotificationCode == entry.NotificationCode).FirstOrDefault();
            }
            return existing;
        }
    }
}
