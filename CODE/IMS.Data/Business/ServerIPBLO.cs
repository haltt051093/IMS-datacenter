using System.Collections.Generic;
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
            return dao.GetIpByStatus(serverCode, status);
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

        //public int GetPreviousIp(string serverCode, string preIp, string statusCode)
        //{
        //    return dao.GetPreviousIp(serverCode, preIp, statusCode);
        //}

        public List<string> GetIpByServer(string serverCode, string statusCode)
        {
            return dao.GetIpByServer(serverCode, statusCode);
        }
        public ServerIP GetByServerCode(string servercode)
        {
            var query = @"select s.* from ServerIP as s where s.ServerCode='" + servercode + @"'";
            return dao.RawQuery<ServerIP>(query, new object[] { }).FirstOrDefault();
        }
        //public void ReturnAllIpOfServer(string serverCode)
        //{
        //    dao.ReturnAllIpOfServer(serverCode);
        //}
    }
}
