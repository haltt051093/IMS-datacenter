using System.Collections.Generic;
using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

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

        public List<AttributeExtendedModel> GetServerAttributes(string serverCode, string status)
        {
            var query = from sa in Table
                        join a in AttributeDAO.Current.Table
                            on sa.AttributeCode equals a.AttributeCode into saa
                        from suba in saa.DefaultIfEmpty()
                        where sa.ServerCode == serverCode && sa.StatusCode == status
                        select new AttributeExtendedModel()
                        {
                            AttributeName = suba.AttributeName,
                            AttributeValue = sa.AttributeValue,
                            AttributeCode = sa.AttributeCode
                        };
            return query.ToList();
        }

        public void UpdateServerAttributeStatus(string serverCode, string status)
        {
            var server = Query(x => x.ServerCode == serverCode).FirstOrDefault();
            if (server != null)
            {
                server.StatusCode = status;
                Update(server);
            }
        }
    }
}
