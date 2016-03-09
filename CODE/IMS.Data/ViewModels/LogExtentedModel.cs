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
    public class LogExtentedModel : LogChangedContent
    {
        public string StatusName { get; set; }
        public string RequestTypeName { get; set; }

        public LogExtentedModel LastestStatusRequest { get; set; }
        public List<LogExtentedModel> OldStatusRequests { get; set; }
    }
}
