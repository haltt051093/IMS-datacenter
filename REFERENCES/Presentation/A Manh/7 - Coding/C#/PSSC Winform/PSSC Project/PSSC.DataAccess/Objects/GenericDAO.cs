using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;
using System.Data.Entity;

namespace PSSC.DataAccess.Objects
{
    public class GenericDAO<T> : IGenericDAO<T> where T : class
    {
        private PsscDBContext psscDBContext = null;
        private DbSet<T> table = null;

        public GenericDAO()
        {
            this.psscDBContext = new PsscDBContext();
            this.table = psscDBContext.Set<T>();
        }

        public IEnumerable<T> SelectAll()
        {
            return table;
        }

        public T SelectByID(int id)
        {
            return table.Find(id);
        }

        public void Create(T obj)
        {
            table.Add(obj);
        }

        public void Update(T obj)
        {
            table.Attach(obj);
            psscDBContext.Entry(obj).State = EntityState.Modified;
        }

        public void Delete(int id)
        {
            T obj = table.Find(id);
            table.Remove(obj); 
        }

        public void Save()
        {
            psscDBContext.SaveChanges();
        }
    }
}
