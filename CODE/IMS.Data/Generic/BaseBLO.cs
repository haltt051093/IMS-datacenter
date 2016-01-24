using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IMS.Data.Generic
{
    public abstract class BaseBLO<TModel> where TModel : BaseModel
    {
        protected BaseDAO<TModel> baseDao;

        public virtual TModel GetByModel(TModel entry)
        {
            var result = baseDao.GetByKeys(entry);
            return result == null ? null : result.DuplicateProperties<TModel>();
        }

        public virtual void Add(TModel entry)
        {
            baseDao.Add(entry);
        }

        public virtual void Update(TModel entry)
        {
            baseDao.Update(entry);
        }

        public virtual void AddOrUpdate(TModel entry)
        {
            baseDao.AddOrUpdate(entry);
        }

        public virtual void Remove(TModel entry)
        {
            baseDao.Remove(entry);
        }

        public virtual List<TModel> GetAll()
        {
            return baseDao.GetAll();
        }

        public virtual void AddMany(IEnumerable<TModel> entries)
        {
            baseDao.AddMany(entries);
        }

        public virtual void UpdateMany(IEnumerable<TModel> entries)
        {
            baseDao.UpdateMany(entries);
        }

        public virtual void AddOrUpdateMany(IEnumerable<TModel> entries)
        {
            baseDao.AddOrUpdateMany(entries);
        }

        public virtual void RemoveMany(IEnumerable<TModel> entries)
        {
            baseDao.RemoveMany(entries);
        }
    }
}
