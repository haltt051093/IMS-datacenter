using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.ViewModels;
using IMS.Models;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    [Roles(Constants.Role.CUSTOMER)]
    public class RequestDetailController : CoreController
    {
        [HttpGet]
        public ActionResult Detais(string rType, string rCode)
        {
            if (rType.Equals(Constants.TypeOfLog.LOG_ADD_SERVER))
            {
                //Get request
                ProcessRequestAddServerViewModel viewmodel = new ProcessRequestAddServerViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //lay list servers
                var serverCodes = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode);
                List<ServerExtendedModel> list = new List<ServerExtendedModel>();
                foreach (var servercode in serverCodes)
                {
                    var server = ServerBLO.Current.GetAllServerInfo(servercode);
                    list.Add(server);
                }
                viewmodel.Servers = list;
                return View("AddServerInfo", viewmodel);
            }
            if (rType.Equals(Constants.TypeOfLog.LOG_BRING_SERVER_AWAY))
            {
                ProcessRequestBringServerAwayViewModel viewmodel = new ProcessRequestBringServerAwayViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //main info
                var returnValues = LogChangedContentBLO.Current.RequestDetailsBringServerAway(rCode);
                viewmodel.ReturnIpNumber = returnValues.ReturnIpNumber;
                viewmodel.ReturnLocationNumber = returnValues.ReturnLocationNumber;
                viewmodel.SelectedServerNumber = returnValues.ReturnServerNumber;
                viewmodel.ServerOfCustomer = returnValues.Servers;
                return View("BringServerAwayInfo", viewmodel);
            }
            if (rType.Equals(Constants.TypeOfLog.LOG_ASSIGN_IP))
            {
                ProcessRequestAssignIPViewModel viewmodel = new ProcessRequestAssignIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //Lay so luong IP muon assign
                var reqDetail = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.RequestInfo.Description);
                viewmodel.NumberOfIP = reqDetail.NumberOfIp;
                viewmodel.RequestInfo.Description = reqDetail.Description;
                //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.IPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode,
                        Constants.Object.OBJECT_IP, Constants.StatusCode.IP_USED);
                }
                return View("AssignIPInfo", viewmodel);
            }
            if (rType.Equals(Constants.TypeOfLog.LOG_CHANGE_IP))
            {
                ProcessRequestChangeIPViewModel viewmodel = new ProcessRequestChangeIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //lay ip muon change
                viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_SERVERIP,
                    Constants.StatusCode.SERVERIP_CHANGING);
                //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_IP,
                    Constants.StatusCode.IP_AVAILABLE);
                    viewmodel.NewIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_IP,
                    Constants.StatusCode.IP_USED);
                }
                return View("ChangeIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.TypeOfLog.LOG_RETURN_IP))
            {
                ProcessRequestReturnIPViewModel viewmodel = new ProcessRequestReturnIPViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //get servercode = requestcode
                viewmodel.SelectedServer = LogChangedContentBLO.Current.GetServerCodeByRequestCode(rCode).FirstOrDefault();
                //List returning IPs
                viewmodel.ReturningIPs = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode, Constants.Object.OBJECT_SERVERIP,
                    Constants.StatusCode.SERVERIP_RETURNING);
                return View("ReturnIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.TypeOfLog.LOG_RENT_RACK))
            {
                ProcessRequestRentRackViewModel viewmodel = new ProcessRequestRentRackViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //Lay so luong rack muon thue
                var desc = JsonConvert.DeserializeObject<RequestDetailViewModel>(viewmodel.RequestInfo.Description);
                viewmodel.RackNumbers = desc.NumberOfRack;
                viewmodel.RequestInfo.Description = desc.Description;
                if (viewmodel.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.RentedRacks = LogChangedContentBLO.Current.GetChangedValueOfObject(rCode,
                        Constants.Object.OBJECT_RACK, Constants.StatusCode.RACK_RENTED);
                }
                else
                {
                    //list cot rows
                    var rows = RackBLO.Current.GetAllRowsOfRack();
                    var listRacks = rows.SelectMany(item => RackBLO.Current.GetRackByRow(item)).ToList();
                    viewmodel.listRackByRows = listRacks;
                    //list row
                    viewmodel.ListRows = rows.Select(x => new SelectListItem { Value = x, Text = x }).ToList();
                }
                ViewBag.Message = "Request Deny";
                return View("RentRackInfo", viewmodel);
            }
            if (rType.Equals(Constants.TypeOfLog.LOG_RETURN_RACK))
            {
                ProcessRequestReturnRackViewModel viewmodel = new ProcessRequestReturnRackViewModel();
                //request info
                viewmodel.RequestInfo = RequestBLO.Current.GetRequestInfo(rCode);
                //Lay so luong rack muon return
                var listRacks = LogChangedContentBLO.Current.RequestDetailsReturnRack(rCode);
                viewmodel.SelectedRacks = listRacks.listRacks;
                return View("ReturnRackInfo", viewmodel);
            }
            return RedirectToAction("Index", "Notification");
        }

        [HttpPost]
        public ActionResult CancelRequestAddServer(ProcessRequestAddServerViewModel viewmodel)
        {
            //DOING
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [HttpPost]
        public ActionResult CancelRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Update lai serverip, server, request
            LogChangedContentBLO.Current.CancelRequestBringServerAway(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
               new { rType = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [HttpPost]
        public ActionResult CancelRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //update request status and log
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
            Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_ASSIGN_IP, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [HttpPost]
        public ActionResult CancelRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Update and log serverip, request
            LogChangedContentBLO.Current.CancelRequestChangeIp(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
               new { rType = Constants.TypeOfLog.LOG_CHANGE_IP, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [HttpPost]
        public ActionResult CancelRequestReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //Update va log serverip, request
            LogChangedContentBLO.Current.CancelRequestReturnIp(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_RETURN_IP, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [HttpPost]
        public ActionResult CancelRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            //update request status and log
            RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                Constants.TypeOfLog.LOG_RENT_RACK, Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_RENT_RACK, rCode = viewmodel.RequestInfo.RequestCode });
        }

        [HttpPost]
        public ActionResult CancelRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            var customer = GetCurrentUserName();
            LogChangedContentBLO.Current.CancelRequestReturnRack(viewmodel.RequestInfo.RequestCode, customer);
            return RedirectToAction("Detais",
                new { rType = Constants.TypeOfLog.LOG_RETURN_RACK, rCode = viewmodel.RequestInfo.RequestCode });
        }
    }
}
