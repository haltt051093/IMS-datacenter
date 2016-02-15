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
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            modelBuilder.Entity<Account>();
            modelBuilder.Entity<AssignedShift>();
            modelBuilder.Entity<Attribute>();
            modelBuilder.Entity<Group>();
            modelBuilder.Entity<IPAddressPool>();
            modelBuilder.Entity<Location>();
            modelBuilder.Entity<LogChangedContent>();
            modelBuilder.Entity<Object>();
            modelBuilder.Entity<Rack>();
            modelBuilder.Entity<Request>();
            modelBuilder.Entity<RequestType>();
            modelBuilder.Entity<Role>();
            modelBuilder.Entity<Server>();
            modelBuilder.Entity<ServerIP>();
            modelBuilder.Entity<Shift>();
            modelBuilder.Entity<StaffAssignment>();
            modelBuilder.Entity<ServerAttribute>();
            modelBuilder.Entity<Status>();
            modelBuilder.Entity<TypeOfLog>();
            modelBuilder.Entity<RackOfCustomer>();
        }

        public System.Data.Entity.DbSet<IMS.Data.Models.Server> Servers { get; set; }

        public System.Data.Entity.DbSet<IMS.Data.Models.Request> Requests { get; set; }

        public System.Data.Entity.DbSet<IMS.Data.Models.RequestType> RequestTypes { get; set; }

        public System.Data.Entity.DbSet<IMS.Data.Models.ServerIP> ServerIPs { get; set; }

        //public System.Data.Entity.DbSet<IMS.Models.ServerDetailsViewModel> Objects { get; set; }
    }
}
