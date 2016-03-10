using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Linq.Expressions;

namespace IMS.Data.Generic
{
    public abstract class BaseDAO<TModel> where TModel : BaseModel
    {
       
       // private readonly IDbSet<TModel> dbSet;

        public abstract TModel GetByKeys(TModel entry);
        private readonly IDbSet<TModel> dbSet;

        protected BaseDAO()
        {
            dbSet = IMSContext.Current.Set<TModel>();
        }

        public TModel GetById(int? id)
        {
            return Query(x => x.Id == id).FirstOrDefault();
        }

        public virtual void Add(TModel entry)
        {
            try
            {
                IMSContext.Current.Set<TModel>().Add(entry);
                IMSContext.Current.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
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
            return IMSContext.Current.Database.SqlQuery<CustomModel>(sql, new object[] {})
                    .ToList();
        }

        //public virtual IQueryable<T> DynamicWhere<T>(IQueryable<T> src, string propertyName, string value)
        //{
        //    var pe = Expression.Parameter(typeof(T), "t");
        //    var left = Expression.Property(pe, typeof(T).GetProperty(propertyName));
        //    var right = Expression.Constant(value);
        //    // Illustrated a equality condition but you can put a switch based on some parameter
        //    // to have different operators
        //    var condition = Expression.Equal(left, right);

        //    var predicate = Expression.Lambda<Func<T, bool>>(condition, pe);
        //    return src.Where(predicate);
        //}

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
