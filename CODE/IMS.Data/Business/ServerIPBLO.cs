﻿using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using System.Linq;

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

        public List<string> GetIpByServer(string serverCode, string statusCode)
        {
            var result = dao.Query(x => x.ServerCode == serverCode && x.StatusCode == statusCode)
                .Select(x => x.CurrentIP)
                .ToList();
            return result;
        }

        public List<ServerIP> GetIPtoFetch(string serverCode, string status)
        {
            var query = from si in ServerIPDAO.Current.Table
                        where si.ServerCode == serverCode && si.StatusCode == status
                        select si;
            return query.OrderBy(x => x.CurrentIP).ToList();
        }
    }
}
