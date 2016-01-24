using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Models;

namespace IMS.Data.Generic
{
    public abstract class BaseDAO<TModel> where TModel : BaseModel
    {
        protected BaseDAO()
        {
        }

        public abstract TModel GetByKeys(TModel entry);

        public virtual void Add(TModel entry)
        {
            IMSContext.Current.Set<TModel>().Add(entry);
            IMSContext.Current.SaveChanges();
        }

        public virtual void Update(TModel entry)
        {
            var existing = GetByKeys(entry);
            if (existing == null)
            {
                return;
            }

            CopyValues(entry, existing);
            IMSContext.Current.SaveChanges();
        }

        public virtual void AddOrUpdate(TModel entry)
        {
            var existing = GetByKeys(entry);
            if (existing == null)
            {
                IMSContext.Current.Set<TModel>().Add(entry);
            }
            else
            {
                CopyValues(entry, existing);
            }
            IMSContext.Current.SaveChanges();
        }

        public virtual void Remove(TModel entry)
        {
            var existing = GetByKeys(entry);
            if (existing == null)
            {
                return;
            }
            IMSContext.Current.Set<TModel>().Remove(existing);
            IMSContext.Current.SaveChanges();
        }

        public virtual List<TModel> GetAll()
        {
            return IMSContext.Current.Set<TModel>().ToList<TModel>();
        }

        public virtual void AddMany(IEnumerable<TModel> entries)
        {
            foreach (var entry in entries)
            {
                IMSContext.Current.Set<TModel>().Add(entry);
            }
            IMSContext.Current.SaveChanges();
        }

        public virtual void UpdateMany(IEnumerable<TModel> entries)
        {
            foreach (var entry in entries)
            {
                var existing = GetByKeys(entry);
                if (existing == null)
                {
                    continue;
                }

                CopyValues(entry, existing);
            }
            IMSContext.Current.SaveChanges();
        }

        public virtual void AddOrUpdateMany(IEnumerable<TModel> entries)
        {
            foreach (var entry in entries)
            {
                var existing = GetByKeys(entry);
                if (existing == null)
                {
                    IMSContext.Current.Set<TModel>().Add(entry);
                }
                else
                {
                    CopyValues(entry, existing);
                }
            }
            IMSContext.Current.SaveChanges();
        }

        public virtual void RemoveMany(IEnumerable<TModel> entries)
        {
            foreach (var entry in entries)
            {
                var existing = GetByKeys(entry);
                if (existing == null)
                {
                    continue;
                }
                IMSContext.Current.Set<TModel>().Remove(existing);
            }
            IMSContext.Current.SaveChanges();
        }

        public virtual IQueryable<TModel> Table()
        {
            return IMSContext.Current.Set<TModel>();
        }

        public virtual List<TModel> Query(Expression<Func<TModel, bool>> predicate, int page = 0, int pageSize = 0, bool includeDeleted = false)
        {
            var query = IMSContext.Current.Set<TModel>().Where(predicate);
            if (page > 0 && pageSize > 0)
            {
                var skip = page * pageSize;
                query = query.Skip(skip);
            }
            if (pageSize > 0)
            {
                query = query.Take(pageSize);
            }
            var result = query.ToList();
            return result;
        }

        public virtual List<CustomModel> RawQuery<CustomModel>(string sql, object[] parameters) where CustomModel : class
        {
            return IMSContext.Current.Database.SqlQuery<CustomModel>(sql, parameters)
                    .ToList();
        }

        protected virtual void CopyValues(TModel source, TModel target)
        {
            var props = typeof(TModel).GetProperties();
            foreach (var _prop in props)
            {
                _prop.SetValue(target, _prop.GetValue(source, null), null);
            }
        }
    }
}
