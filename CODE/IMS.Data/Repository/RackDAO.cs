using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class RackDAO : BaseDAO<Rack>
    {
        public static RackDAO instance;

        public static RackDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RackDAO();
                }
                return instance;
            }
        }

        public override Rack GetByKeys(Rack entry)
        {
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.RackCode == entry.RackCode).FirstOrDefault();
            }
            return existing;
        }

        public List<string> GetAllRowsOfRack()
        {
            var allRacks = from r in Table()
                           select r.RackName;
            var listRows = new List<string>();
            foreach (var item in allRacks)
            {
                var row = item.ElementAt(0);
                listRows.Add(row.ToString());
            }
            var abc = (from r in listRows select r).Distinct();
            return abc.ToList();
        }

        public List<RackExtendedModel> GetRackByRow(string rowName)
        {
            var query = from r in Table()
                        where r.RackName.StartsWith(rowName) && r.StatusCode == Constants.StatusCode.RACK_AVAILABLE
                        select new RackExtendedModel()
                        {
                            StatusCode = r.StatusCode,
                            RackCode = r.RackCode,
                            RackName = r.RackName,
                            RowName = rowName
                        };
            return query.ToList();
        }
    }
}
