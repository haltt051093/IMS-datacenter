﻿using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Controllers
{
    public class CoreController : Controller
    {
        public bool IsAuthorized()
        {
            var activeGroup = AssignedShiftBLO.Current.GetActiveGroup();
            var account = (Account)Session[Constants.Session.USER_LOGIN];
            var userGroup = account == null ? string.Empty : account.GroupCode;
            if (activeGroup == userGroup)
            {
                return true;
            }
            Alert("Ban da khong thuoc ca truc nay! Ban chi co quyen view");
            return false;
        }

        protected void Alert(string message)
        {
            Alert("danger", message, null);
        }

        protected void Success(string message)
        {
            Alert("success", message, null);
        }

        protected void Info(string message)
        {
            Alert("info", message, null);
        }

        protected void Alert(ExtendedResultModel q)
        {
            Alert(QueryResultToAlertType(q.Status), q.StatusText, q.Code, true);
        }

        protected void Alert(string type, string line1, string line2, bool dismissable = false)
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
    }
}