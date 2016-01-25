using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class ServerDAO : BaseDAO<Server>
    {
        private static ServerDAO instance;

        public static ServerDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerDAO();
                }
                return instance;
            }
        }


        public override Server GetByKeys(Server entry)
        {
            return Query(x => x.Maker == "DELL").FirstOrDefault();
        }
    }
}
