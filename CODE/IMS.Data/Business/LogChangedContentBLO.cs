using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class LogChangedContentBLO : BaseBLO<LogChangedContent>
    {
        protected LogChangedContentDAO dao;
        private static LogChangedContentBLO instance;

        public static LogChangedContentBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogChangedContentBLO();
                }
                return instance;
            }
        }


        private LogChangedContentBLO()
        {
            baseDao = LogChangedContentDAO.Current;
            dao = LogChangedContentDAO.Current;
        }

        public List<LogChangedContent> GetBlockedIP(string IP)
        {
            return dao.GetBlockedIP(IP);
        }

        public List<LogContentExtendedModel> GetAllLogIP()
        {
            return dao.GetAllLogIP();
        }

        public List<LogUsedIPExtendModel> GetLogUsedIP()
        {
            return dao.GetLogUsedIP();
        }

        public void AddLog(LogChangedContent viewmodel)
        {
            dao.AddLog(viewmodel);
        }

        public List<string> GetIpRequestReturnIp(string requestCode)
        {
            return dao.GetIpRequestReturnIp(requestCode);
        }

        public List<string> GetServerCodeByRequestCode(string requestCode)
        {
            return dao.GetServerCodeByRequestCode(requestCode);
        }

        public List<RequestExtendedModel> ListWaitingRequestOfServer(string serverCode)
        {
            return dao.ListWaitingRequestOfServer(serverCode);
        }

        public List<LogExtentedModel> GetAllRequest()
        {
            return dao.GetAllRequest();
        }

        public List<LogChangedContent> GetLogInfoByRequestCode(string requestCode, string Object)
        {
            return dao.GetLogInfoByRequestCode(requestCode, Object);
        }

        public LogChangedContent GetByServerCode(string servercode)
        {
            var query = @"select s.* from LogChangedContent as s where s.ServerCode='" + servercode + @"'and s.TypeOfLog='ASSIGNDEFAULTIP'";
            return dao.RawQuery<LogChangedContent>(query, new object[] { }).FirstOrDefault();
        }

        public void CancelRequestChangeIp(string requestCode, string customer)
        {
            var listServerIp = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT,
                        customer);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer);
            }
        }

        public void CancelRequestReturnIp(string requestCode, string customer)
        {
            var listServerIp = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT,
                        customer);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer);
            }
        }

        public void CancelRequestBringServerAway(string requestCode, string customer)
        {
            var listServerIp = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVERIP_CURRENT,
                        customer);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer);
                //update and log server
                ServerBLO.Current.UpdateServerStatus(requestCode, serverCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_RUNNING,
                    Constants.Test.CUSTOMER_MANHNH);
            }
        }

        public void CancelRequestReturnRack(string requestCode, string customer)
        {
            var listRacks = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_RACKOFCUSTOMER);
            if (listRacks != null && listRacks.Count > 0)
            {
                for (int i = 0; i < listRacks.Count; i++)
                {
                    var rack = listRacks[i].ChangedValueOfObject;
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, rack,
                        Constants.TypeOfLog.LOG_RETURN_RACK, customer, null,
                        Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer);
            }
        }

        public void CancelRequestAddServer(string requestCode, string customer)
        {
            var listRacks = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_RACKOFCUSTOMER);
            if (listRacks != null && listRacks.Count > 0)
            {
                for (int i = 0; i < listRacks.Count; i++)
                {
                    var rack = listRacks[i].ChangedValueOfObject;
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, rack,
                        Constants.TypeOfLog.LOG_RETURN_RACK, customer, null,
                        Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT);
                }
                //update request status and log
                RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer);
            }
        }

        public LogExtentedModel RequestDetailsBringServerAway(string requestCode)
        {
            LogExtentedModel data = new LogExtentedModel();
            List<ServerExtendedModel> list = new List<ServerExtendedModel>();
            //list server
            var listServers = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVER)
                .Where(x => x.ObjectStatus == Constants.StatusCode.SERVER_BRINGING_AWAY).Select(x => x.ChangedValueOfObject);
            var servers = from s in listServers
                          select new ServerExtendedModel()
                          {
                              ServerCode = s
                          };
            data.ReturnServerNumber = listServers.ToList().Count();
            foreach (var item in servers)
            {
                ServerExtendedModel s = new ServerExtendedModel();
                s.ServerCode = item.ServerCode;
                //list serverips
                var listServerIps = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP)
                    .Where(x => x.ObjectStatus == Constants.StatusCode.SERVERIP_RETURNING && x.ServerCode == s.ServerCode)
                    .Select(x => x.ChangedValueOfObject);
                var ips = from i in listServerIps
                          select new ServerIP
                          {
                              CurrentIP = i
                          };
                s.ServerIps = ips.ToList();
                data.ReturnIpNumber = data.ReturnIpNumber + listServerIps.ToList().Count();

                //list serverLocation
                var listServerLocation = GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_LOCATION)
                    .Where(x => x.ObjectStatus == Constants.StatusCode.LOCATION_USED && x.ServerCode == s.ServerCode)
                    .Select(x => x.ChangedValueOfObject);
                s.locations = listServerLocation.ToList();
                data.ReturnLocationNumber = data.ReturnLocationNumber + listServerLocation.ToList().Count();
                list.Add(s);
            }
            data.Servers = list;
            return data;
        }

        public List<LocationViewModel> GetLocationOfServer(string serverCode)
        {
            var serverlocation = from l in LocationDAO.Current.Table()
                                 join r in RackDAO.Current.Table()
                                     on l.RackCode equals r.RackCode into lr
                                 from sublr in lr.DefaultIfEmpty()
                                 where l.ServerCode == serverCode
                                 select new LocationViewModel
                                 {
                                     RackName = sublr.RackName,
                                     RackUnit = l.RackUnit
                                 };
            return serverlocation.ToList();
        }

        public LogExtentedModel RequestDetailsReturnRack(string requestCode)
        {
            LogExtentedModel data = new LogExtentedModel();
            var query = from l in LogChangedContentDAO.Current.Table()
                        where l.RequestCode == requestCode && l.Object == Constants.Object.OBJECT_RACKOFCUSTOMER
                        select l.ChangedValueOfObject;
            data.listRacks = query.ToList();
            return data;
        }

        public List<string> GetChangedValueOfObject(string requestCode, string obj, string objStatus)
        {
            var query = from l in LogChangedContentDAO.Current.Table()
                        where l.RequestCode == requestCode && l.Object == obj && l.ObjectStatus == objStatus
                        select l.ChangedValueOfObject;
            return query.ToList();
        }

    }
}
