using System.Collections.Generic;
using IMS.Data.Models;

namespace IMS.Models
{
    public class HomeHeaderViewModel
    {
        // Account Information
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

        public string Group {
            get
            {
                if (Account == null)
                {
                    return string.Empty;
                }
                else
                {
                    return Account.GroupCode;
                }
            }
        }

        // Notifications
        public List<Notification> Notifications { get; set; }
        public int NumberOfUnread { get; set; }
    }
}