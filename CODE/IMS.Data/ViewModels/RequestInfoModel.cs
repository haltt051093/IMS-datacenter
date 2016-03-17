using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Models;

namespace IMS.Data.ViewModels
{
    [NotMapped]
    public class RequestInfoModel : Request
    {
        public string StaffName { get; set; }
        public string StatusName { get; set; }
        public string RejectReason { get; set; }
        public string AssignedStaff { get; set; }
        public string TaskStatus { get; set; }
    }
}
