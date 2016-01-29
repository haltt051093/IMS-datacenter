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

        public List<ServerExtendedModel> GetAllServer()
        {
            //var query = from s in Table()
            //    join l in LocationDAO.Current.Table()
            //        on s.LocationCode equals l.LocationCode into sl
            //    from subl in sl.DefaultIfEmpty()
            //    join st in StatusDAO.Current.Table()
            //        on s.Status equals st.StatusCode into stsl
            //    from subst in stsl.DefaultIfEmpty()
            //    select new ServerExtendedModel { Location = subl, Server = s, Status = subst };
            var query = from s in Table()
                        join l in LocationDAO.Current.Table()
                            on s.LocationCode equals l.LocationCode
                        select new ServerExtendedModel() {UInRack = l.RackCode+l.RackUnit, Server = s};
            return query.ToList();
        }
    }
}
