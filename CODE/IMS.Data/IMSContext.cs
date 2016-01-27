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
            modelBuilder.Entity<Server>();

        }

        public System.Data.Entity.DbSet<IMS.Data.Models.Account> Account { get; set; }

        public System.Data.Entity.DbSet<IMS.Data.Models.Role> Role { get; set; }
    }
}
