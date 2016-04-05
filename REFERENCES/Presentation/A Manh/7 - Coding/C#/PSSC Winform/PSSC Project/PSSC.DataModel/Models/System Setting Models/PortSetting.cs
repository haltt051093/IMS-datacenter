using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PSSC.DataModel.Models
{
    [Table("Sy.PortSettings")]
    public class PortSetting
    {
        [Key]
        public int PortId { get; set; }
        public string Name { get; set; }
        public string Value { get; set; }
    }
}
