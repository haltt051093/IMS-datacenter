using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using IMS.Core;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;
using Newtonsoft.Json;

namespace IMS.Data.Business
{
    public class RequestBLO : BaseBLO<Request>
    {
        protected RequestDAO dao;
        private static RequestBLO instance;

        public static RequestBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new RequestBLO();
                }
                return instance;
            }
        }

        private RequestBLO()
        {
            baseDao = RequestDAO.Current;
            dao = RequestDAO.Current;
        }

        public string GenerateCode()
        {
            return dao.GenerateCode();
        }

        //Tien
        public List<ScheduleExtendedModel> GetSchedule(DateTime? start = null, DateTime? end = null)
        {
            var reult = dao.GetSchedule(start, end);
            return reult;
        }

        public List<ScheduleExtendedModel> GetScheduleToday()
        {
            var today = DateTime.Now.Date;
            var tomorrow = today.AddDays(1);
            var reult = dao.GetSchedule(today, tomorrow);
            return reult;
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfShift()
        {
            return dao.GetNoteOfShift();
        }
        //Tien
        public List<ScheduleExtendedModel> GetNoteOfPreviousShift()
        {
            return dao.GetNoteOfPreviousShift();
        }

        public string GetCustomerOfRequest(string requestCode)
        {
            return RequestDAO.Current.Query(x => x.RequestCode == requestCode).Select(x => x.Customer).FirstOrDefault();
        }

        public void UpdateRequestStatusANDLog(string requestCode, string typeOfLog, string newStatus, string assignee, string staffCode, string description)
        {
            dao.UpdateRequestStatusANDLog(requestCode, typeOfLog, newStatus, assignee, staffCode, description);
        }

        public void UpdateRequestAssignee(string requestCode, string assignee)
        {
            dao.UpdateRequestAssignee(requestCode, assignee);
        }

        public List<RequestExtendedModel> GetWaitingRequestOfServer(string serverCode)
        {
            return dao.GetWaitingRequestOfServer(serverCode);
        }

        public void UpdateChangeIP(List<string> returningIp, List<string> selectedIps,
            string selectedServer, string requestCode, string staffCode)
        {
            var list = Enumerable.Zip(returningIp, selectedIps, (old, changed) => new { old, changed });
            foreach (var item in list)
            {
                //update and log status cua old ip o server ip
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, selectedServer, item.old,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_OLD, staffCode);
                //update and log status cua up cu o IPAddresspool
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, selectedServer, item.old, Constants.StatusCode.IP_AVAILABLE,
                    Constants.TypeOfLog.LOG_CHANGE_IP, staffCode);

                //add and log new serverip
                ServerIPBLO.Current.AddServerIpAndLog(requestCode, selectedServer, item.changed,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT, staffCode);
                //Update and log status cua IP moi o IPAddressPool
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, selectedServer, item.changed, Constants.StatusCode.IP_USED,
                    Constants.TypeOfLog.LOG_CHANGE_IP, staffCode);
            }
        }

        public string AddRequestANDLog(string requestType, string newStatus, string customer,
            string description, DateTime? appointmenTime, string serverCode, string typeOfLog, string UniqueRequestCode)
        {
            return dao.AddRequestANDLog(requestType, newStatus, customer, description, appointmenTime,
                serverCode, typeOfLog, UniqueRequestCode);
        }

        public RequestInfoModel GetRequestInfo(string requestCode)
        {
            var task = from t in TaskDAO.Current.Table
                       join s in StatusDAO.Current.Table
                            on t.StatusCode equals s.StatusCode into st
                       from subst in st.DefaultIfEmpty()
                       where t.RequestCode == requestCode
                       orderby t.AssignedTime descending
                       select new TaskExtendedModel()
                       {
                           StatusCode = t.StatusCode,
                           AssignedStaff = t.AssignedStaff,
                           StatusName = subst.StatusName,
                           RequestCode = t.RequestCode,
                           TaskCode = t.TaskCode,
                           ShiftHead = t.ShiftHead,
                           AssignedTime = t.AssignedTime
                       };

            var request = (from r in RequestDAO.Current.Table
                           join t in task
                                on r.RequestCode equals t.RequestCode into rt
                           from subrt in rt.DefaultIfEmpty()
                           where r.RequestCode == requestCode
                           orderby subrt.AssignedTime descending
                           select new RequestInfoModel()
                           {
                               StatusCode = r.StatusCode,
                               RequestCode = r.RequestCode,
                               Assignee = r.Assignee,
                               Description = r.Description,
                               IsViewed = r.IsViewed,
                               RequestType = r.RequestType,
                               RequestedTime = r.RequestedTime,
                               Customer = r.Customer,
                               AssignedStaff = subrt.AssignedStaff,
                               TaskStatus = subrt.StatusCode,
                               TaskCode = subrt.TaskCode,
                               TaskStatusName = subrt.StatusName,
                               ShiftHead = subrt.ShiftHead,
                               AppointmentTime = r.AppointmentTime
                           }).FirstOrDefault();
            if (request != null)
            {
                request.StatusName = StatusBLO.Current.GetStatusName(request.StatusCode);
                if (request.AssignedStaff == request.ShiftHead)
                {
                    request.IsShifthead = true;
                }
            }
            return request;
        }

        public Account GetAssignee(string requestCode)
        {
            var query1 = (from r in RequestDAO.Current.Table
                          where r.RequestCode == requestCode
                          select r).FirstOrDefault();
            if (query1 != null)
            {
                var assignee = query1.Assignee;
                if (assignee != null)
                {
                    var query = from a in AccountDAO.Current.Table
                                where a.Username == assignee
                                select a;
                    return query.FirstOrDefault();
                }
            }
            return null;
        }

        #region create request
        public string AddRequestAddServer(string customer, string description, DateTime? appointmentTime, string uniqueRequestCode)
        {
            //request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.ADD_SERVER,
                    Constants.StatusCode.REQUEST_PENDING, customer, description,
                    appointmentTime, null, Constants.TypeOfLog.LOG_ADD_SERVER, uniqueRequestCode);
            //server
            var temps = TempRequestBLO.Current.GetByRequestCode(requestCode);
            foreach (var temp in temps)
            {
                var server = JsonConvert.DeserializeObject<Server>(temp.Data);
                server.Customer = customer;
                ServerBLO.Current.AddServerANDLog(server, requestCode);
            }
            return requestCode;
        }

        public string AddRequestBringServerAway(string customer, string description, List<ServerExtendedModel> listServers, DateTime? appointmentTime)
        {
            //add request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.BRING_SERVER_AWAY,
                    Constants.StatusCode.REQUEST_PENDING, customer, description,
                    appointmentTime, null, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, null);
            foreach (var item in listServers)
            {
                if (item.Checked)
                {
                    //get currentIps
                    var currentIps = ServerIPBLO.Current.GetIpByServer(item.ServerCode, Constants.StatusCode.SERVERIP_CURRENT);
                    foreach (var ip in currentIps)
                    {
                        //update and log status ip bang serverip
                        ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, item.ServerCode, ip,
                            Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVERIP_RETURNING,
                            customer);
                    }
                    //update and log server
                    ServerBLO.Current.UpdateServerANDLog(requestCode, item.ServerCode,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_BRINGING_AWAY,
                        customer);
                }
            }
            return requestCode;
        }

        //luu xong het moi log Location cua server
        //log location
        //var serverLocation = LocationBLO.Current.GetLocationOfServer(item.ServerCode);
        //foreach (var item1 in serverLocation)
        //{
        //    var lc = item1.RackName + "U" + item1.RackUnit;
        //    var logLocation = new LogChangedContent
        //    {
        //        RequestCode = requestCode,
        //        TypeOfLog = Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
        //        Object = Constants.Object.OBJECT_LOCATION,
        //        ObjectStatus = Constants.StatusCode.LOCATION_USED,
        //        ChangedValueOfObject = lc,
        //        ServerCode = item.ServerCode,
        //        Username = customer
        //    };
        //    LogBLO.Current.Add(logLocation);
        //}

        public string AddRequestAssignIP(string customer, string description, string serverCode)
        {
            //request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.ASSIGN_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, description,
                    null, serverCode, Constants.TypeOfLog.LOG_ASSIGN_IP, null);
            //luu notification
            var notifCode = NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.ASSIGN_IP, customer, description);
            return requestCode;
        }

        public string AddRequestChangeIP(string customer, string description, string serverCode, List<string> returningIPs)
        {
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.CHANGE_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, description,
                    null, serverCode, Constants.TypeOfLog.LOG_CHANGE_IP, null);
            //update and log tat ca ip muon change --> chi co serverip
            var last = returningIPs[0];
            var ips = last.Split(',').ToList<string>();
            ips.Reverse();
            foreach (var item in ips)
            {
                //update and log status ip bang serverip
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, item,
                    Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CHANGING,
                    customer);
            }
            //luu notification
            var notifCode = NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.CHANGE_IP, customer, description);
            return requestCode;
        }

        public string AddRequestReturnIP(string customer, string description, string serverCode, List<string> returningIPs)
        {
            //add request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.RETURN_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, description,
                    null, serverCode, Constants.TypeOfLog.LOG_RETURN_IP, null);
            var last = returningIPs[0];
            var ips = last.Split(',').ToList<string>();
            ips.Reverse();
            foreach (var item in ips)
            {
                //update and log status ip bang serverip
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, item,
                    Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_RETURNING,
                    customer);
            }
            //luu notification
            var notifCode = NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.RETURN_IP, customer, description);
            return requestCode;
        }

        public string AddRequestRentRack(string customer, string description)
        {
            //add request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.RENT_RACK,
                Constants.StatusCode.REQUEST_PENDING, customer, description,
                null, null, Constants.TypeOfLog.LOG_RENT_RACK, null);
            //luu notification
            var notifCode = NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.RENT_RACK, customer, description);
            return requestCode;
        }

        public string AddRequestReturnRack(string customer, string description, List<RackOfCustomerExtendedModel> listRacks)
        {
            //Add and log request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.RETURN_RACK,
                Constants.StatusCode.REQUEST_PENDING, customer, description,
                null, null, Constants.TypeOfLog.LOG_RETURN_RACK, null);
            foreach (var item in listRacks)
            {
                if (item.Checked)
                {
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, item.RackCode,
                        Constants.TypeOfLog.LOG_RETURN_RACK, customer, null
                        , Constants.StatusCode.RACKOFCUSTOMER_CURRENT, Constants.StatusCode.RACKOFCUSTOMER_RETURNING, item.RackName);
                }
            }
            //luu notification
            var notifCode = NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.RENT_RACK, customer, description);
            return requestCode;
        }
        #endregion

        #region cancel request

        public void CancelRequestAddServer(string requestCode, string customer, string taskCode)
        {
            var serverCodes = LogBLO.Current.GetAddingServers(requestCode);
            foreach (var server in serverCodes)
            {
                //update and log server
                ServerBLO.Current.UpdateServerANDLog(requestCode, server,
                    Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_DEACTIVATE, customer);
            }
            //update request status and log
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
            Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        public void CancelRequestBringServerAway(string requestCode, string customer, string taskCode)
        {
            var listServerIp = LogBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVERIP_CURRENT,
                        customer);
                }
            }
            var servers = (from l in LogDAO.Current.Table
                           where l.RequestCode == requestCode && l.Object == Constants.Object.OBJECT_SERVER
                                 && l.ObjectStatus == Constants.StatusCode.SERVER_BRINGING_AWAY
                           select l).ToList();
            foreach (var server in servers)
            {
                var serverCode = server.ChangedValueOfObject;
                //update and log server
                ServerBLO.Current.UpdateServerANDLog(requestCode, serverCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_RUNNING,
                    customer);
            }
            //update request status and log
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        public void CancelRequestAssignIP(string requestCode, string customer, string taskCode)
        {
            //update request status and log
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
            Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        public void CancelRequestChangeIp(string requestCode, string customer, string taskCode)
        {
            var listServerIp = LogBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT,
                        customer);
                }
                //update request status and log
                UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                     Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            }
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        public void CancelRequestReturnIp(string requestCode, string customer, string taskCode)
        {
            var listServerIp = LogBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
            if (listServerIp != null && listServerIp.Count > 0)
            {
                var serverCode = listServerIp[0].ServerCode;
                for (int i = 0; i < listServerIp.Count; i++)
                {
                    var ip = listServerIp[i].ChangedValueOfObject;
                    //update and log serverip
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, serverCode, ip,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT,
                        customer);
                }
                //update request status and log
                UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            }
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        public void CancelRequestRentRack(string requestCode, string customer, string taskCode)
        {
            //update request status and log
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RENT_RACK, Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        public void CancelRequestReturnRack(string requestCode, string customer, string taskCode)
        {
            var listRacks = LogBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_RACKOFCUSTOMER);
            if (listRacks != null && listRacks.Count > 0)
            {
                for (int i = 0; i < listRacks.Count; i++)
                {
                    var rack = listRacks[i].ChangedValueOfObject;
                    //update and log rackofCustomer
                    RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, rack,
                        Constants.TypeOfLog.LOG_RETURN_RACK, customer, null,
                        Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT, null);
                }
                //update request status and log
                UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                    Constants.StatusCode.REQUEST_CANCELLED, null, customer, null);
            }
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_CANCEL);
        }

        #endregion

        #region process request detail
        public ProcessRequestExtendedModel GetCommonProcessRequest(string requestCode, string group)
        {
            var request = new ProcessRequestExtendedModel();
            //request info
            request.RequestInfo = GetRequestInfo(requestCode);
            //customer info
            request.CustomerInfo = AccountBLO.Current.GeCustomerInfo(request.RequestInfo.Customer);
            if (group != null)
            {
                //assign task
                request.listStaff = AccountBLO.Current.GetAccountsByGroup(group);
                //ng dang lam request
                //assignee la staff luu trong request, AssigneeName di chung voi assignee
                //assignedStaff la staff dang lam task do, luu trong bang task
                var staff = GetAssignee(requestCode);
                if (staff != null)
                {
                    request.RequestInfo.Assignee = staff.Username;
                    request.RequestInfo.AssigneeName = staff.Fullname;
                }
            }
            return request;
        }

        public ProcessRequestExtendedModel DetailProcessRequestAddServer(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            //lay list servers
            var serverCodes = LogBLO.Current.GetAddingServers(requestCode);
            List<ServerExtendedModel> list = new List<ServerExtendedModel>();
            foreach (var servercode in serverCodes)
            {
                var server = ServerBLO.Current.GetAllServerInfo(servercode);
                list.Add(server);
            }
            request.Servers = list;
            return request;
        }

        public ProcessRequestExtendedModel DetailProcessRequestBringServerAway(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            //main info
            var returnValues = LogBLO.Current.RequestDetailsBringServerAway(requestCode);
            request.ReturnIpNumber = returnValues.ReturnIpNumber;
            request.ReturnLocationNumber = returnValues.ReturnLocationNumber;
            request.SelectedServerNumber = returnValues.ReturnServerNumber;
            request.ServerOfCustomer = returnValues.Servers;
            return request;
        }

        public ProcessRequestExtendedModel DetailProcessRequestAssignIP(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            //Lay so luong IP muon assign
            var reqDetail = JsonConvert.DeserializeObject<RequestDetailViewModel>(request.RequestInfo.Description);
            request.NumberOfIP = reqDetail.NumberOfIp;
            request.RequestInfo.Description = reqDetail.Description;
            //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
            request.SelectedServer = LogBLO.Current.GetServerCodeByRequestCode(requestCode).FirstOrDefault();
            if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
            {
                //Lay list available ip cung vung
                var listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(request.SelectedServer);
                if (listAvailableIps.Count > request.NumberOfIP)
                {
                    //selected values
                    request.randomList = IPAddressPoolBLO.Current.GetRandomIPs(listAvailableIps, request.NumberOfIP);
                    request.listAvailableIps = listAvailableIps;
                }
            }
            if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
            {
                request.IPs = LogBLO.Current.GetChangedValueOfObject(requestCode,
                    Constants.Object.OBJECT_IP, Constants.StatusCode.IP_USED);
            }
            return request;
        }

        public ProcessRequestExtendedModel DetailProcessRequestChangeIP(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            //lay ip muon change
            request.ReturningIPs = LogBLO.Current.GetChangedValueOfObject(requestCode,
                Constants.Object.OBJECT_SERVERIP, Constants.StatusCode.SERVERIP_CHANGING);
            //lay servercode, roi lay ip cua server do, tim nhung ip cung vung con lai
            request.SelectedServer = LogBLO.Current.GetServerCodeByRequestCode(requestCode).FirstOrDefault();
            if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_PROCESSING)
            {
                //Lay list available ip cung vung
                request.listAvailableIps = IPAddressPoolBLO.Current.GetAvailableIpsSameGateway(request.SelectedServer);
            }
            if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
            {
                request.ReturningIPs = LogBLO.Current.GetChangedValueOfObject(requestCode, Constants.Object.OBJECT_IP,
                Constants.StatusCode.IP_AVAILABLE);
                request.NewIPs = LogBLO.Current.GetChangedValueOfObject(requestCode, Constants.Object.OBJECT_IP,
                Constants.StatusCode.IP_USED);
            }
            return request;
        }

        public ProcessRequestExtendedModel DetailProcessRequestReturnIP(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            request.SelectedServer = LogBLO.Current.GetServerCodeByRequestCode(requestCode).FirstOrDefault();
            //List returning IPs
            request.ReturningIPs = LogBLO.Current.GetChangedValueOfObject(requestCode, Constants.Object.OBJECT_SERVERIP,
                Constants.StatusCode.SERVERIP_RETURNING);
            return request;
        }
        public ProcessRequestExtendedModel DetailProcessRequestRentRack(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            var desc = JsonConvert.DeserializeObject<RequestDetailViewModel>(request.RequestInfo.Description);
            request.RackNumbers = desc.NumberOfRack;
            request.RequestInfo.Description = desc.Description;
            //select rack
            if (request.RequestInfo.StatusCode == Constants.StatusCode.REQUEST_DONE)
            {
                request.RentedRacks = LogBLO.Current.GetChangedValueOfObject(requestCode,
                    Constants.Object.OBJECT_RACK, Constants.StatusCode.RACK_RENTED);
            }
            else
            {
                //list cot rows
                var rows = RackBLO.Current.GetAllRowsOfRack();
                request.rows = rows;
                var listRacks = rows.SelectMany(item => RackBLO.Current.GetRackByRow(item)).ToList();
                request.listRackByRows = listRacks;
            }
            return request;
        }

        public ProcessRequestExtendedModel DetailProcessRequestReturnRack(string requestCode, string group)
        {
            var request = GetCommonProcessRequest(requestCode, group);
            //Lay so luong rack muon return
            var listRacks = LogBLO.Current.RequestDetailsReturnRack(requestCode);
            request.SelectedRacks = listRacks.listRacks;
            return request;
        }
        #endregion

        #region accept request

        public void AcceptRequest(string requestCode, string shifthead, string assignee, string typeOfLog)
        {
            //assign
            TaskBLO.Current.AssignTask(requestCode, shifthead, assignee, null);
            UpdateRequestStatusANDLog(requestCode,
                typeOfLog, Constants.StatusCode.REQUEST_PROCESSING, assignee, shifthead, null);
        }
        #endregion

        #region approve request

        public void ApproveRequestAddServer(string requestCode, List<ServerExtendedModel> servers, string assignee,
            string taskCode)
        {
            foreach (var server in servers)
            {
                //update and log server
                ServerBLO.Current.UpdateServerANDLog(requestCode, server.ServerCode,
                    Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_RUNNING, assignee);
            }
            //Add and log request
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                 Constants.StatusCode.REQUEST_DONE, null, assignee, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void ApproveRequestBringServerAway(string requestCode, List<ServerExtendedModel> serverOfCustomers, string assignee,
            string taskCode)
        {
            foreach (var server in serverOfCustomers)
            {
                //update and log serverip
                var serverips = ServerIPBLO.Current.GetIpByStatus(server.ServerCode, Constants.StatusCode.SERVERIP_RETURNING);
                foreach (var ip in serverips)
                {
                    //update and log status cua IP o IPAddresspool
                    IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, server.ServerCode, ip,
                        Constants.StatusCode.IP_AVAILABLE, Constants.TypeOfLog.LOG_RETURN_IP, assignee);
                    // update and log statuscode cua bang serverIP
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, server.ServerCode, ip,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_OLD, assignee);
                }
                //update and log server
                ServerBLO.Current.UpdateServerANDLog(requestCode, server.ServerCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_DEACTIVATE,
                    assignee);
                //add and log request
                UpdateRequestStatusANDLog(requestCode,
                     Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.REQUEST_DONE, null, assignee, null);

                //giai phong location, co can log ko?
                LocationBLO.Current.SetLocationAvailable(server.ServerCode);
            }
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void ApproveRequestAssignIP(string requestCode, List<string> IPs, string assignee,
            string taskCode, string selectedServer)
        {
            foreach (var item in IPs)
            {
                //add and log serverip
                ServerIPBLO.Current.AddServerIpAndLog(requestCode, selectedServer, item,
                    Constants.TypeOfLog.LOG_ASSIGN_IP, Constants.StatusCode.SERVERIP_CURRENT, assignee);
                //update and log ipaddress
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, selectedServer, item,
                    Constants.StatusCode.IP_USED, Constants.TypeOfLog.LOG_ASSIGN_IP, assignee);
            }
            //Add Log and update request status
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                Constants.StatusCode.REQUEST_DONE, null, assignee, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void ApproveRequestChangeIP(string requestCode, List<string> returningIPs, List<string> newIPs, string assignee,
           string taskCode, string selectedServer, string statusCode)
        {
            //update and log ServerIP and IpAddress
            UpdateChangeIP(returningIPs, newIPs, selectedServer, requestCode, statusCode);
            //update and log request
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                Constants.StatusCode.REQUEST_DONE, null, assignee, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void ApproveRequestReturnIP(string requestCode, List<string> returningIPs, string assignee,
           string taskCode, string selectedServer)
        {
            foreach (var item in returningIPs)
            {
                //update and log status cua IP o IPAddresspool
                IPAddressPoolBLO.Current.UpdateStatusIpANDLog(requestCode, selectedServer, item,
                    Constants.StatusCode.IP_AVAILABLE, Constants.TypeOfLog.LOG_RETURN_IP, assignee);
                // update and log statuscode cua bang serverIP
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, selectedServer, item.ToString(),
                    Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_OLD, assignee);
            }
            //Add Log and update request status
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                Constants.StatusCode.REQUEST_DONE, null, assignee, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void ApproveRequestRentRack(string requestCode, List<RackExtendedModel> listRackByRows, string assignee,
           string taskCode, string customer)
        {
            foreach (var item in listRackByRows)
            {
                if (item.Checked)
                {
                    //add and log rackOfCustomer
                    RackOfCustomerBLO.Current.AddRackOfCustomerANDLog(requestCode, item.RackCode,
                        item.RackName, Constants.TypeOfLog.LOG_RENT_RACK, customer, assignee);
                    //update and log Rack
                    RackBLO.Current.UpdateRackANDLog(requestCode, item.RackCode, item.RackName,
                        Constants.TypeOfLog.LOG_RENT_RACK, customer, assignee, Constants.StatusCode.RACK_RENTED);
                }
            }
            //Change request status, task
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                Constants.StatusCode.REQUEST_DONE, null, assignee, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void ApproveRequestReturnRack(string requestCode, List<string> SelectedRacks, string assignee,
          string taskCode, string customer)
        {
            //update status rackofcustomer
            foreach (var item in SelectedRacks)
            {
                var rack = RackBLO.Current.GetByName(new Rack { RackName = item });
                //update and log RackOfCustomer
                RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode, rack.RackCode,
                    Constants.TypeOfLog.LOG_RETURN_RACK, customer, assignee,
                    Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_OLD, item);
                // update and log Rack
                RackBLO.Current.UpdateRackANDLog(requestCode, rack.RackCode, null,
                    Constants.TypeOfLog.LOG_RETURN_RACK, customer, assignee, Constants.StatusCode.RACK_AVAILABLE);
            }
            //add and log request
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                Constants.StatusCode.REQUEST_DONE, null, assignee, null);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }
        #endregion

        #region reject request
        public void RejectRequestAddServer(string requestCode, List<ServerExtendedModel> servers, string assignee,
           string taskCode, string reason)
        {
            var serverCodes = LogBLO.Current.GetServerCodeByRequestCode(requestCode);
            foreach (var server in serverCodes)
            {
                //update and log server
                ServerBLO.Current.UpdateServerANDLog(requestCode, server,
                    Constants.TypeOfLog.LOG_ADD_SERVER, Constants.StatusCode.SERVER_DEACTIVATE, assignee);
                //update lai ip va location neu co
            }
            //Add and log request
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ADD_SERVER,
                Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void RejectRequestBringServerAway(string requestCode, List<ServerExtendedModel> serverOfCustomers, string assignee,
           string taskCode, string reason)
        {
            foreach (var server in serverOfCustomers)
            {
                //update and log serverip
                var serverips = ServerIPBLO.Current.GetIpByStatus(server.ServerCode, Constants.StatusCode.SERVERIP_RETURNING);
                foreach (var ip in serverips)
                {
                    // update and log statuscode cua bang serverIP
                    ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, server.ServerCode, ip,
                        Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT, assignee);
                }
                //update and log server
                ServerBLO.Current.UpdateServerANDLog(requestCode, server.ServerCode,
                    Constants.TypeOfLog.LOG_BRING_SERVER_AWAY, Constants.StatusCode.SERVER_RUNNING,
                    assignee);
                //add and log request
                UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_BRING_SERVER_AWAY,
                    Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);

                //giai phong location, co can log ko?
                LocationBLO.Current.SetLocationAvailable(server.ServerCode);
            }
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void RejectRequestAssignIP(string requestCode, string assignee, string taskCode, string reason)
        {
            //Add Log and update request status
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_ASSIGN_IP,
                Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void RejectRequestChangeIP(string requestCode, List<string> returningIPs, string assignee,
           string taskCode, string selectedServer, string reason)
        {
            foreach (var item in returningIPs)
            {
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, selectedServer, item,
                Constants.TypeOfLog.LOG_CHANGE_IP, Constants.StatusCode.SERVERIP_CURRENT, assignee);
            }
            //update and log request
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_CHANGE_IP,
                 Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void RejectRequestReturnIP(string requestCode, List<string> returningIPs, string assignee,
           string taskCode, string selectedServer, string reason)
        {
            foreach (var item in returningIPs)
            {
                // update and log statuscode cua bang serverIP
                ServerIPBLO.Current.UpdateServerIpANDLog(requestCode, selectedServer, item.ToString(),
                    Constants.TypeOfLog.LOG_RETURN_IP, Constants.StatusCode.SERVERIP_CURRENT, assignee);
            }
            //Add Log and update request status, task
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_IP,
                Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void RejectRequestRentRack(string requestCode, string assignee, string taskCode, string reason)
        {
            //Change request status
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RENT_RACK,
                Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }

        public void RejectRequestReturnRack(string requestCode, string assignee, string taskCode, string customer,
            string reason)
        {
            //Lay so luong rack muon return
            var listRacks = LogBLO.Current.RequestDetailsReturnRack(requestCode);
            foreach (var item in listRacks.listRacks)
            {
                var rack = RackBLO.Current.GetByName(new Rack { RackName = item });
                //update and log rackofCustomer
                RackOfCustomerBLO.Current.UpdateStatusRackOfCustomerANDLog(requestCode,
                    rack.RackCode, Constants.TypeOfLog.LOG_RETURN_RACK, customer, null
                    , Constants.StatusCode.RACKOFCUSTOMER_RETURNING, Constants.StatusCode.RACKOFCUSTOMER_CURRENT, item);
            }
            //add and log request
            UpdateRequestStatusANDLog(requestCode, Constants.TypeOfLog.LOG_RETURN_RACK,
                Constants.StatusCode.REQUEST_REJECTED, null, assignee, reason);
            //update task
            TaskBLO.Current.UpdateTaskStatus(taskCode, Constants.StatusCode.TASK_COMPLETED);
        }
        #endregion

        #region reassign

        public void ReAssignTask(string taskCode, string requestCode, string preAssignedStaff, string newAssignedStaff, string shifthead)
        {
            //cancel task của thang truoc do, neu trang thai task la Waiting
            TaskBLO.Current.CancelWaitingTask(taskCode);
            TaskBLO.Current.AssignTask(requestCode, shifthead, newAssignedStaff, preAssignedStaff);
            UpdateRequestAssignee(requestCode, newAssignedStaff);
        }
        #endregion

        #region export procedure

        public void ExportProcedure(List<ServerExtendedModel> servers, string customer)
        {
            Account acc = AccountDAO.Current.Query(x => x.Username == customer).FirstOrDefault();
            foreach (var item in servers)
            {
                IPAddressPool ip =
                    IPAddressPoolDAO.Current.Query(x => x.IPAddress == item.DefaultIP).FirstOrDefault();
                System.Object oMissing = System.Reflection.Missing.Value;

                System.Object oTemplatePath = "E:/ProcedureOfDatacenter.dotx";

                //MediaTypeNames.Application wordApp = new MediaTypeNames.Application();
                //Document wordDoc = new Document();

                //wordDoc = wordApp.Documents.Add(ref oTemplatePath, ref oMissing, ref oMissing, ref oMissing);

                //foreach (Field myMergeField in wordDoc.Fields)
                //{
                //    Range rngFieldCode = myMergeField.Code;

                //    String fieldText = rngFieldCode.Text;
                //    if (fieldText.StartsWith(" MERGEFIELD"))
                //    {
                //        Int32 endMerge = fieldText.IndexOf("\\");

                //        Int32 fieldNameLength = fieldText.Length - endMerge;

                //        String fieldName = fieldText.Substring(11, endMerge - 11);

                //        fieldName = fieldName.Trim();

                //        if (fieldName == "PartA")
                //        {

                //            myMergeField.Select();

                //            wordApp.Selection.TypeText(acc.Fullname);

                //        }
                //        if (fieldName == "Representative")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(acc.Username);
                //        }
                //        if (fieldName == "Address")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(acc.Address);
                //        }
                //        if (fieldName == "Tel")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(acc.Phone);
                //        }
                //        if (fieldName == "Model")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(item.Model);
                //        }
                //        if (fieldName == "Memory")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(item.Memory);
                //        }
                //        if (fieldName == "PartNumber")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(item.PartNumber);
                //        }
                //        if (fieldName == "SerialNumber")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(item.SerialNumber);
                //        }
                //        if (fieldName == "IPAddress")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(item.DefaultIP);
                //        }
                //        if (fieldName == "SubnetMask")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(ip.Subnetmask);
                //        }
                //        if (fieldName == "Gateway")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(ip.Gateway);
                //        }
                //        if (fieldName == "Bandwidth")
                //        {
                //            myMergeField.Select();
                //            wordApp.Selection.TypeText(item.Bandwidth);
                //        }
                //    }
                //}
                //var name = item.ServerCode + ".doc";
                //wordDoc.SaveAs(name);
                //wordApp.Documents.Open(name);
                //wordApp.Application.Quit();
            }
        }
        #endregion
    }
}
