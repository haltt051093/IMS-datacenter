//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace IMS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LogUpgradedServer
    {
        public int LogId { get; set; }
        public int ServerId { get; set; }
        public int StaffId { get; set; }
        public string UpgradedContent { get; set; }
        public Nullable<System.DateTime> LogTime { get; set; }
    
        public virtual Server Server { get; set; }
        public virtual Account Account { get; set; }
    }
}
