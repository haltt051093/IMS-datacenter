using System.Linq;
using System.Web.Mvc;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class RackController : CoreController
    {
        [Roles(Constants.Role.CUSTOMER)]
        public ActionResult Index(string CustomerSearch)
        {
            var data = new RackOfCustomerIndexViewModel();
            var customerCode = GetCurrentUserName();
            data.CustomerCode = customerCode;
            var racks = RackOfCustomerBLO.Current.GetRackOfCustomer(customerCode);
            data.RackSelectList = racks.Select(x => new SelectListItem {Value = x.Item1, Text = x.Item2})
                .ToList();
            return View(data);
        }
    }
}