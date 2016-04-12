using System.Collections;
using System.Collections.Generic;
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Services;

namespace IMS.Controllers
{
    public class CoreController : Controller
    {
        protected Account GetCurrentAccount()
        {
            if (User == null || string.IsNullOrEmpty(User.Identity.Name))
            {
                return null;
            }

            var account = Session[Constants.Session.USER_LOGIN] as Account;

            if (account == null)
            {
                account = AccountBLO.Current.GetAccountByCode(User.Identity.Name);
                Session[Constants.Session.USER_LOGIN] = account;
            }
            return account;
        }

        protected string GetCurrentUserName()
        {
            if (User == null)
            {
                return string.Empty;
            }
            return User.Identity.Name;
        }

        protected string GetCurrentUserRole()
        {
            var account = GetCurrentAccount();
            var role = string.Empty;
            if (account != null)
            {
                role = account.Role;
            }
            return role;
        }

        protected string GetCurrentUserGroup()
        {
            var account = GetCurrentAccount();
            var group = string.Empty;
            if (account != null)
            {
                group = account.GroupCode;
            }
            return group;
        }

        protected bool IsAuthorized()
        {
            var activeGroup = AssignedShiftBLO.Current.GetActiveGroup();
            var account = GetCurrentAccount();
            var userGroup = (account == null ? string.Empty : account.GroupCode);
            if (activeGroup == userGroup)
            {
                return true;
            }
            Alert("Ban da khong thuoc ca truc nay! Ban chi co quyen view");
            return false;
        }

        protected void Alert(string message)
        {
            Toast("danger", message, null);
        }

        protected void Success(string message)
        {
            Toast("success", message, null);
        }

        protected void Info(string message)
        {
            Toast("info", message, null);
        }

        protected void Alert(BaseResultModel q)
        {
            Toast(QueryResultToAlertType(q.Status), q.StatusText, q.Code, true);
        }

        protected void Toast(string type, string line1, string line2, bool dismissable = false)
        {
            TempData["AlertType"] = type;
            TempData["AlertLine1"] = line1;
            TempData["AlertLine2"] = line2;
            TempData["AlertDismiss"] = dismissable;
        }

        protected string QueryResultToAlertType(DataEnum.QueryResult q)
        {
            switch (q)
            {
                case DataEnum.QueryResult.Success:
                    return Constants.AlertType.SUCCESS;
                case DataEnum.QueryResult.Duplicate:
                    return Constants.AlertType.WARNING;
            }
            return Constants.AlertType.DANGER;
        }

        protected void Notify(IEnumerable<string> notificationCodes)
        {
            foreach (var notiCode in notificationCodes)
            {
                var noti = NotificationBLO.Current.GetByKeys(new Notification {NotificationCode = notiCode});
                if (noti == null)
                {
                    continue;
                }
                RemoteControllerHub.Current.Clients.User(noti.Username).Notify(noti);
            }
        }
    }
}