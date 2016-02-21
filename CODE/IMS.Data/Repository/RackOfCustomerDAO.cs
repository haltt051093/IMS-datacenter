using System.Collections.Generic;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

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

        public List<RackOfCustomerExtendedModel> EmptyRentedRack(string customer)
        {
            var query = @"select DISTINCT rc.RackCode, rc.Customer, r.RackName
                        from RackOfCustomer rc
						right join Rack as r
						on r.RackCode = rc.RackCode AND r.StatusCode ='STATUS20'
                        where rc.Customer ='" + customer + @"' AND rc.RackCode NOT IN (
                        select DISTINCT l.RackCode
                        from Server as s
                        inner join Location as l
                        on s.ServerCode = l.ServerCode
                        where s.Customer = '" + customer + "')";
            return RawQuery<RackOfCustomerExtendedModel>(query, new object[] { });
        }
        public List<LocationExtendedModel> GetRackOfCustomer(Server server)
        {
            string query = @"select roc.RackCode from RackOfCustomer roc where roc.Customer = '" + server.Customer + @"'";
            return RawQuery<LocationExtendedModel>(query, new object[] { });
        }
    }
}
