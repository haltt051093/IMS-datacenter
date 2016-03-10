using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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

                    //Update lai serverip, dua vao 

                    //log lai ip tro ve trang thai nhu ban dau

                    //log tat ca ip muon change
                    //string last = selected[0];
                    //List<string> ips = last.Split(',').ToList<string>();
                    //ips.Reverse();
                    //foreach (var item in ips)
                    //{
                    //    //update status ip bang serverip
                    //    ServerIPBLO.Current.UpdateServerIp(viewmodel.SelectedServer,
                    //        item, Constants.StatusCode.SERVERIP_CHANGING);
                    //}
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