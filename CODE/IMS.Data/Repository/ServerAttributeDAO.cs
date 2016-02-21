using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class ServerAttributeDAO : BaseDAO<ServerAttribute>
    {
        public static ServerAttributeDAO instance;

        public static ServerAttributeDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerAttributeDAO();
                }
                return instance;
            }
        }

        public override ServerAttribute GetByKeys(ServerAttribute entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
