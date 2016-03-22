using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.ViewModels;
using IMS.Models;
using Microsoft.Office.Interop.Word;
using Newtonsoft.Json;

namespace IMS.Controllers
{
    public class ProcessRequestController : CoreController
    {
        public ActionResult Index()
        {
            var data = new RequestIndexViewModel();
            data.Requests = LogBLO.Current.GetAllRequest();
            data.FilterByRequestType = RequestTypeBLO.Current
                .GetAll()
                .Select(x => new SelectListItem { Value = x.RequestTypeCode, Text = x.RequestTypeName })
                .ToList();
            data.FilterByStatus = StatusBLO.Current
                .GetStatusByObject(Constants.Object.OBJECT_REQUEST)
                .Select(x => new SelectListItem { Value = x.StatusCode, Text = x.StatusName })
                .ToList();
            data.FilterByPeriodOfTime = new List<SelectListItem>
            {
                new SelectListItem() {Value = "0", Text = "Today", Selected = true },
                new SelectListItem() {Value = "7", Text = "One Week"},
                new SelectListItem() {Value = "30", Text = "One Month"},
                new SelectListItem() {Value = "99999", Text = "All"}
            };
            return View(data);
        }

        #region request detail
        [HttpGet]
        public ActionResult Detais(string rType, string rCode)
        {
            if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestAddServer(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestAddServerViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();
                return View("AddServerInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.BRING_SERVER_AWAY))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestBringServerAway(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestBringServerAwayViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();
                return View("BringServerAwayInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.ASSIGN_IP))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestAssignIP(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestAssignIPViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();

                if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
                {
                    var randomList = request.randomList;
                    var listAvailableIps = request.listAvailableIps;
                    viewmodel.SelectedIps = randomList.Select(x => new SelectListItem
                    {
                        Value = x,
                        Text = x
                    }).ToList();
                    //cho hien thi multiple list, ko bao gom randomList
                    if (listAvailableIps != null)
                    {
                        for (int i = 0; i < listAvailableIps.Count; i++)
                        {
                            for (int j = 0; j < randomList.Count; j++)
                            {
                                var item = listAvailableIps[i];
                                if (item.IPAddress.Equals(randomList[j]))
                                {
                                    listAvailableIps.Remove(item);
                                }
                            }
                        }
                        viewmodel.IpSelectListItems = listAvailableIps.Select(x => new SelectListItem
                        {
                            Value = x.IPAddress,
                            Text = x.IPAddress
                        }).ToList();
                    }
                    else
                    {
                        //listAvailableIps = [];
                        //viewmodel.IpSelectListItems = listAvailableIps.Select(x => new SelectListItem
                        //{
                        //    Value = "",
                        //    Text = ""
                        //}).ToList();
                    }
                }
                return View("AssignIPInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.CHANGE_IP))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestChangeIP(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestChangeIPViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();

                if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
                {
                    viewmodel.NewIPsOptions = request.listAvailableIps.Select(x => new SelectListItem
                    {
                        Value = x.IPAddress,
                        Text = x.IPAddress
                    }).ToList();
                }
                return View("ChangeIPInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_IP))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestReturnIP(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestReturnIPViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();
                return View("ReturnIPInfo", viewmodel);
            }

            if (rType.Equals(Constants.RequestTypeCode.RENT_RACK))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestRentRack(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestRentRackViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();
                //list row
                if (request.RequestInfo.StatusCode != Constants.StatusCode.REQUEST_DONE)
                {
                    viewmodel.ListRows = request.rows.Select(x => new SelectListItem { Value = x, Text = x }).ToList();
                }
                ViewBag.Message = "Request Deny";
                return View("RentRackInfo", viewmodel);
            }
            if (rType.Equals(Constants.RequestTypeCode.RETURN_RACK))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestReturnRack(rCode, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestReturnRackViewModel>(request);
                viewmodel.CurrentUser = GetCurrentUserName();
                viewmodel.StaffCodeOptions = request.listStaff
                .Select(x => new SelectListItem
                {
                    Value = x.Username,
                    Text = x.Fullname,
                    Selected = x.Role == Constants.Role.SHIFT_HEAD
                })
                .ToList();
                return View("ReturnRackInfo", viewmodel);
            }
            return RedirectToAction("Index");
        }
        #endregion

        #region process request
        [HttpPost]
        public ActionResult ProcessRequestAddServer(ProcessRequestAddServerViewModel viewmodel)
        {
            //assign pending
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.REQUEST_WAITING, shifthead, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                if (viewmodel.Button == "Export")
                {
                    RequestBLO.Current.ExportProcedure(viewmodel.Servers, viewmodel.CustomerInfo.Customer);
                    Success("Export Procedure Successfully!");
                    return RedirectToAction("Detais", new { rType = viewmodel.RequestInfo.RequestType, rCode = viewmodel.RequestInfo.RequestCode });
                }
                else
                {
                    RequestBLO.Current.ApproveRequestAddServer(viewmodel.RequestInfo.RequestCode, viewmodel.Servers,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode);
                    Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
                }
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestAddServer(viewmodel.RequestInfo.RequestCode, viewmodel.Servers,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.PROCESS_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_ADD_SERVER);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
        {
            //assign pending
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.UpdateRequestStatusANDLog(viewmodel.RequestInfo.RequestCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.REQUEST_WAITING, shifthead, shifthead, null);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                RequestBLO.Current.ApproveRequestBringServerAway(viewmodel.RequestInfo.RequestCode, viewmodel.ServerOfCustomer,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);

            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestBringServerAway(viewmodel.RequestInfo.RequestCode, viewmodel.ServerOfCustomer,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.PROCESS_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_ASSIGN_IP);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ASSIGN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                RequestBLO.Current.ApproveRequestAssignIP(viewmodel.RequestInfo.RequestCode, viewmodel.IPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ASSIGN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_CHANGE_IP);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.CHANGE_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                RequestBLO.Current.ApproveRequestChangeIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.NewIPs, viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode,
                    viewmodel.SelectedServer, viewmodel.RequestInfo.StatusCode);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestChangeIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode,
                    viewmodel.SelectedServer, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.CHANGE_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequesReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_RETURN_IP);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                RequestBLO.Current.ApproveRequestReturnIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestReturnIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_RENT_RACK);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RENT_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                RequestBLO.Current.ApproveRequestRentRack(viewmodel.RequestInfo.RequestCode, viewmodel.listRackByRows,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestRentRack(viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RENT_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead, viewmodel.RequestInfo.Assignee, Constants.TypeOfLog.LOG_RETURN_RACK);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                RequestBLO.Current.ApproveRequestReturnRack(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedRacks,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer);
                Toast(Constants.AlertType.SUCCESS, "RequestRentRack", null, true);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                RequestBLO.Current.RejectRequestReturnRack(viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee,
                    viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer, viewmodel.RequestInfo.RejectReason);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                return RedirectToAction("Detais", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");

        }
        #endregion
    }
}
