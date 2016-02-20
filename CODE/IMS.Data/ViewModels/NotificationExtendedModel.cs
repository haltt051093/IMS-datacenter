using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class NotificationExtendedModel : Request
    {
        public string RequestTypeName { get; set; }
        public string StatusName { get; set; }
    }
}
