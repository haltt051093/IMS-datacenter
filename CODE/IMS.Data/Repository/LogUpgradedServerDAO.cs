using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogUpgradedServerDAO : BaseDAO<LogUpgradedServer>
    {
        public static LogUpgradedServerDAO instance;

        public static LogUpgradedServerDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogUpgradedServerDAO();
                }
                return instance;
            }
        }

        public override LogUpgradedServer GetByKeys(LogUpgradedServer entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
