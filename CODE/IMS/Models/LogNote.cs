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
    
    public partial class LogNote
    {
        public int LogId { get; set; }
        public Nullable<int> StaffId { get; set; }
        public string Description { get; set; }
        public Nullable<System.DateTime> LogTime { get; set; }
    
        public virtual Account Account { get; set; }
    }
}
