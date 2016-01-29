using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;
using System.Text;
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
            return Query(x => x.Id ==  entry.Id).FirstOrDefault();
        }

        //public List<AccountExtendedModel> GetAllAccount()
        //{
        //    var query = from a in Table()
        //        join r in RoleDAO.Current.Table()
        //            on a.RoleId equals r.RoleId into ar
        //        from subr in ar.DefaultIfEmpty()
        //        select new AccountExtendedModel {Account = a, Role = subr ?? new Role()};
        //    return query.ToList();
        //}

        public List<AccountExtendedModel> GetAllAccount()
        {
            string query = @"select a.*,r.RoleName, g.GroupName from Account as a
                            left join Role as r
                            on a.RoleId = r.RoleId
                            join [Group] g
                            on a.GroupId = g.GroupId";
            return RawQuery<AccountExtendedModel>(query, new object[] {});
        }
    }
}
