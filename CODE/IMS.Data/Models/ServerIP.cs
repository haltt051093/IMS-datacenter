namespace IMS.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ServerIP")]
    public partial class ServerIP
    {
        public int Id { get; set; }

        public int ServerId { get; set; }

        public int CurrentIP { get; set; }

        public virtual IPAddressPool IPAddressPool { get; set; }

        public virtual Server Server { get; set; }
    }
}
