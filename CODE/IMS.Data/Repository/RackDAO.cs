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

        public List<RackExtendedModel> GetRackByRow(string rowName)
        {
            var result = Query(x => x.RackName.StartsWith(rowName) && x.StatusCode == Constants.StatusCode.RACK_AVAILABLE)
                    .Select(x => new RackExtendedModel()
                        {
                            StatusCode = x.StatusCode,
                            RackCode = x.RackCode,
                            RackName = x.RackName,
                            RowName = rowName
                        })
                    .ToList();
            return result;
        }

        public List<string> GetAllRowsOfRack()
        {
            var allRacks = from r in Table
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
    }
}
