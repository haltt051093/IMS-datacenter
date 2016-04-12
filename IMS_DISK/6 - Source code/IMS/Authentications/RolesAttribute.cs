using System.Web.Mvc;

namespace IMS.Authentications
{
    public class RolesAttribute : AuthorizeAttribute
    {
        public RolesAttribute()
        {

        }

        public RolesAttribute(params string[] roles)
        {
            Roles = string.Join(",", roles);
        }
    }
}