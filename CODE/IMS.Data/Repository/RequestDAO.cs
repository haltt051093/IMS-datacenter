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
            Log logRequest = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_REQUEST,
                ObjectStatus = Constants.StatusCode.REQUEST_PENDING,
                ChangedValueOfObject = requestCode,
                ServerCode = serverCode,
                Description = description,
                Username = customer,
                LogTime = DateTime.Now
            };
            LogBLO.Current.Add(logRequest);
            return requestCode;
        }

        public void UpdateRequestStatusANDLog(string requestCode, string typeOfLog, string newStatus, string assignee, string staffCode, string description, string reason)
        {
            var request = (from r in Current.Table
                           where r.RequestCode == requestCode
                           select r).FirstOrDefault();
            request.StatusCode = newStatus;
            request.RequestedTime = DateTime.Now;
            if (assignee != null)
            {
                request.Assignee = assignee;
            }
            if (reason != null)
            {
                request.Reason = reason;
            }
            Update(request);
            // log request status
            Log logRequest = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_REQUEST,
                ObjectStatus = newStatus,
                ChangedValueOfObject = requestCode,
                Username = staffCode,
                Description = description,
                LogTime = DateTime.Now
            };
            LogBLO.Current.Add(logRequest);
        }

        public void UpdateRequestAssignee(string requestCode, string assignee)
        {
            var request = (from r in Current.Table
                           where r.RequestCode == requestCode
                           select r).FirstOrDefault();
            if (assignee != null)
            {
                request.Assignee = assignee;
            }
            Update(request);
        }

        public List<RequestExtendedModel> GetWaitingRequestOfServer(string serverCode)
        {
            //list tat ca hang co serverCode, lay ra list requestcode
            var query = LogDAO.Current.Query(x => x.ServerCode == serverCode
                && x.Object == Constants.Object.OBJECT_REQUEST
                && (x.ObjectStatus == Constants.StatusCode.REQUEST_PENDING
                || x.ObjectStatus == Constants.StatusCode.REQUEST_PENDING
                || x.ObjectStatus == Constants.StatusCode.REQUEST_PROCESSING)).Select(x => x.RequestCode);
            return query.Select(item => (from re in RequestDAO.Current.Table
                                         join rt in RequestTypeDAO.Current.Table on re.RequestType equals rt.RequestTypeCode
                                         where re.RequestCode == item
                                         select new RequestExtendedModel()
                                         {
                                             RequestType = re.RequestType,
                                             RequestTypeName = rt.RequestTypeName,
                                             RequestCode = re.RequestCode,
                                             StatusCode = re.StatusCode
                                         })).Select(query1 => Queryable.FirstOrDefault<RequestExtendedModel>(query1)).ToList();
        }
    }
}
