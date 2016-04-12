using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using System.Linq;
using IMS.Data.ViewModels;
using IMS.Core;

namespace IMS.Data.Business
{
    public class ServerIPBLO : BaseBLO<ServerIP>
    {
        protected ServerIPDAO dao;
        private static ServerIPBLO instance;

        public static ServerIPBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerIPBLO();
                }
                return instance;
            }
        }


        private ServerIPBLO()
        {
            baseDao = ServerIPDAO.Current;
            dao = ServerIPDAO.Current;
        }

        public List<string> GetIpByStatus(string serverCode, string status)
        {
            var result = dao.Query(x => x.ServerCode == serverCode && x.StatusCode == status)
                .Select(x => x.CurrentIP)
                .ToList();
            return result;
        }

        public List<string> GetIpByServer(string serverCode, string statusCode)
        {
            var result = dao.Query(x => x.ServerCode == serverCode && x.StatusCode == statusCode)
                .Select(x => x.CurrentIP)
                .ToList();
            return result;
        }

        public List<ServerIPExtendedModel> GetIPtoFetch(string serverCode, string status)
        {
            var query = from si in ServerIPDAO.Current.Table
                        join ip in IPAddressPoolDAO.Current.Table
                            on si.CurrentIP equals ip.IPAddress into siip
                        from subsiip in siip.DefaultIfEmpty()
                        where si.ServerCode == serverCode && si.StatusCode == status
                        select new ServerIPExtendedModel()
                        {
                            StatusCode = si.StatusCode,
                            IsDefault = subsiip.IsDefault,
                            CurrentIP = si.CurrentIP,
                            ServerCode = si.ServerCode
                        };
            return query.OrderBy(x => x.CurrentIP).ToList();
        }

        public List<ServerIP> GetCurrentIP(string serverCode)
        {
            var query = from s in ServerDAO.Current.Table
                        join si in ServerIPDAO.Current.Table
                            on s.ServerCode equals si.ServerCode
                        where s.ServerCode == serverCode &&  si.StatusCode == Constants.StatusCode.SERVERIP_CURRENT
                        select si;
            return query.ToList();
        }

        public ServerIP GetByIP(string ip)
        {
            var query = @"select s.* from ServerIP as s where s.CurrentIP='" + ip + @"'";
            return dao.RawQuery<ServerIP>(query, new object[] { }).FirstOrDefault();
        }

        public void AddServerIpAndLog(string requestCode, string serverCode, string updatedIp,
           string typeOfLog, string newStatus, string username)
        {
            dao.AddServerIpAndLog(requestCode, serverCode, updatedIp, typeOfLog, newStatus, username);
        }

        public void UpdateServerIpANDLog(string requestCode, string serverCode, string updatedIp,
             string typeOfLog, string newStatus, string username)
        {
            dao.UpdateServerIpANDLog(requestCode, serverCode, updatedIp, typeOfLog, newStatus, username);
        }

        public void AddDefaultIPANDLog(string serverCode, string requestCode, string username)
        {
            dao.AddDefaultIPANDLog(serverCode, requestCode, username);
        }
    }
}
