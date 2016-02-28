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
    public class RequestDAO : BaseDAO<Request>
    {
        public static RequestDAO instance;

        public static RequestDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RequestDAO();
                }
                return instance;
            }
        }

        public override Request GetByKeys(Request entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public string GenerateCode()
        {
            var code = "R" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = Query(x => x.RequestCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "R" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = Query(x => x.RequestCode == code).FirstOrDefault();
            }
            return code;
        }

        public string AddRequest(Request passModel, string requestType)
        {
            Request request = passModel;
            request.RequestType = requestType;
            request.RequestCode = GenerateCode();
            request.RequestedTime = DateTime.Now;
            request.StatusCode = Constants.StatusCode.REQUEST_WAITING;
            var existing = GetByKeys(request);
            if (existing == null)
            {
                IMSContext.Current.Set<Request>().Add(request);
            }
            else
            {
                CopyValues(request, existing);
            }
            IMSContext.Current.SaveChanges();
            return request.RequestCode;
        }
        //Tien
        public List<ScheduleExtendedModel> GetSchedule()
        {
            string query = @"select r.*,rt.RequestTypeName, s.StatusName from Request as r 
                            join Status as s 
                            on s.StatusCode = r.StatusCode
                            join RequestType as rt
                            on rt.RequestTypeCode = r.RequestType";
            return RawQuery<ScheduleExtendedModel>(query, new object[] { });
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfShift()
        {
            string query = @"select distinct r.*,rt.RequestTypeName,s.StatusName,note.NoteContent from Request as r
                            join Status as s on s.StatusCode=r.StatusCode
                            join RequestType as rt on rt.RequestTypeCode = r.RequestType
                            left join(select * from Note as n 
                            join
                            (select MAX(n.AddedTime)as mt from Note as n 
                            group by n.RequestCode)as m
                            on m.mt=n.AddedTime) as note on note.RequestCode=r.RequestCode
                            join
                            (
                            select a.* from AssignedShift as a
                            where  
                            a.StartedTime<CURRENT_TIMESTAMP and  CURRENT_TIMESTAMP <a.EndedTime
                            ) as k
                            on CAST(r.AppointmentTime as date)=CAST(k.StartedTime AS DATE)
                            and r.AppointmentTime < k.EndedTime
                            and r.StatusCode='STATUS05' or r.StatusCode='STATUS06'";
            return RawQuery<ScheduleExtendedModel>(query, new object[] { });
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfPreviousShift()
        {
            string query = @"select distinct r.*,rt.RequestTypeName,s.StatusName,note.NoteContent from Request as r
                            join Status as s on s.StatusCode=r.StatusCode
                            join RequestType as rt on rt.RequestTypeCode = r.RequestType
                            left join(select * from Note as n 
                            join
                            (select MAX(n.AddedTime)as mt from Note as n 
                            group by n.RequestCode)as m
                            on m.mt=n.AddedTime) as note on note.RequestCode=r.RequestCode
                            join
                            (select a.* from AssignedShift as a join
                            (select a.* from AssignedShift as a
                            where  
                            a.StartedTime<CURRENT_TIMESTAMP and  CURRENT_TIMESTAMP <a.EndedTime)as h on a.Id=h.Id-1
                            ) as k
                            on CAST(r.AppointmentTime as date)=CAST(k.StartedTime AS DATE)
                            and r.AppointmentTime < k.EndedTime
                            and r.StatusCode='STATUS05' or r.StatusCode='STATUS06'";
            return RawQuery<ScheduleExtendedModel>(query, new object[] { });
        }

        public List<NotificationExtendedModel> ListAllNotification()
        {
            var query = from r in Table()
                        join rt in RequestTypeDAO.Current.Table()
                            on r.RequestType equals rt.RequestTypeCode into rrt
                        from subr in rrt.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table()
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
                            StatusCode = subst.StatusCode
                        };
            return query.ToList();
        }

        public void LogUpdateRequestStatus(string status, string requestCode)
        {
            //Change request status --> chuyen vo DAO
            var request = RequestDAO.Current.Query(x => x.RequestCode == requestCode).FirstOrDefault();
            request.StatusCode = status;
            Update(request);
        }

        public List<RequestExtendedModel> GetAllRequest()
        {
            string query = @"select i.*,s.StatusName from Request as i
                            left join Status as s
                            on s.StatusCode = i.StatusCode";
            return RawQuery<RequestExtendedModel>(query, new object[] { });
        }

        public Request GetRequestByRequestCode(string requestCode)
        {
           return Current.Query(x => x.RequestCode == requestCode).FirstOrDefault();
        }
    }
}
