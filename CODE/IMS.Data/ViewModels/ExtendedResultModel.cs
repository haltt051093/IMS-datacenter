using System;
using IMS.Data.Generic;

namespace IMS.Data.ViewModels
{
    public class ExtendedResultModel
    {
        public DataEnum.QueryResult Status { get; set; }

        public string StatusText { get; set; }

        public string Code { get; set; }

        public object Result { get; set; }

        public Type ResultType
        {
            get
            {
                object result = this.Result;
                if (result == null)
                    return (Type) null;
                return result.GetType();
            }
        }

        public ExtendedResultModel()
        {
            this.Status = DataEnum.QueryResult.Success;
        }
    }
}
