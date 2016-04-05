using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PSSC.DataModel.Models
{
    [Table("Ma.InputLogsStatusCodes")]
    public class InputLogStatusCode
    {
        [Key]
        public int StatusId { get; set; }
        public string StatusName { get; set; }
        public string StatusDescription { get; set; }
        public string StatusType { get; set; }
        public System.Nullable<DateTime> DateOfCreation { get; set; }
        public System.Nullable<DateTime> DateOfLastModification { get; set; }

        public IList<InputLog> InputLogs { get; set; }
    }
}
