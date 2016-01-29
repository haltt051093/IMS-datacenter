using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class RackOfCustomerDAO : BaseDAO<RackOfCustomer>
    {
        public static RackOfCustomerDAO instance;

        public static RackOfCustomerDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackOfCustomerDAO();
                }
                return instance;
            }
        }

        public override RackOfCustomer GetByKeys(RackOfCustomer entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
