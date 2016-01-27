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
    public class LogConfirmedRequestBLO : BaseBLO<LogConfirmedRequest>
    {
        protected LogConfirmedRequestDAO dao;
        private static LogConfirmedRequestBLO instance;

        public static LogConfirmedRequestBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogConfirmedRequestBLO();
                }
                return instance;
            }
        }


        private LogConfirmedRequestBLO()
        {
            baseDao = LogConfirmedRequestDAO.Current;
            dao = LogConfirmedRequestDAO.Current;
        }
    }
}
