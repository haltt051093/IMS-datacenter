using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;

namespace PSSC.DataModel.Models
{
    public class PsscDBContext:DbContext
    {
        //Tao table
        public DbSet<Marble> Marbles { get; set; }
        public DbSet<Repository> Repositories { get; set; }
        public DbSet<InputLog> InputLogs { get; set; }
        public DbSet<InputLogStatusCode> InputLogStatusCodes { get; set; }
        public DbSet<Order> Orders { get; set; }
        public DbSet<OrderDetail> OrderDetails { get; set; }
        public DbSet<PortSetting> PortSettings { get; set; }
       
        //Sua doi ten cac thanh phan trong database
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //Tao Stored Procedure
            modelBuilder.Entity<Marble>().MapToStoredProcedures
                (
                    p => p.Insert(i => i.HasName("MarbleInsert"))
                          .Update(i => i.HasName("MarbleUpdate"))
                          .Delete(i => i.HasName("MarbleDelete"))
                );

            modelBuilder.Entity<Repository>().MapToStoredProcedures
                (
                    p => p.Insert(i => i.HasName("RepositoryInsert"))
                          .Update(i => i.HasName("RepositoryUpdate"))
                          .Delete(i => i.HasName("RepositoryDelete"))
                );

            modelBuilder.Entity<InputLog>().MapToStoredProcedures
                (
                    p => p.Insert(i => i.HasName("InputLogInsert"))
                          .Update(i => i.HasName("InputLogUpdate"))
                          .Delete(i => i.HasName("InputLogDelete"))
                );

            modelBuilder.Entity<InputLogStatusCode>().MapToStoredProcedures
                (
                    p => p.Insert(i => i.HasName("InputLogStatusCodeInsert"))
                          .Update(i => i.HasName("InputLogStatusCodeUpdate"))
                          .Delete(i => i.HasName("InputLogStatusCodeDelete"))
                );

            modelBuilder.Entity<Order>().MapToStoredProcedures
                (
                    p => p.Insert(i => i.HasName("OrderInsert"))
                          .Update(i => i.HasName("OrderUpdate"))
                          .Delete(i => i.HasName("OrderDelete"))
                );

            modelBuilder.Entity<OrderDetail>().MapToStoredProcedures
               (
                   p => p.Insert(i => i.HasName("OrderDetailInsert"))
                         .Update(i => i.HasName("OrderDetailUpdate"))
                         .Delete(i => i.HasName("OrderDetailDelete"))
               );

            modelBuilder.Entity<PortSetting>().MapToStoredProcedures
               (
                   p => p.Insert(i => i.HasName("PortSettingInsert"))
                         .Update(i => i.HasName("PortSettingUpdate"))
                         .Delete(i => i.HasName("PortSettingDelete"))
               );
            base.OnModelCreating(modelBuilder);
        }
    }
}
