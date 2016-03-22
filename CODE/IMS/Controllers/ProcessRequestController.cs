﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
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
        public ActionResult Detail(string code)
        {
            var r = RequestBLO.Current.GetByKeys(new Request { RequestCode = code });
            var rType = string.Empty;
            if (r != null)
            {
                rType = r.RequestType;
            }
            if (rType.Equals(Constants.RequestTypeCode.ADD_SERVER))
            {
                var group = GetCurrentUserGroup();
                var role = GetCurrentUserRole();
                //Get request
                var request = RequestBLO.Current.DetailProcessRequestAddServer(code, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestAddServerViewModel>(request);
                var list = new List<ServerExtendedModel>();
                foreach (var item in request.Serverss)
                {
                    list.Add(item);
                }
                viewmodel.Servers = list;
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
                var request = RequestBLO.Current.DetailProcessRequestBringServerAway(code, group, role);
                var viewmodel = Mapper.Map<ProcessRequestExtendedModel, ProcessRequestBringServerAwayViewModel>(request);
                var list = new List<ServerExtendedModel>();
                foreach (var item in request.ServerOfCustomers)
                {
                    list.Add(item);
                }
                viewmodel.ServerOfCustomer = list;
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
                var request = RequestBLO.Current.DetailProcessRequestAssignIP(code, group, role);
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
                var request = RequestBLO.Current.DetailProcessRequestChangeIP(code, group, role);
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
                var request = RequestBLO.Current.DetailProcessRequestReturnIP(code, group, role);
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
                var request = RequestBLO.Current.DetailProcessRequestRentRack(code, group, role);
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
                var request = RequestBLO.Current.DetailProcessRequestReturnRack(code, group, role);
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
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_WAITING,
                    Constants.TypeOfLog.LOG_ADD_SERVER, true);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                if (viewmodel.Button == "Export")
                {
                    RequestBLO.Current.ExportProcedure(viewmodel.Servers, viewmodel.CustomerInfo.Customer);
                    Success("Export Procedure Successfully!");
                    return RedirectToAction("Detail", new
                    {
                        rType = viewmodel.RequestInfo.RequestType,
                        rCode = viewmodel.RequestInfo.RequestCode
                    });
                }
                else
                {
                    var result = RequestBLO.Current.ApproveRequestAddServer(viewmodel.RequestInfo.RequestCode, viewmodel.Servers,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode);
                    //dang ky ham cho client
                    Notify(result.NotificationCodes);
                }
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestAddServer(viewmodel.RequestInfo.RequestCode, viewmodel.Servers,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.PROCESS_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                   viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                   Constants.TypeOfLog.LOG_ADD_SERVER, false);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                   viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ADD_SERVER, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
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
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                   viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_WAITING,
                   Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, true);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var result = RequestBLO.Current.ApproveRequestBringServerAway(viewmodel.RequestInfo.RequestCode, viewmodel.ServerOfCustomer,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestBringServerAway(viewmodel.RequestInfo.RequestCode, viewmodel.ServerOfCustomer,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.PROCESS_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                   viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                   Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, false);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.BRING_SERVER_AWAY, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                    Constants.TypeOfLog.LOG_ASSIGN_IP, true);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.ASSIGN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var result = RequestBLO.Current.ApproveRequestAssignIP(viewmodel.RequestInfo.RequestCode, viewmodel.IPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                    Constants.TypeOfLog.LOG_CHANGE_IP, true);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.CHANGE_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var result = RequestBLO.Current.ApproveRequestChangeIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.NewIPs, viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode,
                    viewmodel.SelectedServer, viewmodel.RequestInfo.StatusCode);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestChangeIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode,
                    viewmodel.SelectedServer, viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequesReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                    Constants.TypeOfLog.LOG_RETURN_IP, true);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_IP, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var result = RequestBLO.Current.ApproveRequestReturnIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestReturnIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer,
                    viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                    Constants.TypeOfLog.LOG_RENT_RACK, true);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RENT_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var result = RequestBLO.Current.ApproveRequestRentRack(viewmodel.RequestInfo.RequestCode, viewmodel.listRackByRows,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestRentRack(viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_PROCESSING,
                    Constants.TypeOfLog.LOG_RETURN_RACK, true);
                var task = RequestBLO.Current.AssignTask(viewmodel.RequestInfo.RequestCode, shifthead,
                    viewmodel.RequestInfo.Assignee);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(task.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest",
                    new { rType = Constants.RequestTypeCode.RETURN_RACK, rCode = viewmodel.RequestInfo.RequestCode });
            }
            if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
            {
                var result = RequestBLO.Current.ApproveRequestReturnRack(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedRacks,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
            {
                var result = RequestBLO.Current.RejectRequestReturnRack(viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee,
                    viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer, viewmodel.RequestInfo.RejectReason);
                //dang ky ham cho client
                Notify(result.NotificationCodes);
            }
            if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
            {
                var shifthead = GetCurrentUserName();
                var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                     viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                    viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                //dang ky ham cho client
                if (viewmodel.RequestInfo.Assignee != shifthead)
                {
                    Notify(preTask.NotificationCodes);
                }
                if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                {
                    Notify(newTask.NotificationCodes);
                }
                return RedirectToAction("Detail", "ProcessRequest", new { code = viewmodel.RequestInfo.RequestCode });
            }
            return RedirectToAction("Index");

        }
        #endregion
    }
}
