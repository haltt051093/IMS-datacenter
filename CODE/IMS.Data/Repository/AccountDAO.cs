using System.Collections.Generic;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class AccountDAO : BaseDAO<Account>
    {
        private static AccountDAO instance;

        public static AccountDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AccountDAO();
                }
                return instance;
            }
        }

        public override Account GetByKeys(Account entry)
        {
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.Username == entry.Username).FirstOrDefault();
            }
            return existing;

        }

        public List<AccountExtendedModel> GetAllAccount()
        {
            var query = @"select a.*,r.RoleName, g.GroupCode from Account as a
                            left join Role as r
                            on a.Role = r.RoleName
                            join [Group] g
                            on a.GroupCode = g.GroupCode";
            return RawQuery<AccountExtendedModel>(query, new object[] { });
        }
    }
}
