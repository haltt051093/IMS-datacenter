using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class AttributeDAO : BaseDAO<Attribute>
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

        public override Attribute GetByKeys(Attribute entry)
        {
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.AttributeCode == entry.AttributeCode).FirstOrDefault();
            }
            return existing;
        }
    }
}
