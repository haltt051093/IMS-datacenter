using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class RequestDAO : BaseDAO<Request>
    {
        public static RequestDAO instance;

        public static RequestDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RequestDAO();
                }
                return instance;
            }
        }

        public override Request GetByKeys(Request entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public string GenerateCode()
        {
            var code = "R" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = Query(x => x.RequestCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "R" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = Query(x => x.RequestCode == code).FirstOrDefault();
            }
            return code;
        }

        public void AddRequestRentRacks(string customer)
        {
            Request request = new Request();
            request.Customer = customer.Trim();
            request.RequestType = Constants.RequestTypeCode.RENT_RACK;
            request.RequestCode = GenerateCode();
            request.RequestedTime = DateTime.Now;
            request.StatusCode = Constants.StatusCode.REQUEST_WAITING;
            var existing = GetByKeys(request);
            if (existing == null)
            {
                IMSContext.Current.Set<Request>().Add(request);
            }
            else
            {
                CopyValues(request, existing);
            }
            IMSContext.Current.SaveChanges();
        }

    }
}
