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
    }
}
