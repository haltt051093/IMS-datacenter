using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class LogBLO : BaseBLO<Log>
    {
        protected LogDAO dao;
        private static LogBLO instance;

        public static LogBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogBLO();
                }
                return instance;
            }
        }

        private LogBLO()
        {
            baseDao = LogDAO.Current;
            dao = LogDAO.Current;
        }

        public List<Log> GetBlockedIP(string IP)
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

        public List<string> GetIpRequestReturnIp(string requestCode)
        {
            return dao.GetIpRequestReturnIp(requestCode);
        }

        public List<string> GetServerCodeByRequestCode(string requestCode)
        {
            return dao.GetServerCodeByRequestCode(requestCode);
        }

        public List<string> GetAddingServers(string requestCode)
        {
            return dao.GetAddingServers(requestCode);
        }

        public List<LogExtentedModel> GetRequestOfCustomer(string customer)
        {
            return dao.GetRequestOfCustomer(customer);
        }

        public List<LogExtentedModel> GetAllRequest()
        {
            return dao.GetAllRequest();
        }

        public List<Log> GetLogInfoByRequestCode(string requestCode, string Object)
        {
            return dao.GetLogInfoByRequestCode(requestCode, Object);
        }

        public Log GetByServerCode(string servercode)
        {
            var query = @"select s.* from LogChangedContent as s where s.ServerCode='" + servercode + @"'and s.TypeOfLog='ASSIGNDEFAULTIP'";
            return dao.RawQuery<Log>(query, new object[] { }).FirstOrDefault();
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
                    .Where(x => x.ObjectStatus == Constants.StatusCode.LOCATION_USED)
                    .Select(x => x.ChangedValueOfObject);
                s.locations = listServerLocation.ToList();
                data.ReturnLocationNumber = data.ReturnLocationNumber + listServerLocation.ToList().Count();
                list.Add(s);
            }
            data.Servers = list;
            return data;
        }

        public LogExtentedModel RequestDetailsReturnRack(string requestCode)
        {
            LogExtentedModel data = new LogExtentedModel();
            var query = from l in LogDAO.Current.Table
                        where l.RequestCode == requestCode && l.Object == Constants.Object.OBJECT_RACKOFCUSTOMER
                        && l.ObjectStatus == Constants.StatusCode.RACKOFCUSTOMER_RETURNING
                        select l.ChangedValueOfObject;
            data.listRacks = query.ToList();
            return data;
        }

        public List<string> GetChangedValueOfObject(string requestCode, string obj, string objStatus)
        {
            var query = from l in LogDAO.Current.Table
                        where l.RequestCode == requestCode && l.Object == obj && l.ObjectStatus == objStatus
                        select l.ChangedValueOfObject;
            return query.ToList();
        }
    }
}
