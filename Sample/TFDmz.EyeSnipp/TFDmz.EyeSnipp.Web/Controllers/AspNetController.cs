using System.Web.Mvc;
using TForceAlliance.Xyz.EyeSnipp.Models;

namespace TForceAlliance.Xyz.EyeSnipp.Controllers
{
    public class AspNetController : Controller
    {
        public ActionResult AjaxForm()
        {
            return View();
        }

        [HttpPost]
        public JsonResult AjaxForm(AspNetAjaxFormModel form)
        {
            var result = new { Success = true };
            return Json(result);
        }
    }
}