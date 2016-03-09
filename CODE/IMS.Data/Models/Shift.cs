using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Shift")]
    public partial class Shift : BaseModel
    {
        [StringLength(50)]
        public string ShiftCode { get; set; }

        public int StartedTime { get; set; }

        public int EndedTime { get; set; }
    }
}
