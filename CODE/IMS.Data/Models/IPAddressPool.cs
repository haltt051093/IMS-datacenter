namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("IPAddressPool")]
    public partial class IPAddressPool
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public IPAddressPool()
        {
            LogBlockedIP = new HashSet<LogBlockedIP>();
            LogIPAllocation = new HashSet<LogIPAllocation>();
            LogIPAllocation1 = new HashSet<LogIPAllocation>();
            Server = new HashSet<Server>();
            ServerIP = new HashSet<ServerIP>();
        }

        public int Id { get; set; }

        [StringLength(50)]
        public string IPAddress { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [StringLength(50)]
        public string Gateway { get; set; }

        [StringLength(50)]
        public string Subnetmask { get; set; }

        public int? StaffId { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogBlockedIP> LogBlockedIP { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogIPAllocation> LogIPAllocation { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogIPAllocation> LogIPAllocation1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Server> Server { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServerIP> ServerIP { get; set; }
    }
}
