using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class AccountBLO : BaseBLO<Account>
    {
        protected AccountDAO dao;
        private static AccountBLO instance;

        public static AccountBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AccountBLO();
                }
                return instance;
            }
        }


        private AccountBLO()
        {
            baseDao = AccountDAO.Current;
            dao = AccountDAO.Current;
        }

        public virtual string GeneratePassword()
        {
            return dao.GeneratePassword();
        }

        public List<AccountExtendedModel> GetAllAccount()
        {
            return dao.GetAllAccount();
        }
    }
}
