using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogServerMovingDAO : BaseDAO<LogServerMoving>
    {
        public static LogServerMovingDAO instance;

        public static LogServerMovingDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogServerMovingDAO();
                }
                return instance;
            }
        }

        public override LogServerMoving GetByKeys(LogServerMoving entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
