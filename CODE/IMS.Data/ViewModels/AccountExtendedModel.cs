using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class AccountExtendedModel : Account
    {
        public int CountMember { get; set; }
    }
}
