using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class LogNoteDAO : BaseDAO<LogNote>
    {
        public static LogNoteDAO instance;

        public static LogNoteDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogNoteDAO();
                }
                return instance;
            }
        }

        public override LogNote GetByKeys(LogNote entry)
        {
            return Query(x => x.LogId == entry.LogId).FirstOrDefault();
        }
    }
}
