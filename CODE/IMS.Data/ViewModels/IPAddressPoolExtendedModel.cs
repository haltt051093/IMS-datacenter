using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class IPAddressPoolExtendedModel : IPAddressPool
    {
        public IPAddressPool _IPAddressPool
        {
            set
            {
                if (value == null)
                {
                    return;
                }
                ObjectExpress.CopyValues<IPAddressPool>(value, this);
            }
        }

        public string StatusName { get; set; }
    }
}
