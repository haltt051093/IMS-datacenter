using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using IMS.Core.Extensions;
using IMS.Data.Business;

namespace IMS.ApiControllers
{
    public class RackController : ApiController
    {
        public List<string> GetAvailableName(string term)
        {
            var allRacks = RackBLO.Current.GetAll().Select(x => x.RackName).ToList();
            var filteredRacks = allRacks
                .Where(x => x.StartsWith(term, StringComparison.InvariantCultureIgnoreCase))
                .Select(x => x.Length > 1 ?  x.Substring(1) : "0")
                .ToList();
            var rackNumbers = filteredRacks
                .Select(x => x.ToInt(0))
                .OrderBy(x => x)
                .ToList();
            var result = new List<string>();
            int count = 1;
            while (result.Count < 10)
            {
                if (!rackNumbers.Contains(count))
                {
                    result.Add(term.ToUpper() + count);
                }
                count++;
            }
            return result;
        }
    }
}
