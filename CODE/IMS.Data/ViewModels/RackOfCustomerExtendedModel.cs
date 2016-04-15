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
        public bool Checked { get; set; }
        public int? Power { get; set; }
        public int MaximumPower { get; set; }
        public string Bandwidth { get; set; }
        public int? Size { get; set; }
        public string ServerStatus { get; set; }
    }
}
