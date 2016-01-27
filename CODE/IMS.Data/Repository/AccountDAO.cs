using System;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;
using System.Text;

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

        public override void Add(Account entry)
        {
            entry.Password = GeneratePassword();
            entry.Status = true;
            base.Add(entry);
        }

        public virtual string GeneratePassword()
        {

            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < 10; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            return builder.ToString();
        }


        public override Account GetByKeys(Account entry)
        {
            return Query(x => x.Username == entry.Username && x.Password == entry.Password).FirstOrDefault();
        }
    }
}
