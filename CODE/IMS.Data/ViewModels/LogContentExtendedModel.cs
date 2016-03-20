using System;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LogContentExtendedModel: Log
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

        public DateTime? Unblocktime { get; set; }
        public int? blockedtime { get; set; }
        public int? blockedtimetonow { get; set; }
    }
}
