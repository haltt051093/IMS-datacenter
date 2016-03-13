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

        public List<AttributeExtendedModel> GetServerAttributes(int id)
        {
            return dao.GetServerAttributes(id);
        }

        public ServerExtendedModel GetServerByCode(string serverCode, string status)
        {
            return dao.GetServerByCode(serverCode, status);
        }

        //public List<Server> Search(string searchBy, string searchValue)
        //{
        //    return dao.Search(searchBy, searchValue).ToList();
        //}

        public List<ServerIP> GetCurrentIP(string serverCode)
        {
            return dao.GetCurrentIP(serverCode);
        }

        public ServerIP GetByIP(string ip)
        {
            var query = @"select s.* from ServerIP as s where s.CurrentIP='" + ip + @"'";
            return dao.RawQuery<ServerIP>(query, new object[] { }).FirstOrDefault();
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
        //public List<ServerViewModel> GetServers()
        //{
        //    var query = @"select *, a.Fullname
        //                from server as s
        //                join account as a on
        //                    s.CustomerId = a.UserId";
        //    var list = dao.RawQuery<ServerViewModel>(query, new object[] { }).ToList();
        //    return list;
        //}

        public string AddServer(Server passServer)
        {
            return dao.AddServer(passServer);
        }

        //change server status
        public void UpdateServerStatus(string requestCode, string serverCode,
             string typeOfLog, string newStatus, string username)
        {
            var server = ServerDAO.Current.Query(x => x.ServerCode == serverCode).FirstOrDefault();
            if (server != null)
            {
                server.StatusCode = newStatus;
                Update(server);
            }
            //log server
            LogChangedContent logServer = new LogChangedContent
            {
                RequestCode = requestCode,
                TypeOfLog = typeOfLog,
                Object = Constants.Object.OBJECT_SERVER,
                ChangedValueOfObject = serverCode,
                ObjectStatus = newStatus,
            };
            LogChangedContentBLO.Current.AddLog(logServer);
        }

        public ServerExtendedModel GetAllServerInfo(string serverCode)
        {
            return dao.GetAllServerInfo(serverCode);
        }
    }
}
