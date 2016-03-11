using System.Web.Mvc;

namespace IMS.Authentications
{
    public class RolesAttribute : AuthorizeAttribute
    {
        public RolesAttribute()
        {

        }

        public RolesAttribute(string[] roles)
        {
            Roles = string.Join(",", roles);
        }
    }
}