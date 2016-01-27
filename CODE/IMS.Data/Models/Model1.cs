namespace IMS.Data.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model11")
        {
        }

        //public virtual DbSet<Account> Account { get; set; }
        //public virtual DbSet<AssignedShift> AssignedShift { get; set; }
        //public virtual DbSet<IPAddressPool> IPAddressPool { get; set; }
        //public virtual DbSet<Location> Location { get; set; }
        //public virtual DbSet<LogConfirmedRequest> LogConfirmedRequest { get; set; }
        //public virtual DbSet<LogIPAllocation> LogIPAllocation { get; set; }
        //public virtual DbSet<LogIPStatus> LogIPStatus { get; set; }
        //public virtual DbSet<LogNote> LogNote { get; set; }
        //public virtual DbSet<LogRequestStatus> LogRequestStatus { get; set; }
        //public virtual DbSet<LogServerDelivery> LogServerDelivery { get; set; }
        //public virtual DbSet<LogServerMoving> LogServerMoving { get; set; }
        //public virtual DbSet<LogUpgradedServer> LogUpgradedServer { get; set; }
        //public virtual DbSet<Rack> Rack { get; set; }
        //public virtual DbSet<Request> Request { get; set; }
        //public virtual DbSet<RequestType> RequestType { get; set; }
        //public virtual DbSet<Role> Role { get; set; }
        //public virtual DbSet<Server> Server { get; set; }
        //public virtual DbSet<ServerAttribute> ServerAttribute { get; set; }
        //public virtual DbSet<ServerIP> ServerIP { get; set; }
        //public virtual DbSet<Shift> Shift { get; set; }
        //public virtual DbSet<ShiftGroup> ShiftGroup { get; set; }
        //public virtual DbSet<StaffAssignment> StaffAssignment { get; set; }
        //public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }

        //protected override void OnModelCreating(DbModelBuilder modelBuilder)
        //{
        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.IPAddressPool)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogConfirmedRequest)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogIPAllocation)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogIPStatus)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogNote)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.Request)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.CustomerId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogRequestStatus)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogServerDelivery)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogServerMoving)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.LogUpgradedServer)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.Server)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.CustomerId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.ShiftGroup)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.StaffAssignment)
        //        .WithOptional(e => e.Account)
        //        .HasForeignKey(e => e.StaffId);

        //    modelBuilder.Entity<Account>()
        //        .HasMany(e => e.StaffAssignment1)
        //        .WithOptional(e => e.Account1)
        //        .HasForeignKey(e => e.ShiftHeadId);

        //    modelBuilder.Entity<IPAddressPool>()
        //        .HasMany(e => e.LogConfirmedRequest)
        //        .WithOptional(e => e.IPAddressPool)
        //        .HasForeignKey(e => e.IPAddressId);

        //    modelBuilder.Entity<IPAddressPool>()
        //        .HasMany(e => e.LogIPAllocation)
        //        .WithOptional(e => e.IPAddressPool)
        //        .HasForeignKey(e => e.AssignedIP);

        //    modelBuilder.Entity<IPAddressPool>()
        //        .HasMany(e => e.LogIPStatus)
        //        .WithOptional(e => e.IPAddressPool)
        //        .HasForeignKey(e => e.IPAddress);

        //    modelBuilder.Entity<IPAddressPool>()
        //        .HasMany(e => e.ServerIP)
        //        .WithRequired(e => e.IPAddressPool)
        //        .HasForeignKey(e => e.CurrentIP)
        //        .WillCascadeOnDelete(false);

        //    modelBuilder.Entity<Location>()
        //        .HasMany(e => e.LogServerMoving)
        //        .WithOptional(e => e.Location)
        //        .HasForeignKey(e => e.MovedLocation);

        //    modelBuilder.Entity<RequestType>()
        //        .HasMany(e => e.Request)
        //        .WithOptional(e => e.RequestType1)
        //        .HasForeignKey(e => e.RequestType);

        //    modelBuilder.Entity<Server>()
        //        .HasMany(e => e.ServerIP)
        //        .WithRequired(e => e.Server)
        //        .WillCascadeOnDelete(false);
        //}
    }
}
