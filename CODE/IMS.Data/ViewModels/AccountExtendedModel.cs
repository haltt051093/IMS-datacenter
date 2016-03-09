using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class AccountExtendedModel : Account
    {
        public string RoleName { get; set; }
    }
}
