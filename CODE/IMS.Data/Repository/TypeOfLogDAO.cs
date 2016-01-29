using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class TypeOfLogDAO : BaseDAO<TypeOfLog>
    {
        public static TypeOfLogDAO instance;

        public static TypeOfLogDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new TypeOfLogDAO();
                }
                return instance;
            }
        }

        public override TypeOfLog GetByKeys(TypeOfLog entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
