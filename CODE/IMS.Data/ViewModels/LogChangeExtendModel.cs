using System;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class LogChangeExtendModel: LogChangedContent
    {
        public DateTime? Unblocktime { get; set; }
        public int? blockedtime { get; set; }
        public int? blockedtimetonow { get; set; }
    }
}
