using System.Web.Http;
using IMS.Data.Business;
using IMS.Data.Models;

namespace IMS.ApiControllers
{
    public class BaseApiController : ApiController
    {
        protected Account GetCurrentAccount()
        {
            if (User == null || string.IsNullOrEmpty(User.Identity.Name))
            {
                return null;
            }

            var account = AccountBLO.Current.GetAccountByCode(User.Identity.Name);
            return account;
        }

        protected string GetCurrentUserName()
        {
            if (User == null)
            {
                return string.Empty;
            }
            return User.Identity.Name;
        }

        protected string GetCurrentUserRole()
        {
            var account = GetCurrentAccount();
            var role = string.Empty;
            if (account != null)
            {
                role = account.Role;
            }
            return role;
        }
    }
}
