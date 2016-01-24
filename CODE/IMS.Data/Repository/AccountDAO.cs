using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

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
            return Query(x => x.Username == entry.Username && x.Password == entry.Password).FirstOrDefault();
        }
    }
}
