﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                _prop.SetValue(target, _prop.GetValue(this, null), null);
            }

            return target as TResult;
        }
    }
}
