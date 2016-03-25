using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class ServerIPDAO : BaseDAO<ServerIP>
    {
        public static ServerIPDAO instance;

        public static ServerIPDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerIPDAO();
                }
                return instance;
            }
        }

        public override ServerIP GetByKeys(ServerIP entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public void AddServerIpAndLog(string requestCode, string serverCode, string updatedIp,
            string typeOfLog, string newStatus, string username)
        {
            //int preId = GetPreviousIp(serverCode, preIp, statusOfPreIp);
            var serverip = new ServerIP
            {
                CurrentIP = updatedIp,
                ServerCode = serverCode,
                StatusCode = newStatus,
                AssignedDate = DateTime.Now,
            };
            Add(serverip);
            //log ip, object la serverip
            Log logServerIp = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_SERVERIP,
                ChangedValueOfObject = updatedIp,
                ObjectStatus = newStatus,
                ServerCode = serverCode,
                Username = username
            };
            LogBLO.Current.Add(logServerIp);
        }

        public void UpdateServerIpANDLog(string requestCode, string serverCode, string updatedIp,
            string typeOfLog, string newStatus, string username)
        {
            var query = Query(x => x.ServerCode == serverCode && x.CurrentIP == updatedIp)
                .OrderByDescending(x => x.AssignedDate).FirstOrDefault();
            if (query != null)
            {
                query.StatusCode = newStatus;
                Update(query);
            }
            //log ip, object la serverip
            Log logServerIp = new Log
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_SERVERIP,
                ChangedValueOfObject = updatedIp,
                ObjectStatus = newStatus,
                ServerCode = serverCode,
                Username = username
            };
            LogBLO.Current.Add(logServerIp);
        }

        public void AddDefaultIPANDLog(string serverCode, string requestCode, string username)
        {
            var defaultIP = ServerBLO.Current.GetByKeys(new Server { ServerCode = serverCode }).DefaultIP;
            if (defaultIP != null)
            {
                AddServerIpAndLog(requestCode, serverCode, defaultIP, Constants.TypeOfLog.LOG_ADD_SERVER,
                    Constants.StatusCode.SERVERIP_CURRENT, username);
                //log default ip
                Log logDefaultIP = new Log
                {
                    RequestCode = requestCode,
                    TypeOfLog = Constants.TypeOfLog.LOG_ADD_SERVER,
                    Object = Constants.Object.OBJECT_IP,
                    ChangedValueOfObject = defaultIP,
                    ObjectStatus = Constants.StatusCode.IP_USED,
                    ServerCode = serverCode,
                    Username = username
                };
                LogBLO.Current.Add(logDefaultIP);
            }

        }
    }
}
