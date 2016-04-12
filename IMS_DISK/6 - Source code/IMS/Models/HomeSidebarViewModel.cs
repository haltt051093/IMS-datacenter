using IMS.Data.Models;

namespace IMS.Models
{
    public class HomeSidebarViewModel
    {
        public Account Account { get; set; }

        public string Role
        {
            get
            {
                if (Account == null)
                {
                    return string.Empty;
                }
                else
                {
                    return Account.Role;
                }
            }
        }
    }
}
