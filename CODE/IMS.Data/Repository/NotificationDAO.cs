using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

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

        public List<NotificationExtendedModel> ListServerSideNotification()
        {
            var query = from r in RequestDAO.Current.Table
                        join rt in RequestTypeDAO.Current.Table
                            on r.RequestType equals rt.RequestTypeCode into rrt
                        from subr in rrt.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table
                            on r.StatusCode equals st.StatusCode into stsl
                        from subst in stsl.DefaultIfEmpty()
                        select new NotificationExtendedModel
                        {
                            RequestCode = r.RequestCode,
                            RequestTypeName = subr.RequestTypeName,
                            Customer = r.Customer,
                            AppointmentTime = r.AppointmentTime,
                            Description = r.Description,
                            StatusName = subst.StatusName,
                            RequestType = r.RequestType,
                            StatusCode = subst.StatusCode,
                            RequestedTime = r.RequestedTime,
                            Priority = subst.Priority
                        };
            return query.ToList();
        }

        public List<NotificationExtendedModel> ListClientSideNotification(string customer)
        {
            var query = from r in RequestDAO.Current.Table
                        join rt in RequestTypeDAO.Current.Table
                            on r.RequestType equals rt.RequestTypeCode into rrt
                        from subr in rrt.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table
                            on r.StatusCode equals st.StatusCode into stsl
                        from subst in stsl.DefaultIfEmpty()
                        where
                            r.Customer == customer &&
                            (r.StatusCode == Constants.StatusCode.REQUEST_WAITING ||
                             r.StatusCode == Constants.StatusCode.REQUEST_PROCESSING ||
                             r.StatusCode == Constants.StatusCode.REQUEST_DONE ||
                             r.StatusCode == Constants.StatusCode.REQUEST_REJECTED)
                        select new NotificationExtendedModel
                        {
                            RequestCode = r.RequestCode,
                            RequestTypeName = subr.RequestTypeName,
                            Customer = r.Customer,
                            AppointmentTime = r.AppointmentTime,
                            Description = r.Description,
                            StatusName = subst.StatusName,
                            RequestType = r.RequestType,
                            StatusCode = subst.StatusCode,
                            RequestedTime = r.RequestedTime,
                            Priority = subst.Priority
                        };
            return query.ToList();
        }
    }
}
