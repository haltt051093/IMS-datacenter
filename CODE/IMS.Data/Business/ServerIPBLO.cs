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

        public List<string> GetIpByStatus(string serverCode, string status)
        {
            return dao.GetIpByStatus(serverCode, status);
        }

        public void AddServerIp(string serverCode, string updatedIp, string updatedStatus)
        {
            dao.AddServerIp(serverCode, updatedIp, updatedStatus);
        }

        public void UpdateServerIp(string serverCode, string updatedIp, string updatedStatus)
        {
            dao.UpdateServerIp(serverCode, updatedIp, updatedStatus);
        }

        //public int GetPreviousIp(string serverCode, string preIp, string statusCode)
        //{
        //    return dao.GetPreviousIp(serverCode, preIp, statusCode);
        //}

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
