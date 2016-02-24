using System.Linq;
using System.Runtime.CompilerServices;
using IMS.Data.Business;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class ServerIPDAO : BaseDAO<ServerIP>
    {
        public static ServerIPDAO instance;

        public static ServerIPDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new ServerIPDAO();
                }
                return instance;
            }
        }

        public override ServerIP GetByKeys(ServerIP entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public void UpdateStatusServerIp(string currentStatus, string updatedStatus, string ip)
        {
            var update = Current.Query(x => x.StatusCode == currentStatus && x.CurrentIP == ip).FirstOrDefault();
            if (update != null)
            {
                update.StatusCode = updatedStatus;
                Update(update);
            }
        }
    }
}
