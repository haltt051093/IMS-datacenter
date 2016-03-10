using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
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

        public List<string> GetIpByServer(string serverCode)
        {
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.StatusCode == Constants.StatusCode.SERVERIP_CURRENT)
                .Select(x => x.CurrentIP);
            return query.ToList();
        }

        public void AddServerIp(string serverCode, string updatedIp, string updatedStatus)
        {
            //int preId = GetPreviousIp(serverCode, preIp, statusOfPreIp);
            var serverip = new ServerIP
            {
                CurrentIP = updatedIp,
                ServerCode = serverCode,
                StatusCode = updatedStatus,
                AssignedDate = DateTime.Now,
            };
            Add(serverip);
        }

        public void UpdateServerIp(string serverCode, string updatedIp, string updatedStatus)
        {
            var query = Query(x => x.ServerCode == serverCode && x.CurrentIP == updatedIp)
                .OrderByDescending(x => x.AssignedDate).FirstOrDefault();
            if (query != null)
            {
                query.StatusCode = updatedStatus;
                Update(query);
            }
        }

        //public int GetPreviousIp(string serverCode, string preIp, string statusCode)
        //{
        //    var query =
        //        Current.Query(
        //            x =>
        //                x.CurrentIP == preIp && x.ServerCode == serverCode &&
        //                x.StatusCode == statusCode).Select(x => x.Id).FirstOrDefault();
        //    return query;
        //}

        public List<string> GetIpByStatus(string serverCode, string status)
        {
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.StatusCode == status)
                .Select(x => x.CurrentIP);
            return query.ToList();
        }

        public void ReturnAllIpOfServer(string serverCode)
        {
            var serverips = Current.Query(x => x.StatusCode == serverCode);
            for (var i = 0; i < serverips.Count; i++)
            {
                serverips[i].StatusCode = Constants.StatusCode.SERVERIP_OLD;
                Update(serverips[i]);
            }
        }
    }
}
