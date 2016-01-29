using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;

namespace IMS.Data.Repository
{
    public class ObjectDAO : BaseDAO<Models.Object>
    {
        public static ObjectDAO instance;

        public static ObjectDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ObjectDAO();
                }
                return instance;
            }
        }

        public override Models.Object GetByKeys(Models.Object entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
