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
    }
}
