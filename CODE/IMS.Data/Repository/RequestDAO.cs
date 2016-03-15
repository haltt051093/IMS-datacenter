using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Business;
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
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.RequestCode == entry.RequestCode).FirstOrDefault();
            }
            return existing;
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

        //Tien
        public List<ScheduleExtendedModel> GetSchedule(DateTime? start = null, DateTime? end = null)
        {
            var query = @"select r.*,rt.RequestTypeName, s.StatusName,acc.Fullname from Request as r 
                            join Status as s 
                            on s.StatusCode = r.StatusCode
                            join Account as acc
                            on acc.Username = r.Customer
                            join RequestType as rt
                            on rt.RequestTypeCode = r.RequestType
                            where (isnull(@start, '') = '' or r.AppointmentTime >= @start)
                                and (isnull(@end, '') = '' or r.AppointmentTime <= @end)
                                and (isnull(r.AppointmentTime, '') != '')
                                and (r.StatusCode = @waiting or r.StatusCode = @processing or r.StatusCode = @done)";
            return RawQuery<ScheduleExtendedModel>(query,
                new SqlParameter("start", start),
                new SqlParameter("end", end),
                new SqlParameter("waiting", Constants.StatusCode.REQUEST_WAITING),
                new SqlParameter("processing", Constants.StatusCode.REQUEST_PROCESSING),
                new SqlParameter("done", Constants.StatusCode.REQUEST_DONE)
            );
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfShift()
        {
            var query = @"select r.*,rt.RequestTypeName,s.StatusName,note.NoteContent from Request as r
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
                            and (r.StatusCode='STATUS05' or r.StatusCode='STATUS06')
							and (r.RequestType='RT003' or r.RequestType='RT007')";
            return RawQuery<ScheduleExtendedModel>(query, new object[] { });
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfPreviousShift()
        {
            var query = @"select r.*,rt.RequestTypeName,s.StatusName,note.NoteContent from Request as r
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
                            and (r.StatusCode='STATUS05' or r.StatusCode='STATUS06')
							and (r.RequestType='RT003' or r.RequestType='RT007')";
            return RawQuery<ScheduleExtendedModel>(query, new object[] { });
        }

        public List<NotificationExtendedModel> ListServerSideNotification()
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
                            StatusCode = subst.StatusCode,
                            RequestedTime = r.RequestedTime,
                            Priority = subst.Priority
                        };
            return query.ToList();
        }

        public List<NotificationExtendedModel> ListClientSideNotification(string customer)
        {
            var query = from r in Table()
                        join rt in RequestTypeDAO.Current.Table()
                            on r.RequestType equals rt.RequestTypeCode into rrt
                        from subr in rrt.DefaultIfEmpty()
                        join st in StatusDAO.Current.Table()
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

        public List<RequestExtendedModel> GetAllRequest()
        {
            var query = @"select i.*,s.StatusName, r.RequestTypeName from Request as i
                            left join Status as s
                            on s.StatusCode = i.StatusCode
                            left join RequestType as r
                            on r.RequestTypeCode = i.RequestType";
            //
            return RawQuery<RequestExtendedModel>(query, new object[] { });
        }

        public string AddRequestANDLog(string requestType, string newStatus, string customer,
            string description, DateTime? appointmenTime, string serverCode, string typeOfLog, string UniqueRequestCode)
        {
            var requestCode = GenerateCode(); ;
            if (requestType == Constants.RequestTypeCode.ADD_SERVER)
            {
                requestCode = UniqueRequestCode;
            }
            var request = new Request()
            {
                RequestCode = requestCode,
                RequestType = requestType,
                StatusCode = newStatus,
                Customer = customer,
                Description = description,
                AppointmentTime = appointmenTime,
                RequestedTime = DateTime.Now,
            };

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
            // log request status
            LogChangedContent logRequest = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_REQUEST,
                ObjectStatus = Constants.StatusCode.REQUEST_PENDING,
                ChangedValueOfObject = requestCode,
                ServerCode = serverCode,
                Description = description
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
            return requestCode;
        }

        public void UpdateRequestStatusANDLog(string requestCode, string typeOfLog, string newStatus, string assignee, string staffCode)
        {
            var request = (from r in Current.Table()
                           where r.RequestCode == requestCode
                           select r).FirstOrDefault();
            request.StatusCode = newStatus;
            if (assignee != null)
            {
                request.Assignee = assignee;
            }
            Update(request);
            // log request status
            LogChangedContent logRequest = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_REQUEST,
                ObjectStatus = newStatus,
                ChangedValueOfObject = requestCode,
                Username = staffCode
            };
            LogChangedContentBLO.Current.AddLog(logRequest);
        }

        public string AddRequest(string requestCode, string requestType, string newStatus, string customer,
            string description, DateTime? appointmenTime)
        {
            if (requestCode == null)
            {
                requestCode = GenerateCode();
            }
            var request = new Request()
            {
                RequestCode = requestCode,
                RequestType = requestType,
                StatusCode = newStatus,
                Customer = customer,
                Description = description,
                AppointmentTime = appointmenTime,
                RequestedTime = DateTime.Now,
            };

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
            return requestCode;
        }
    }
}
