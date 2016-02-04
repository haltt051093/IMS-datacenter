using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace IMS.Controllers
{
    public class BaseController : Controller
    {
        protected void SetAlert(string message, string type)
        {
            TempData["AlertMessage"] = message;
            if (type == "success")
            {
                TempData["AlertMessage"] = "alert-success";
            }else if (type == "warning")
            {
                TempData["AlertMessage"] = "alert-warning";
            }else if (type == "error")
            {
                TempData["AlertMessage"] = "alert-danger";
            }
        }
    }
}