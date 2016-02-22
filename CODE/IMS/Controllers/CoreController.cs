using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;

namespace IMS.Controllers
{
    public class CoreController : Controller
    {
        public bool IsAuthorized()
        {
            var activeGroup = AssignedShiftBLO.Current.GetActiveGroup();
            var account = (Account)Session[Constants.Session.USER_LOGIN];
            var userGroup = account.GroupCode;
            if (activeGroup == userGroup)
            {
                return true;
            }
            return false;
        }
    }
}