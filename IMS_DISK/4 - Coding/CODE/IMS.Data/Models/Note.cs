using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Note")]
    public partial class Note : BaseModel
    {
        [StringLength(50)]
        public string NoteCode { get; set; }
        [StringLength(50)]
        public string RequestCode { get; set; }

        public string StaffCode { get; set; }

        public string NoteContent { get; set; }

        public DateTime? AddedTime { get; set; }
    }
}
