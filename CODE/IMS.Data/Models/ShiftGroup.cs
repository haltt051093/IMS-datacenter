namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ShiftGroup")]
    public partial class ShiftGroup
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ShiftGroup()
        {
            Shift = new HashSet<Shift>();
        }

        [Key]
        public int GroupId { get; set; }

        public int? StaffId { get; set; }

        [StringLength(50)]
        public string GroupName { get; set; }

        public DateTime? JoinedDate { get; set; }

        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Shift> Shift { get; set; }
    }
}
