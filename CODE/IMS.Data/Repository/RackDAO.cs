using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class RackDAO : BaseDAO<Rack>
    {
        public static RackDAO instance;

        public static RackDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackDAO();
                }
                return instance;
            }
        }

        public override Rack GetByKeys(Rack entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
