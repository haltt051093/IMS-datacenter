using System.Collections.Generic;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

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

        public void UpdateStatusServerIp(string currentStatus, string updatedStatus, string ip)
        {
            dao.UpdateStatusServerIp(currentStatus, updatedStatus, ip);
        }

        public List<string> GetReturningIps(string serverCode)
        {
            return dao.GetReturningIps(serverCode);
        }

        public void AddServerIp(string serverCode, string ip, int preId)
        {
            dao.AddServerIp(serverCode, ip, preId);
        }

        public int GetPreviousIp(string serverCode, string ip)
        {
            return dao.GetPreviousIp(serverCode, ip);
        }

        public List<string> GetIpByServer(string serverCode)
        {
            return dao.GetIpByServer(serverCode);
        }

        public void ReturnAllIpOfServer(string serverCode)
        {
            dao.ReturnAllIpOfServer(serverCode);
        }
    }
}
