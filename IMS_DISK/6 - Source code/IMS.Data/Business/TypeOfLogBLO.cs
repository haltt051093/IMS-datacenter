using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class TypeOfLogBLO : BaseBLO<TypeOfLog>
    {
        protected TypeOfLogDAO dao;
        private static TypeOfLogBLO instance;

        public static TypeOfLogBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new TypeOfLogBLO();
                }
                return instance;
            }
        }

        private TypeOfLogBLO()
        {
            baseDao = TypeOfLogDAO.Current;
            dao = TypeOfLogDAO.Current;
        }

        public List<TypeOfLog> GetLogTypeOfRequest()
        {
            var list = new List<TypeOfLog>();
            var addServer = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_ADD_SERVER).FirstOrDefault();
            list.Add(addServer);
            var bringserveraway = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_BRING_SERVER_AWAY).FirstOrDefault();
            list.Add(bringserveraway);
            var assignip = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_ASSIGN_IP).FirstOrDefault();
            list.Add(assignip);
            var changeip = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_CHANGE_IP).FirstOrDefault();
            list.Add(changeip);
            var returnip = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_RETURN_IP).FirstOrDefault();
            list.Add(returnip);
            var rentrack = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_RENT_RACK).FirstOrDefault();
            list.Add(rentrack);
            var returnrack = TypeOfLogDAO.Current.Query(x => x.TypeCode == Constants.TypeOfLog.LOG_RETURN_RACK).FirstOrDefault();
            list.Add(returnrack);
            return list;
        }
    }
}
