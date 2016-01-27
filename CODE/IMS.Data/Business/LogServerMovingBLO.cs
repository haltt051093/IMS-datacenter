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
    public class LogServerMovingBLO : BaseBLO<LogServerMoving>
    {
        protected LogServerMovingDAO dao;
        private static LogServerMovingBLO instance;

        public static LogServerMovingBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogServerMovingBLO();
                }
                return instance;
            }
        }


        private LogServerMovingBLO()
        {
            baseDao = LogServerMovingDAO.Current;
            dao = LogServerMovingDAO.Current;
        }
    }
}
