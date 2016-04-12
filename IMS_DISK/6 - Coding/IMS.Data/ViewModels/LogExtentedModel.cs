using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LogExtentedModel : Log
    {
        public Log _LogChangedContent
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
        public string StatusCode { get; set; }
        public string RequestTypeName { get; set; }
        public string RequestTypeCode { get; set; }
        public string Customer { get; set; }
        public string CustomerName { get; set; }
        public int Priority { get; set; }

        public LogExtentedModel LastestStatusRequest { get; set; }
        public List<LogExtentedModel> OldStatusRequests { get; set; }
        //log bring away server
        public List<ServerExtendedModel> Servers { get; set; }
        public int ReturnServerNumber { get; set; }
        public int ReturnIpNumber { get; set; }
        public int ReturnLocationNumber { get; set; }
        //log return ip
        public List<string> listRacks { get; set; }

        public int DaysFromNow
        {
            get
            {
                if (LogTime == null)
                {
                    return 0;
                }
                return (int) (DateTime.Now.Date - LogTime.Value.Date).TotalDays;
            }
        }
    }
}
