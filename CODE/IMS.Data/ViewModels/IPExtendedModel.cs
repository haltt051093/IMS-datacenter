using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class IPExtendedModel : IPAddressPool
    {
        public IPAddressPool _IP
        {
            set
            {
                ObjectExpress.CopyValues<IPAddressPool>(value, this);
            }
        }

        public string StatusName { get; set; }
    }
}
