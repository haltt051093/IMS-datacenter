using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Account")]
    public partial class Account : BaseModel
    {
        public Account()
        {
        }

        [Key]
        public int UserId { get; set; }

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
    }
}
