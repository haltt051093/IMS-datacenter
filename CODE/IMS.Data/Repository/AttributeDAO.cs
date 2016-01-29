using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

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
