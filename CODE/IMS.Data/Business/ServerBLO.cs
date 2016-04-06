using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class ServerBLO : BaseBLO<Server>
    {
        protected ServerDAO dao;
        private static ServerBLO instance;

        public static ServerBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerBLO();
                }
                return instance;
            }
        }


        private ServerBLO()
        {
            baseDao = ServerDAO.Current;
            dao = ServerDAO.Current;
        }

        public List<ServerExtendedModel> GetAllServer()
        {
            return dao.GetAllServer();
        }

        public List<ServerExtendedModel> GetServerOfCustomer(string customer)
        {
            return dao.GetServerOfCustomer(customer);
        }

        public ServerExtendedModel GetServerByCode(string serverCode, string status)
        {
            return dao.GetServerByCode(serverCode, status);
        }

        public Server GetByServerCode(string servercode)
        {
            var query = @"select s.* from Server as s where s.ServerCode='" + servercode + @"'";
            return dao.RawQuery<Server>(query, new object[] { }).FirstOrDefault();
        }

        public Server GetByDefaultIP(string defaultIP)
        {
            var query = @"select s.* from Server as s where s.DefaultIP ='" + defaultIP + @"'";
            var server = dao.RawQuery<Server>(query, new object[] { }).FirstOrDefault();
            return server;
        }

        public ServerExtendedModel GetAllServerInfo(string serverCode)
        {
            return dao.GetAllServerInfo(serverCode);
        }

        public List<ServerExtendedModel> GetServersOfCustomerByStatus(string customer, string statusCode)
        {
            return dao.GetServersOfCustomerByStatus(customer, statusCode);
        }

        //add server and log
        public string AddServerANDLog(Server passServer, string requestCode)
        {
            return dao.AddServerANDLog(passServer, requestCode);
        }

        //update server and log
        public void UpdateServerANDLog(string requestCode, string serverCode,
             string typeOfLog, string newStatus, string username)
        {
            dao.UpdateServerANDLog(requestCode, serverCode, typeOfLog, newStatus, username);
        }

        public bool HasDefaultIP(string server)
        {
            var query = dao.Query(x => x.ServerCode == server).FirstOrDefault();
            if (query.DefaultIP == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public void UpdateDefaultIP(string server, string ip)
        {
            var check = HasDefaultIP(server);
            if (!check)
            {
                var s = GetByKeys(new Server { ServerCode = server });
                s.DefaultIP = ip;
                Update(s);
            }
        }

    }
}
