using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Notification")]
    public partial class Notification : BaseModel
    {
        [StringLength(50)]
        public string NotificationCode { get; set; }

        [StringLength(50)]
        public string RefCode { get; set; }

        public string RefType { get; set; }

        public string Username { get; set; }

        public string Description { get; set; }

        public bool IsViewed { get; set; }
    }
}
