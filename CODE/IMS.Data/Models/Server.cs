using IMS.Data.Generic;

namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Server")]
    public partial class Server : BaseModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Server()
        {
            LogConfirmedRequest = new HashSet<LogConfirmedRequest>();
            LogIPAllocation = new HashSet<LogIPAllocation>();
            LogServerDelivery = new HashSet<LogServerDelivery>();
            LogServerMoving = new HashSet<LogServerMoving>();
            LogUpgradedServer = new HashSet<LogUpgradedServer>();
            ServerAttribute = new HashSet<ServerAttribute>();
            ServerIP = new HashSet<ServerIP>();
        }

        public int ServerId { get; set; }

        public int? CustomerId { get; set; }

        [StringLength(50)]
        public string Maker { get; set; }

        [StringLength(50)]
        public string Modern { get; set; }

        public int? Power { get; set; }

        public int? Size { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public int? DefaultIP { get; set; }

        public int? LocationId { get; set; }

        public DateTime? RegisteredDate { get; set; }

        public int? RequestId { get; set; }

        public int? Outlet { get; set; }

        public virtual Account Account { get; set; }

        public virtual Location Location { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogConfirmedRequest> LogConfirmedRequest { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogIPAllocation> LogIPAllocation { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogServerDelivery> LogServerDelivery { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogServerMoving> LogServerMoving { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogUpgradedServer> LogUpgradedServer { get; set; }

        public virtual Request Request { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServerAttribute> ServerAttribute { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ServerIP> ServerIP { get; set; }
    }
}
