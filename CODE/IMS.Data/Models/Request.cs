namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Request")]
    public partial class Request
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Request()
        {
            LogConfirmedRequest = new HashSet<LogConfirmedRequest>();
            LogRequestStatus = new HashSet<LogRequestStatus>();
            LogServerDelivery = new HashSet<LogServerDelivery>();
            LogUpgradedServer = new HashSet<LogUpgradedServer>();
            Server = new HashSet<Server>();
        }

        public int RequestId { get; set; }

        public int? RequestType { get; set; }

        public int? CustomerId { get; set; }

        public DateTime? AppointmentTime { get; set; }

        public string Description { get; set; }

        public DateTime? RequestedTime { get; set; }

        public virtual Account Account { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogConfirmedRequest> LogConfirmedRequest { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogRequestStatus> LogRequestStatus { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogServerDelivery> LogServerDelivery { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LogUpgradedServer> LogUpgradedServer { get; set; }

        public virtual RequestType RequestType1 { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Server> Server { get; set; }
    }
}
