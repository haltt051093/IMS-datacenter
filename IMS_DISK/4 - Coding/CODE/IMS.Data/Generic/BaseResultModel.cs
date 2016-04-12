using System;

namespace IMS.Data.Generic
{
    public class BaseResultModel
    {
        public DataEnum.QueryResult Status { get; set; }

        public string StatusText { get; set; }

        public string Code { get; set; }

        public object Result { get; set; }

        public Type ResultType
        {
            get
            {
                var result = this.Result;
                if (result == null)
                    return (Type) null;
                return result.GetType();
            }
        }

        public BaseResultModel()
        {
            this.Status = DataEnum.QueryResult.Success;
        }
    }
}
