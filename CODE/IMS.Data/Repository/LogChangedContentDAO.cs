using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class LogChangedContentDAO : BaseDAO<LogChangedContent>
    {
        public static LogChangedContentDAO instance;

        public static LogChangedContentDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogChangedContentDAO();
                }
                return instance;
            }
        }

        public override LogChangedContent GetByKeys(LogChangedContent entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public void AddLog(LogChangedContent viewmodel)
        {
            LogChangedContent log = viewmodel;
            log.LogTime = DateTime.Now;
            var existing = GetByKeys(log);
            if (existing == null)
            {
                IMSContext.Current.Set<LogChangedContent>().Add(log);
            }
            else
            {
                CopyValues(log, existing);
            }
            IMSContext.Current.SaveChanges();
        }

        public List<string> GetIpRequestReturnIp(string requestCode)
        {
            var query = from log in Table()
                        where log.RequestCode == requestCode && log.Object == Constants.Object.OBJECT_IP
                        select log.ChangedValueOfObject;
            return query.ToList();
        }

        public string GetServerCodeByRequestCode(string requestCode)
        {
            //request assign IP chi luu 1 hang trong bang Log
            var serverCode = Current.Query(x => x.RequestCode == requestCode && x.ServerCode != null)
                .Select(x => x.ServerCode).FirstOrDefault();
            return serverCode;
        }

        public List<RequestExtendedModel> ListWaitingRequestOfServer(string serverCode)
        {
            //list tat ca hang co serverCode, lay ra list requestcode
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.Object == Constants.Object.OBJECT_REQUEST 
                && (x.ObjectStatus == Constants.StatusCode.REQUEST_SENDING
                || x.ObjectStatus == Constants.StatusCode.REQUEST_WAITING
                || x.ObjectStatus == Constants.StatusCode.REQUEST_PROCESSING)).Select(x => x.RequestCode);
            List<RequestExtendedModel> requests = new List<RequestExtendedModel>();
            //item la requestCode
            foreach (var item in query)
            {
                var query1 = from re in RequestDAO.Current.Table()
                    join rt in RequestTypeDAO.Current.Table()
                        on re.RequestType equals rt.RequestTypeCode
                    where re.RequestCode == item
                    select new RequestExtendedModel()
                    {
                        RequestType =  re.RequestType,
                        RequestTypeName = rt.RequestTypeName,
                        RequestCode = re.RequestCode
                    };
                requests.Add(query1.FirstOrDefault());
            }
            return requests;
        }
    }
}
