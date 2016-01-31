﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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

        public List<AttributeExtendedModel> GetServerAttributes(int id)
        {
            return dao.GetServerAttributes(id);
        }

        public ServerExtendedModel GetServerById(int id)
        {
            return dao.GetServerById(id);
        }

        //public List<Server> Search(string searchBy, string searchValue)
        //{
        //    return dao.Search(searchBy, searchValue).ToList();
        //}

        public List<ServerIP> GetCurrentIP(int id)
        {
            return dao.GetCurrentIP(id);
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
    }
}
