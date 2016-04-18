using System.Linq;
using System.Web.Mvc;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Controllers
{
    public class ValidateController : CoreController
    {
        [HttpPost]
        public JsonResult CheckRackName(string RackName)
        {
            var existing = RackBLO.Current.GetByName(new Rack { RackName = RackName });
            return Json(existing == null);
        }

        [HttpPost]
        public JsonResult CheckIPAddress(string Address)
        {
            var existing = IPAddressPoolBLO.Current.GetByKeys(new IPAddressPool {IPAddress = Address});
            return Json(existing == null);
        }

        [HttpPost]
        public JsonResult CheckUsername(string username)
        {
            var existing = AccountBLO.Current.GetByKeys(new Account {Username = username});
            return Json(existing == null);
        }

        [HttpPost]
        public JsonResult CheckEmail(string Email)
        {
            var existing = AccountDAO.Current.Query(x => x.Email == Email).FirstOrDefault();
            return Json(existing != null);
        }

        [HttpPost]
        public JsonResult CheckPassword(string Password)
        {
            var user = GetCurrentUserName();
            var existing = AccountDAO.Current.Query(x => x.Username == user && x.Password == Password).FirstOrDefault();
            return Json(existing != null);
        }

        [HttpPost]
        public JsonResult CheckAddServer(string ServerCount)
        {
            var requestCodePart = ServerCount.Split(new char[] { '-' });
            var requestCode = requestCodePart[0];
            var count = TempRequestBLO.Current.GetByRequestCode(requestCode).Count;
            return Json(count != 0);
        }
    }
}