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

        public string GenerateCode()
        {
            var code = "N" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = Query(x => x.NotificationCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "N" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = Query(x => x.NotificationCode == code).FirstOrDefault();
            }
            return code;
        }

        public void AddNotification(string refCode, string refType, string username, string description)
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
            
            var existing = GetByKeys(notif);
            if (existing == null)
            {
                IMSContext.Current.Set<Notification>().Add(notif);
            }
            else
            {
                CopyValues(notif, existing);
            }
            IMSContext.Current.SaveChanges();
        }

        //DOING
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

        //DOING
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
