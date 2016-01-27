using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    public partial class Account : BaseModel
    {
        [Key]
        public int AccountId { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        public int? RoleId { get; set; }

        public bool? Status { get; set; }

        [StringLength(50)]
        public string Fullname { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public string Address { get; set; }

        [StringLength(50)]
        public string Identification { get; set; }

        public int? GroupId { get; set; }
    }
}
