using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class NotificationExtendedModel : Request
    {
        public Request _Request
        {
            set
            {
                if (value == null)
                {
                    return;
                }
                ObjectExpress.CopyValues(value, this);
            }
        }

        public string RequestTypeName { get; set; }
        public string StatusName { get; set; }
        public int Priority { get; set; }
    }
}
