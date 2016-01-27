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
    public class LogIPStatusBLO : BaseBLO<LogIPStatus>
    {
        protected LogIPStatusDAO dao;
        private static LogIPStatusBLO instance;

        public static LogIPStatusBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogIPStatusBLO();
                }
                return instance;
            }
        }


        private LogIPStatusBLO()
        {
            baseDao = LogIPStatusDAO.Current;
            dao = LogIPStatusDAO.Current;
        }
    }
}
