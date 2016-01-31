using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class IPAddressPoolDAO : BaseDAO<IPAddressPool>
    {
        public static IPAddressPoolDAO instance;

        public static IPAddressPoolDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new IPAddressPoolDAO();
                }
                return instance;
            }
        }

        public override IPAddressPool GetByKeys(IPAddressPool entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
        public List<IPExtendedModel> GetAllIP()
        {
            string query = @"select i.*,s.Status from IPAddressPool as i
                            left join Status as s
                            on s.StatusCode = i.StatusCode";
            return RawQuery<IPExtendedModel>(query, new object[] { });
        }
    }
}
