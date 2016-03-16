using System.ComponentModel.DataAnnotations.Schema;
using IMS.Core.Express;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class TaskExtendedModel : Task
    {
        public Task _Task
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
        public string ShiftHeadName { get; set; }
        public string StaffName { get; set; }
        public string StatusName { get; set; }
        public string RequestTypeCode { get; set; }
        public string RequestTypeName { get; set; }

    }
}
