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
    public class LogNoteBLO : BaseBLO<LogNote>
    {
        protected LogNoteDAO dao;
        private static LogNoteBLO instance;

        public static LogNoteBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new LogNoteBLO();
                }
                return instance;
            }
        }


        private LogNoteBLO()
        {
            baseDao = LogNoteDAO.Current;
            dao = LogNoteDAO.Current;
        }
    }
}
