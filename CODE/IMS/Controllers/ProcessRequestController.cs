using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using AutoMapper;
using IMS.Authentications;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using IMS.Models;

namespace IMS.Controllers
{
    [Roles(Constants.Role.MANAGER, Constants.Role.SHIFT_HEAD, Constants.Role.STAFF)]
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
            var listStatus = StatusBLO.Current.GetStatusByObject(Constants.Object.OBJECT_REQUEST).
                Where(x => x.StatusCode != Constants.StatusCode.REQUEST_TEMP).ToList();
            data.FilterByStatus = listStatus
                .Select(x => new SelectListItem
                {
                    Value = x.StatusCode,
                    Text = x.StatusName,
                    Selected = (x.StatusCode == Constants.StatusCode.REQUEST_PENDINGPROCESSING)
                })
                .ToList();
            data.FilterByPeriodOfTime = new List<SelectListItem>
            {
                new SelectListItem() {Value = "0", Text = "Today", Selected = true },
                new SelectListItem() {Value = "7", Text = "One Week"},
                new SelectListItem() {Value = "30", Text = "One Month"},
                new SelectListItem() {Value = "99999", Text = "All"}
            };
            data.SelectedStatus = Constants.StatusCode.REQUEST_PENDINGPROCESSING;
            return View(data);
        }

        #region request detail
        [HttpGet]
        public ActionResult Detail(string code, string msg)
        {
            var checkRequest = RequestBLO.Current.CheckExistedRequest(code, null);
            if (checkRequest)
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING))
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }
                    if (viewmodel.RequestInfo.AssigneeName == null)
                    {
                        var activeShifthead = AccountBLO.Current.GetActiveShiftHead();
                        viewmodel.RequestInfo.AssigneeName = activeShifthead.Fullname + " - " + activeShifthead.GroupCode;
                    }
                    viewmodel.CurrentUser = GetCurrentUserName();
                    viewmodel.StaffCodeOptions = request.listStaff
                    .Select(x => new SelectListItem
                    {
                        Value = x.Username,
                        Text = x.NameAndGroup,
                        Selected = x.Role == Constants.Role.SHIFT_HEAD
                    })
                    .ToList();
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING))
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }
                    viewmodel.CurrentUser = GetCurrentUserName();
                    viewmodel.StaffCodeOptions = request.listStaff
                     .Select(x => new SelectListItem
                     {
                         Value = x.Username,
                         Text = x.NameAndGroup,
                         Selected = x.Role == Constants.Role.SHIFT_HEAD
                     })
                     .ToList();
                    if (viewmodel.RequestInfo.AssigneeName == null)
                    {
                        var activeShifthead = AccountBLO.Current.GetActiveShiftHead();
                        viewmodel.RequestInfo.AssigneeName = activeShifthead.Fullname + " - " + activeShifthead.GroupCode;
                    }
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING)
                                                         && viewmodel.CurrentUser == request.RequestInfo.Assignee)
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }

                    viewmodel.StaffCodeOptions = request.listStaff
                    .Select(x => new SelectListItem
                    {
                        Value = x.Username,
                        Text = x.NameAndGroup,
                        Selected = x.Role == Constants.Role.SHIFT_HEAD
                    })
                    .ToList();
                    var listAvailableIps = request.listAvailableIps;
                    if (listAvailableIps.Count >= viewmodel.NumberOfIP)
                    {
                        if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
                        {
                            var randomList = request.randomList;
                            viewmodel.SelectedIps = randomList.Select(x => new SelectListItem
                            {
                                Value = x,
                                Text = x
                            }).ToList();
                            //cho hien thi multiple list, ko bao gom randomList
                            //if (listAvailableIps != null)
                            //{
                            //    for (int i = 0; i < listAvailableIps.Count; i++)
                            //    {
                            //        for (int j = 0; j < randomList.Count; j++)
                            //        {
                            //            var item = listAvailableIps[i];
                            //            if (item.IPAddress.Equals(randomList[j]))
                            //            {
                            //                listAvailableIps.Remove(item);
                            //            }
                            //        }
                            //    }
                                viewmodel.IpSelectListItems = request.listAvailableIpsOption.Select(x => new SelectListItem
                                {
                                    Value = x.IPAddress,
                                    Text = x.IPAddress
                                }).ToList();
                            //}
                        }
                    }
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING)
                                                         && viewmodel.CurrentUser == request.RequestInfo.Assignee)
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }
                    viewmodel.StaffCodeOptions = request.listStaff
                     .Select(x => new SelectListItem
                     {
                         Value = x.Username,
                         Text = x.NameAndGroup,
                         Selected = x.Role == Constants.Role.SHIFT_HEAD
                     })
                     .ToList();

                    if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
                    {
                        viewmodel.RequiredNum = viewmodel.ReturningIPs.Count;
                        viewmodel.AvailableIPNum = request.listAvailableIps.Count;
                        if (viewmodel.AvailableIPNum >= viewmodel.RequiredNum)
                        {
                            viewmodel.NewIPsOptions = request.listAvailableIps.Select(x => new SelectListItem
                            {
                                Value = x.IPAddress,
                                Text = x.IPAddress
                            }).ToList();
                        }
                    }
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING)
                                                         && viewmodel.CurrentUser == request.RequestInfo.Assignee)
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }
                    viewmodel.StaffCodeOptions = request.listStaff
                    .Select(x => new SelectListItem
                    {
                        Value = x.Username,
                        Text = x.NameAndGroup,
                        Selected = x.Role == Constants.Role.SHIFT_HEAD
                    })
                    .ToList();
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING)
                                                         && viewmodel.CurrentUser == request.RequestInfo.Assignee)
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }
                    viewmodel.StaffCodeOptions = request.listStaff
                    .Select(x => new SelectListItem
                    {
                        Value = x.Username,
                        Text = x.NameAndGroup,
                        Selected = x.Role == Constants.Role.SHIFT_HEAD
                    })
                    .ToList();
                    //list row
                    if (request.RequestInfo.StatusCode != Constants.StatusCode.REQUEST_DONE)
                    {
                        viewmodel.ListRows = request.rows.Select(x => new SelectListItem { Value = x, Text = x }).ToList();
                    }
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
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
                    //task
                    if (role == Constants.Role.STAFF && (request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_WAITING
                                                         || request.RequestInfo.TaskStatus == Constants.StatusCode.TASK_DOING)
                                                         && viewmodel.CurrentUser == request.RequestInfo.Assignee)
                    {
                        viewmodel.IsAssignedUser = true;
                    }
                    else
                    {
                        viewmodel.IsAssignedUser = false;
                    }
                    viewmodel.StaffCodeOptions = request.listStaff
                    .Select(x => new SelectListItem
                    {
                        Value = x.Username,
                        Text = x.NameAndGroup,
                        Selected = x.Role == Constants.Role.SHIFT_HEAD
                    })
                    .ToList();
                    if (msg != null)
                    {
                        string check = msg.Substring(0, 5);
                        if (check == "Error")
                        {
                            viewmodel.ErrorMessage = msg;
                        }
                        else
                        {
                            viewmodel.SuccessMessage = msg;
                        }
                    }
                    return View("ReturnRackInfo", viewmodel);
                }
            }
            return RedirectToAction("Index","Error");
        }
        #endregion

        #region process request
        [HttpPost]
        public ActionResult ProcessRequestAddServer(ProcessRequestAddServerViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                //assign pending
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
                    {
                        var shifthead = GetCurrentUserName();
                        var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                            viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_WAITING,
                            Constants.TypeOfLog.LOG_ADD_SERVER, true);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_REQUEST_ADD_SERVER });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }

                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.ApproveRequestAddServer(viewmodel.RequestInfo.RequestCode, viewmodel.Servers,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                        new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_ADD_SERVER });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.EXPORT_ACTION] != null)
                {
                    var role = GetCurrentUserRole();
                    var st = GetCurrentUserName();
                    var staff = AccountBLO.Current.GetAccountByCode(st);
                    RequestBLO.Current.ExportProcedure(viewmodel.Servers, viewmodel.CustomerInfo.Customer, staff.Fullname, role);
                    return RedirectToAction("Detail", "ProcessRequest",
                    new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.PRINT_PROCEDURE });
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_ADD_SERVER });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
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
                        new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.PROCESSING_REQUEST_ADD_SERVER });
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestBringServerAway(ProcessRequestBringServerAwayViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                //assign pending
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
                    {
                        var shifthead = GetCurrentUserName();
                        var result = RequestBLO.Current.AcceptRequest(viewmodel.RequestInfo.RequestCode, shifthead,
                           viewmodel.RequestInfo.Assignee, Constants.StatusCode.REQUEST_WAITING,
                           Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, true);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_REQUEST_BRING_SERVER_AWAY });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.ApproveRequestBringServerAway(viewmodel.RequestInfo.RequestCode, viewmodel.ServerOfCustomer,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_BRING_SERVER_AWAY });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_BRING_SERVER_AWAY });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
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
                        new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.PROCESSING_REQUEST_BRING_SERVER_AWAY });
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestAssignIp(ProcessRequestAssignIPViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
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
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_REQUEST_ASSIGN_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        //get ip
                        var ips = viewmodel.IPsString;
                        var tokens = ips.Split(';').ToList();
                        var msg = Constants.Message.APPROVE_REQUEST_ASSIGN_IP;
                        //validate realtime
                        var check = IPAddressPoolBLO.Current.CheckExistedIPs(tokens);
                        if (check)
                        {
                            msg = "You're fooled";
                        }
                        else
                        {
                            var result = RequestBLO.Current.ApproveRequestAssignIP(viewmodel.RequestInfo.RequestCode, tokens,
                           viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer);
                            Notify(result.NotificationCodes);
                        }
                        //dang ky ham cho client
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_ASSIGN_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }

                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }

                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestChangeIp(ProcessRequestChangeIPViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
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
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_REQUEST_CHANGE_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var msg = Constants.Message.APPROVE_REQUEST_CHANGE_IP;
                        //validate realtime
                        var check = IPAddressPoolBLO.Current.CheckExistedIPs(viewmodel.NewIPs);
                        if (check)
                        {
                            msg = "You're fooled";
                        }
                        else
                        {
                            var result = RequestBLO.Current.ApproveRequestChangeIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                            viewmodel.NewIPs, viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode,
                            viewmodel.SelectedServer, viewmodel.RequestInfo.StatusCode);
                            //dang ky ham cho client
                            Notify(result.NotificationCodes);
                        }
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_CHANGE_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequesReturnIp(ProcessRequestReturnIPViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
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
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_RETURN_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.ApproveRequestReturnIP(viewmodel.RequestInfo.RequestCode, viewmodel.ReturningIPs,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.SelectedServer);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_RETURN_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_RETURN_IP });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestRentRack(ProcessRequestRentRackViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
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
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_REQUEST_RERNT_RACK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.ApproveRequestRentRack(viewmodel.RequestInfo.RequestCode, viewmodel.listRackByRows,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_RENT_RACK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_RENT_RACK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }

        [HttpPost]
        public ActionResult ProcessRequestReturnRack(ProcessRequestReturnRackViewModel viewmodel)
        {
            var status = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).StatusCode;
            if (status == Constants.StatusCode.REQUEST_REJECTED || status == Constants.StatusCode.REQUEST_DONE || status == Constants.StatusCode.REQUEST_CANCELLED)
            {
                return RedirectToAction("Detail", "ProcessRequest", new
                {
                    code = viewmodel.RequestInfo.RequestCode,
                    msg = Constants.Message.ERROR_CANCEL_REQUEST
                });
            }
            else
            {
                if (Request.Form[Constants.FormAction.ACCEPT_ACTION] != null)
                {
                    if (status == Constants.StatusCode.REQUEST_PENDING)
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
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_REQUEST_RETURN_RACK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = Constants.Message.ERROR_CANCEL_REQUEST
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.APPROVE_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.ApproveRequestReturnRack(viewmodel.RequestInfo.RequestCode, viewmodel.SelectedRacks,
                        viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.TaskCode, viewmodel.CustomerInfo.Customer);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.APPROVE_REQUEST_RETURN_RACK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REJECT_ACTION] != null)
                {
                    var assignee = RequestBLO.Current.GetByKeys(new Request { RequestCode = viewmodel.RequestInfo.RequestCode }).Assignee;
                    if (assignee == null)
                    {
                        assignee = GetCurrentUserName();
                    }
                    if (assignee == viewmodel.RequestInfo.Assignee)
                    {
                        var result = RequestBLO.Current.RejectRequestAssignIP(viewmodel.RequestInfo.RequestCode,
                            assignee, viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.Reason);
                        //dang ky ham cho client
                        Notify(result.NotificationCodes);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.REJECT_REQUEST_RETURN_RACK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! You are not authorized."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.REASSIGN_ACTION] != null)
                {
                    var shifthead = GetCurrentUserName();
                    var check = RequestBLO.Current.IsShiftHeadDoingTask(viewmodel.RequestInfo.TaskCode);
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING || taskstatus == Constants.StatusCode.TASK_NOTFINISH || check)
                    {
                        if (viewmodel.RequestInfo.TaskStatus != Constants.StatusCode.TASK_NOTFINISH)
                        {
                            var preTask = RequestBLO.Current.CancelTask(viewmodel.RequestInfo.TaskCode,
                            viewmodel.RequestInfo.RequestCode, viewmodel.RequestInfo.Assignee, shifthead);
                            //dang ky ham cho client
                            if (viewmodel.RequestInfo.Assignee != shifthead)
                            {
                                Notify(preTask.NotificationCodes);
                            }
                        }
                        var newTask = RequestBLO.Current.ReAssignTask(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.RequestCode,
                            viewmodel.RequestInfo.Assignee, viewmodel.RequestInfo.AssignedStaff, shifthead);
                        //dang ky ham cho client
                        if (viewmodel.RequestInfo.AssignedStaff != shifthead)
                        {
                            Notify(newTask.NotificationCodes);
                        }
                        var message = Constants.Message.REASSIGN_TASK + viewmodel.RequestInfo.AssignedStaffName;
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = message });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Staff is processing request."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.ACCEPT_TASK_ACTION] != null)
                {
                    var taskstatus = TaskBLO.Current.GetByKeys(new Task { TaskCode = viewmodel.RequestInfo.TaskCode }).StatusCode;
                    if (taskstatus == Constants.StatusCode.TASK_WAITING)
                    {
                        //update task
                        TaskBLO.Current.UpdateTaskStatus(viewmodel.RequestInfo.TaskCode, Constants.StatusCode.TASK_DOING);
                        return RedirectToAction("Detail", "ProcessRequest",
                            new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.ACCEPT_TASK });
                    }
                    else
                    {
                        return RedirectToAction("Detail", "ProcessRequest", new
                        {
                            code = viewmodel.RequestInfo.RequestCode,
                            msg = "Error! Your task is cancelled."
                        });
                    }
                }
                if (Request.Form[Constants.FormAction.NOT_FINISHED_TASK_ACTION] != null)
                {
                    var result = RequestBLO.Current.NotFinishRequest(viewmodel.RequestInfo.TaskCode, viewmodel.RequestInfo.NotFinishReason);
                    Notify(result.NotificationCodes);
                    return RedirectToAction("Detail", "ProcessRequest",
                       new { code = viewmodel.RequestInfo.RequestCode, msg = Constants.Message.NOT_FINISHED_TASK });
                }
            }
            return RedirectToAction("Index");
        }
        #endregion
    }
}
