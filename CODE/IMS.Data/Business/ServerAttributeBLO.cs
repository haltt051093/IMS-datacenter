using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class ServerAttributeBLO : BaseBLO<ServerAttribute>
    {
        protected ServerAttributeDAO dao;
        private static ServerAttributeBLO instance;

        public static ServerAttributeBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerAttributeBLO();
                }
                return instance;
            }
        }


        private ServerAttributeBLO()
        {
            baseDao = ServerAttributeDAO.Current;
            dao = ServerAttributeDAO.Current;
        }
    }
}
