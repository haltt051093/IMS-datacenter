using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class GroupDAO : BaseDAO<Group>
    {
        public static GroupDAO instance;

        public static GroupDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new GroupDAO();
                }
                return instance;
            }
        }

        public override Group GetByKeys(Group entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
