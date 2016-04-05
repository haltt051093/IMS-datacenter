using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PSSC.DataModel.Models
{
    [Table("Or.Orders")]
    public class Order
    {
        [Key]
        public int OrderId { get; set; }
        public string OrderCode { get; set; }
        public System.Nullable<DateTime> OrderDate { get; set; }
        public double? Total { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerPhone { get; set; }
        public string CustomerAddress { get; set; }      

        public IList<OrderDetail> OrderDetails { get; set; }
    }
}
