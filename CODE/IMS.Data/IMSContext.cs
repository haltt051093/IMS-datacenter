using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using IMS.Data.Models;

namespace IMS.Data
{
    public class IMSContext : DbContext
    {
        private static IMSContext instance;

        public static IMSContext Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new IMSContext();
                }
                return instance;
            }
        }

        public IMSContext()
            : base("name=IMSContext")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingEntitySetNameConvention>();
            modelBuilder.Entity<Account>();
            modelBuilder.Entity<AssignedShift>();
            modelBuilder.Entity<Group>();
            modelBuilder.Entity<IPAddressPool>();
            modelBuilder.Entity<Location>();
            modelBuilder.Entity<LogConfirmedRequest>();
            modelBuilder.Entity<LogIPAllocation>();
            modelBuilder.Entity<LogIPStatus>();
            modelBuilder.Entity<LogNote>();
            modelBuilder.Entity<LogRequestStatus>();
            modelBuilder.Entity<LogServerDelivery>();
            modelBuilder.Entity<LogServerMoving>();
            modelBuilder.Entity<LogUpgradedServer>();
            modelBuilder.Entity<Rack>();
            modelBuilder.Entity<Request>();
            modelBuilder.Entity<RequestType>();
            modelBuilder.Entity<Role>();
            modelBuilder.Entity<Server>();
            modelBuilder.Entity<ServerIP>();
            modelBuilder.Entity<Shift>();
            modelBuilder.Entity<StaffAssignment>();
            modelBuilder.Entity<ServerAttribute>();
        }

        public System.Data.Entity.DbSet<IMS.Data.Models.Account> Account { get; set; }

        public System.Data.Entity.DbSet<IMS.Data.Models.Role> Role { get; set; }
    }
}
