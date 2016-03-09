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

        public void UpdateStatusServerIp(string currentStatus, string updatedStatus, string ip)
        {
            var update = Current.Query(x => x.StatusCode == currentStatus && x.CurrentIP == ip).FirstOrDefault();
            if (update != null)
            {
                update.StatusCode = updatedStatus;
                Update(update);
            }
        }

        public List<string> GetReturningIps(string serverCode)
        {
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.StatusCode == Constants.StatusCode.SERVERIP_RETURNING)
                .Select(x => x.CurrentIP);
            return query.ToList();
        }

        public List<string> GetIpByServer(string serverCode)
        {
            var query =
                Current.Query(x => x.ServerCode == serverCode && x.StatusCode == Constants.StatusCode.SERVERIP_CURRENT)
                .Select(x => x.CurrentIP);
            return query.ToList();
        }

        public void AddServerIp(string serverCode, string ip, int preId)
        {
            var serverip = new ServerIP
            {
                CurrentIP = ip,
                ServerCode = serverCode,
                StatusCode = Constants.StatusCode.SERVERIP_CURRENT,
                AssignedDate = DateTime.Now,
                PreviousId = preId
            };
            Add(serverip);
        }

        public int GetPreviousIp(string serverCode, string ip)
        {
            var query =
                Current.Query(
                    x =>
                        x.CurrentIP == ip && x.ServerCode == serverCode &&
                        x.StatusCode == Constants.StatusCode.SERVERIP_RETURNING).Select(x => x.Id).FirstOrDefault();
            return query;
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
