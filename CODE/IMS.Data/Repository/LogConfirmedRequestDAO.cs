using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogConfirmedRequestDAO : BaseDAO<LogConfirmedRequest>
    {
        public static LogConfirmedRequestDAO instance;

        public static LogConfirmedRequestDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogConfirmedRequestDAO();
                }
                return instance;
            }
        }

        public override LogConfirmedRequest GetByKeys(LogConfirmedRequest entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
