using System;
using System.ComponentModel.DataAnnotations;

namespace IMS.Data.Generic
{
    public abstract class BaseModel
    {
        [Key]
        public int Id { get; set; }

        public TResult DuplicateProperties<TResult>() where TResult : BaseModel
        {
            var _type = GetType();
            var target = Activator.CreateInstance(_type);

            var props = _type.GetProperties();
            foreach (var _prop in props)
            {
                if (_prop.CanRead && _prop.CanWrite)
                {
                    _prop.SetValue(target, _prop.GetValue(this, null), null);
                }
                    
            
        }

            return target as TResult;
        }
    }
}
