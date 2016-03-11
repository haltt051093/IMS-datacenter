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
                    //DOING
                    //Hoi thay lai xem co can bang serverattributes nữa ko --> bỏ attribute cho rảnh nợ
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_BRING_SERVER_AWAY)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //Update lai serverip, server, request
                    LogChangedContentBLO.Current.CancelRequestBringServerAway(requestCode);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {
                    //PENDING
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
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            //DOING
            if (requestType == Constants.TypeOfLog.LOG_CHANGE_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //Update and log serverip, request
                    LogChangedContentBLO.Current.CancelRequestChangeIp(requestCode);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RETURN_IP)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //Update va log serverip, request
                    LogChangedContentBLO.Current.CancelRequestReturnIp(requestCode);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RENT_RACK)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {
                    //update request status and log
                    RequestBLO.Current.UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, Constants.Test.CUSTOMER_MANHNH);
                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }
            if (requestType == Constants.TypeOfLog.LOG_RETURN_RACK)
            {
                if (actionName == Constants.FormAction.CANCEL_ACTION)
                {

                }
                if (actionName == Constants.FormAction.REJECT_ACTION)
                {

                }
            }

            return RedirectToAction("Index", "Request");
        }
    }
}