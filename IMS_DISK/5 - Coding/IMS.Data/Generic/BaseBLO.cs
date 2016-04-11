using System.Collections.Generic;

namespace IMS.Data.Generic
{
    public abstract class BaseBLO<TModel> where TModel : BaseModel
    {
        protected BaseDAO<TModel> baseDao;
        

        public virtual TModel GetByKeys(TModel entry)
        {
            var result = baseDao.GetByKeys(entry);
            return result == null ? null : result.DuplicateProperties<TModel>();
        }

        public TModel GetById(int? id)
        {
            return baseDao.GetById(id);
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

        //public virtual IEnumerable<TModel> GetAllExcept(IEnumerable<TModel> entries)
        //{
        //    return baseDao.GetAllExcept(entries);
        //}
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
