using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PSSC.DataModel.Models
{
    [Table("Ma.Marbles")]
    public class Marble
    {
        [Key]
        public int MarbleId { get; set; }
        public string MarbleColor { get; set; }
        public string MarbleDescription { get; set; }
        public double? Price {get;set;}
        public System.Nullable<DateTime> DateOfCreation { get; set; }
        public System.Nullable<DateTime> DateOfLastModification { get; set; }

        public IList<Repository> Repositoies { get; set; }
        public IList<InputLog> InputLogs { get; set; }
        public IList<OrderDetail> OrderDetails { get; set; }
    }
}
