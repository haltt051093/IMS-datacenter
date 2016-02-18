using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

        public string AddRequestRentRacks(Request passModel)
        {
            Request request = passModel;
            request.RequestType = Constants.RequestTypeCode.RENT_RACK;
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

        public string AddRequestAddServer(Request passModel)
        {
            Request request = passModel;
            request.RequestType = Constants.RequestTypeCode.ADD_SERVER;
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

        public string AddRequestReturnRack(Request passModel)
        {
            Request request = passModel;
            request.RequestType = Constants.RequestTypeCode.RETURN_RACK;
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

        public List<ScheduleExtendedModel> GetSchedule()
        {
            string query = @"select r.*,rt.RequestTypeName, s.Status from Request as r 
                            join Status as s 
                            on s.StatusCode = r.StatusCode
                            join RequestType as rt
                            on rt.RequestTypeCode = r.RequestType";
            return RawQuery<ScheduleExtendedModel>(query, new object[] { });
        }
        //public List<NotificationExtendedModel> ListAllNotification()
        //{


        //}
    }
}
