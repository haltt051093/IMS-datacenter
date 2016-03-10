using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LogExtentedModel : LogChangedContent
    {
        public LogChangedContent _LogChangedContent
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

        public string StatusName { get; set; }
        public string RequestTypeName { get; set; }
        public string RequestTypeCode { get; set; }

        public LogExtentedModel LastestStatusRequest { get; set; }
        public List<LogExtentedModel> OldStatusRequests { get; set; }
    }
}
