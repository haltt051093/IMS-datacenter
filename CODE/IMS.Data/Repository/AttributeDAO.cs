using System.Linq;
using IMS.Data.Generic;

namespace IMS.Data.Repository
{
    public class AttributeDAO : BaseDAO<Models.Attribute>
    {
        public static AttributeDAO instance;

        public static AttributeDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AttributeDAO();
                }
                return instance;
            }
        }

        public override Models.Attribute GetByKeys(Models.Attribute entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
