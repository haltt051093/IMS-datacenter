using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class ShiftGroupDAO : BaseDAO<ShiftGroup>
    {
        public static ShiftGroupDAO instance;

        public static ShiftGroupDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ShiftGroupDAO();
                }
                return instance;
            }
        }

        public override ShiftGroup GetByKeys(ShiftGroup entry)
        {
            return Query(x => x.GroupId == entry.GroupId).FirstOrDefault();
        }

        public List<ShiftGroup> SelectGroup()
        {
            List<ShiftGroup> list = new List<ShiftGroup>();
            for (int i = 1; i < 5; i++)
            {
                ShiftGroup onegroup = new ShiftGroup();
                onegroup.GroupId = i;
                onegroup.GroupName = "Group " + i;
                list.Add(onegroup);
            }
            return list;
        } 
    }
}
