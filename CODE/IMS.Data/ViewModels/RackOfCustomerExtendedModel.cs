using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RackOfCustomerExtendedModel : RackOfCustomer
    {
        public RackOfCustomer _RackOfCustomer
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

        public string RackName { get; set; }
        public int? RackUnit { get; set; }
        public string ServerCode { get; set; }
        public string StatusName { get; set; }
        public int ServerNum { get; set; }
        public string DefaultIP { get; set; }
        public string RackStatus { get; set; }
        public string LocationCode { get; set; }
    }
}
