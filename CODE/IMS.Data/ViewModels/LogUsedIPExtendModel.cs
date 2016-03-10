using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LogUsedIPExtendModel
    {
        public string IPAddress { get; set; }
        public string NetworkIP { get; set; }
        public DateTime? LogTime { get; set; }
        public string ServerCode { get; set; }
        public string TypeName { get; set; }
        public string StatusName { get; set; }

    }
}
