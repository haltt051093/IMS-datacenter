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
    }
}
