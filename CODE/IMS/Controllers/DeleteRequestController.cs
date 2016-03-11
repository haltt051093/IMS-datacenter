
using System.Web.Mvc;
using IMS.Core;
using IMS.Data.Business;
using IMS.Models;

namespace IMS.Controllers
{
    public class DeleteRequestController : Controller
    {
        // GET: DeleteRequest
        public ActionResult Index(string requestCode, string requestType, string actionName)
        {

            if (requestType == Constants.TypeOfLog.LOG_ADD_SERVER)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_BRING_SERVER_AWAY)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_ASSIGN_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //update request status and log
                    RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }
            //DOING
            if (requestType == Constants.TypeOfLog.LOG_CHANGE_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //update request status and log
                    RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);

                    //Update lai serverip, dua vao log

                    //log lai ip tro ve trang thai nhu ban dau, dua vao requestcode, object, lay duoc ip va serverCode
                    //chuyen trang thai serverip, chuyen trang thai ip, chuyen trang thai request
                    //log lai serverip, request, ipaddress
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RETURN_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RENT_RACK)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RETURN_RACK)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                }
                if (actionName == Constants.FormAction.DELETE_ACTION)
                {

                }
            }

            return RedirectToAction("Index", "Request");
        }
    }
}