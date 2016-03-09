using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LogExtentedModel : LogChangedContent
    {
        public LogExtentedModel()
        {
            
        }

        public LogExtentedModel(LogChangedContent log)
        {
            ObjectExpress.CopyValues(log, this);
        }

        public string StatusName { get; set; }
        public string RequestTypeName { get; set; }

        public LogExtentedModel LastestStatusRequest { get; set; }
        public List<LogExtentedModel> OldStatusRequests { get; set; }
    }
}
