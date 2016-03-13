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

        public List<string> GetIpByServer(string serverCode, string statusCode)
        {
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.StatusCode == statusCode)
                .Select(x => x.CurrentIP);
            return query.ToList();
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
            LogChangedContent logServerIp = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_SERVERIP,
                ChangedValueOfObject = updatedIp,
                ObjectStatus = newStatus,
                ServerCode = serverCode
            };
            LogChangedContentBLO.Current.AddLog(logServerIp);
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
            LogChangedContent logServerIp = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_SERVERIP,
                ChangedValueOfObject = updatedIp,
                ObjectStatus = newStatus,
                ServerCode = serverCode,
                Username = username
            };
            LogChangedContentBLO.Current.AddLog(logServerIp);
        }

        public List<string> GetIpByStatus(string serverCode, string status)
        {
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.StatusCode == status)
                .Select(x => x.CurrentIP);
            return query.ToList();
        }

        //public void ReturnAllIpOfServer(string serverCode)
        //{
        //    var serverips = Current.Query(x => x.StatusCode == serverCode);
        //    for (var i = 0; i < serverips.Count; i++)
        //    {
        //        serverips[i].StatusCode = Constants.StatusCode.SERVERIP_OLD;
        //        Update(serverips[i]);
        //    }
        //}
    }
}
