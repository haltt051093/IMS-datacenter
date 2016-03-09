using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class IPExtendedModel : IPAddressPool
    {
        public IPExtendedModel()
        {
        }

        public IPExtendedModel(IPAddressPool ip)
        {
            ObjectExpress.CopyValues<IPAddressPool>(ip, this);
        }

        public string StatusName { get; set; }
    }
}
