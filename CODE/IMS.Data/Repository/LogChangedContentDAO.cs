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
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            return existing;
        }

        public override void Add(LogChangedContent entry)
        {
            entry.LogTime = DateTime.Now;
            base.Add(entry);
        }

        public List<string> GetIpRequestReturnIp(string requestCode)
        {
            var query = from log in Table()
                        where log.RequestCode == requestCode && log.Object == Constants.Object.OBJECT_IP
                        select log.ChangedValueOfObject;
            return query.ToList();
        }

        public List<string> GetServerCodeByRequestCode(string requestCode)
        {
            //request assign IP chi luu 1 hang trong bang Log
            var serverCodes = Current.Query(x => x.RequestCode == requestCode && x.ServerCode != null
            && x.Object == Constants.Object.OBJECT_REQUEST)
                .Select(x => x.ServerCode);
            return serverCodes.ToList();
        }

        public List<string> GetAddingServers(string requestCode)
        {
            //request assign IP chi luu 1 hang trong bang Log
            var serverCodes = Current.Query(x => x.RequestCode == requestCode && x.Object == Constants.Object.OBJECT_SERVER
            && x.ObjectStatus == Constants.StatusCode.SERVER_WAITING)
                .Select(x => x.ServerCode);
            return serverCodes.ToList();
        }

        public List<RequestExtendedModel> ListWaitingRequestOfServer(string serverCode)
        {
            //list tat ca hang co serverCode, lay ra list requestcode
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.Object == Constants.Object.OBJECT_REQUEST
                && (x.ObjectStatus == Constants.StatusCode.REQUEST_PENDING
                || x.ObjectStatus == Constants.StatusCode.REQUEST_WAITING
                || x.ObjectStatus == Constants.StatusCode.REQUEST_PROCESSING)).Select(x => x.RequestCode);
            return query.Select(item => (from re in RequestDAO.Current.Table()
                                         join rt in RequestTypeDAO.Current.Table() on re.RequestType equals rt.RequestTypeCode
                                         where re.RequestCode == item
                                         select new RequestExtendedModel()
                                         {
                                             RequestType = re.RequestType,
                                             RequestTypeName = rt.RequestTypeName,
                                             RequestCode = re.RequestCode,
                                             StatusCode = re.StatusCode
                                         })).Select(query1 => Queryable.FirstOrDefault<RequestExtendedModel>(query1)).ToList();
        }

        public List<LogChangedContent> GetBlockedIP(string IP)
        {
            var query = @"select * from LogChangedContent as l, 
                            (
                            select MAX(l.LogTime)as maxtime from LogChangedContent as l where l.ChangedValueOfObject ='" + IP + @"'and l.TypeOfLog='BLOCKIP'
                            group by l.ChangedValueOfObject
                            )as k 
                            where l.ChangedValueOfObject ='" + IP + @"'and l.TypeOfLog='BLOCKIP' and l.LogTime=k.maxtime";
            return RawQuery<LogChangedContent>(query, new object[] { });
        }

        public List<LogContentExtendedModel> GetAllLogIP()
        {
            var query = @"select l.*,m.LogTime as Unblocktime, datediff(day,l.LogTime,m.LogTime)as blockedtime, datediff(day,l.LogTime,CURRENT_TIMESTAMP) as blockedtimetonow
                            from LogChangedContent as l
                            left join 
                            (select l.PreviousId,l.LogTime from LogChangedContent as l,(select l.Id from LogChangedContent as l) as k
                             where l.PreviousId = k.Id)as m
                             on m.PreviousId=l.Id
                             where l.TypeOfLog = 'BLOCKIP' ";
            return RawQuery<LogContentExtendedModel>(query, new object[] { });
        }

        public List<LogUsedIPExtendModel> GetLogUsedIP()
        {
            var query =
                @"select ip.IPAddress,ip.NetworkIP,l.LogTime,l.ServerCode,ty.TypeName,s.StatusName from IPAddressPool as ip
                        LEFT JOIN LogChangedContent as l on l.ChangedValueOfObject = ip.IPAddress and l.Object = 'IPAddress' and l.TypeOfLog != 'UNBLOCKIP' AND l.TypeOfLog!= 'BLOCKIP'
                        left join Status as s on l.ObjectStatus = s.StatusCode
                        left join TypeOfLog as ty on ty.TypeCode = l.TypeOfLog
                        where ip.StatusCode != 'STATUS32' and ip.StatusCode !='STATUS35'";
            return RawQuery<LogUsedIPExtendModel>(query, new object[] { });

        }

        public List<LogExtentedModel> GetRequestOfCustomer(string customer)
        {
            //lay list request co cung requestcode
            var myList = Current.Table().ToList();
            var getRequestCodes = myList.GroupBy(x => x.RequestCode).Select(y => y.First()).ToList();
            var list = new List<LogExtentedModel>();
            for (int i = 0; i < getRequestCodes.Count; i++)
            {
                var requestCode = getRequestCodes[i].RequestCode;

                var allStatusOfRequest = from sr in Current.Table()
                                         join rt in TypeOfLogDAO.Current.Table()
                                             on sr.TypeOfLog equals rt.TypeCode into srt
                                         from subsrt in srt.DefaultIfEmpty()
                                         join st in StatusDAO.Current.Table()
                                             on sr.ObjectStatus equals st.StatusCode into sstr
                                         from subsstr in sstr.DefaultIfEmpty()
                                         join r in RequestDAO.Current.Table()
                                             on sr.RequestCode equals r.RequestCode into ssr
                                         from subssr in ssr.DefaultIfEmpty()
                                         where sr.RequestCode == requestCode && sr.Object == Constants.Object.OBJECT_REQUEST
                                         && subssr.Customer == customer
                                         orderby sr.LogTime descending
                                         select new LogExtentedModel()
                                         {
                                             LogTime = sr.LogTime,
                                             StatusName = subsstr.StatusName,
                                             TypeOfLog = subsrt.TypeCode,
                                             RequestCode = sr.RequestCode,
                                             Customer = subssr.Customer,
                                             StatusCode = subsstr.StatusCode,
                                         };
                if (allStatusOfRequest.Any())
                {
                    var requests = ParseTypeLogToRequestType(allStatusOfRequest.ToList());
                    var newest = requests.First();
                    var request = new LogExtentedModel();
                    var others = new List<LogExtentedModel>();
                    request.LastestStatusRequest = newest;
                    if (requests.Count() > 1)
                    {
                        others = requests.ToList();
                        others.RemoveAt(0);
                        request.OldStatusRequests = others.ToList();
                    }
                    else
                    {
                        request.OldStatusRequests = null;
                    }
                    list.Add(request);
                }
            }
            return list;
            //return RawQuery<RequestExtendedModel>(query, new object[] { });
        }

        public List<LogExtentedModel> GetAllRequest()
        {
            //lay list request co cung requestcode
            var myList = Current.Table().ToList();
            var getRequestCodes = myList.GroupBy(x => x.RequestCode).Select(y => y.First()).ToList();
            var list = new List<LogExtentedModel>();
            for (int i = 0; i < getRequestCodes.Count; i++)
            {
                var requestCode = getRequestCodes[i].RequestCode;

                var allStatusOfRequest = from sr in Current.Table()
                                         join rt in TypeOfLogDAO.Current.Table()
                                             on sr.TypeOfLog equals rt.TypeCode into srt
                                         from subsrt in srt.DefaultIfEmpty()
                                         join st in StatusDAO.Current.Table()
                                             on sr.ObjectStatus equals st.StatusCode into sstr
                                         from subsstr in sstr.DefaultIfEmpty()
                                         join r in RequestDAO.Current.Table()
                                             on sr.RequestCode equals r.RequestCode into ssr
                                         from subssr in ssr.DefaultIfEmpty()
                                         where sr.RequestCode == requestCode && sr.Object == Constants.Object.OBJECT_REQUEST
                                         orderby sr.LogTime descending
                                         select new LogExtentedModel()
                                         {
                                             LogTime = sr.LogTime,
                                             StatusName = subsstr.StatusName,
                                             TypeOfLog = subsrt.TypeCode,
                                             RequestCode = sr.RequestCode,
                                             Customer = subssr.Customer,
                                             StatusCode = subsstr.StatusCode
                                         };
                if (allStatusOfRequest.Any())
                {
                    var requests = ParseTypeLogToRequestType(allStatusOfRequest.ToList());
                    var newest = requests.First();
                    var request = new LogExtentedModel();
                    var others = new List<LogExtentedModel>();
                    request.LastestStatusRequest = newest;
                    if (requests.Count() > 1)
                    {
                        others = requests.ToList();
                        others.RemoveAt(0);
                        request.OldStatusRequests = others.ToList();
                    }
                    else
                    {
                        request.OldStatusRequests = null;
                    }
                    list.Add(request);
                }
            }
            return list;
            //return RawQuery<RequestExtendedModel>(query, new object[] { });
        }

        public List<LogExtentedModel> ParseTypeLogToRequestType(List<LogExtentedModel> list)
        {
            var requests = new List<LogExtentedModel>();
            //doi typeOfLog --> requestType
            foreach (var item in list.ToList())
            {
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_ADD_SERVER)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.ADD_SERVER;
                    item.RequestTypeName = Constants.RequestTypeName.SERVER_ADD;
                }
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_BRING_SERVER_AWAY)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.BRING_SERVER_AWAY;
                    item.RequestTypeName = Constants.RequestTypeName.SERVER_BRINGAWAY;
                }
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_ASSIGN_IP)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.ASSIGN_IP;
                    item.RequestTypeName = Constants.RequestTypeName.IP_ASSIGN;
                }
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_CHANGE_IP)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.CHANGE_IP;
                    item.RequestTypeName = Constants.RequestTypeName.IP_CHANGE;
                }
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_RETURN_IP)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.RETURN_IP;
                    item.RequestTypeName = Constants.RequestTypeName.IP_RETURN;
                }
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_RENT_RACK)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.RENT_RACK;
                    item.RequestTypeName = Constants.RequestTypeName.RACK_RENT;
                }
                if (item.TypeOfLog == Constants.TypeOfLog.LOG_RETURN_RACK)
                {
                    item.RequestTypeCode = Constants.RequestTypeCode.RETURN_RACK;
                    item.RequestTypeName = Constants.RequestTypeName.RACK_RETURN;
                }
                requests.Add(item);
            }
            return requests;
        }

        public List<LogChangedContent> GetLogInfoByRequestCode(string requestCode, string Object)
        {
            var query = from l in Current.Table()
                        where l.RequestCode == requestCode && l.Object == Object
                        select l;
            return query.ToList();
        }
    }
}
