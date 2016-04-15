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
        public string ServerCode { get; set; }
        public int? Size { get; set; }
        public int? Power { get; set; }
        public string Bandwidth { get; set; }
        public string ServerStatus { get; set; }
        public string ServerOwner { get; set; }
    }
}
