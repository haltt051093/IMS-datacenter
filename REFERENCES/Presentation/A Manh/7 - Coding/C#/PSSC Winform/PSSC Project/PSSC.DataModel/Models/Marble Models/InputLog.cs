using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PSSC.DataModel.Models
{
    [Table("Ma.InputLogs")]
    public class InputLog
    {
        [Key]
        public int LogsId { get; set; }
        public int MarbleId { get; set; }
        public int StatusId { get; set; }
        public System.Nullable<DateTime> DateInputted { get; set; }

        [ForeignKey("MarbleId")]
        public Marble Marble { get; set; }
        [ForeignKey("StatusId")]
        public InputLogStatusCode InputLogStatusCode { get; set; }
    }
}
