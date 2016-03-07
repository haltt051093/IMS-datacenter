using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RackOfCustomerExtendedModel : RackOfCustomer
    {
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
