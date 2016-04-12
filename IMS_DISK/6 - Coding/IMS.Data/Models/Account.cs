using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using IMS.Data.Generic;

namespace IMS.Data.Models
{
    [Table("Account")]
    public partial class Account : BaseModel
    {
        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(50)]
        public string Password { get; set; }

        [StringLength(50)]
        public string Role { get; set; }

        public bool? Status { get; set; }

        [Display(Name ="Customer")]
        [StringLength(50)]
        public string Fullname { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        public string Address { get; set; }

        [StringLength(50)]
        public string Identification { get; set; }

        [StringLength(50)]
        public string GroupCode { get; set; }

        public string Company { get; set; }

        [NotMapped]
        public string LastName {
            get
            {
                if (string.IsNullOrEmpty(Fullname))
                {
                    return string.Empty;
                }
                var nameParts = Fullname.Split(new char[] {' '}, StringSplitOptions.RemoveEmptyEntries);
                var lastPart = nameParts[nameParts.Length - 1];
                return lastPart;
            }
        }
    }
}
