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
            modelBuilder.Entity<Log>();
            modelBuilder.Entity<Object>();
            modelBuilder.Entity<Rack>();
            modelBuilder.Entity<Request>();
            modelBuilder.Entity<RequestType>();
            modelBuilder.Entity<Role>();
            modelBuilder.Entity<Server>();
            modelBuilder.Entity<ServerIP>();
            modelBuilder.Entity<Shift>();
            modelBuilder.Entity<Task>();
            modelBuilder.Entity<ServerAttribute>();
            modelBuilder.Entity<Status>();
            modelBuilder.Entity<TypeOfLog>();
            modelBuilder.Entity<RackOfCustomer>();
            modelBuilder.Entity<TempRequest>();
            modelBuilder.Entity<Note>();
            modelBuilder.Entity<Notification>();
        }
    }
}
