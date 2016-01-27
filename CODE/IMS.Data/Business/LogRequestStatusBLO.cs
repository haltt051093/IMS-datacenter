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
    public class LogRequestStatusBLO : BaseBLO<LogRequestStatus>
    {
        protected LogRequestStatusDAO dao;
        private static LogRequestStatusBLO instance;

        public static LogRequestStatusBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogRequestStatusBLO();
                }
                return instance;
            }
        }


        private LogRequestStatusBLO()
        {
            baseDao = LogRequestStatusDAO.Current;
            dao = LogRequestStatusDAO.Current;
        }
    }
}
