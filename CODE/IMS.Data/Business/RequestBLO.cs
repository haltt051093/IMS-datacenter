using System;
using System.Collections.Generic;
using System.Linq;
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
        //    LogChangedContentBLO.Current.Add(logLocation);
        //}

        public string AddRequestAssignIP(string customer, string description, string serverCode)
        {
            //request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.ASSIGN_IP,
                    Constants.StatusCode.REQUEST_PENDING, customer, description,
                    null, serverCode, Constants.TypeOfLog.LOG_ASSIGN_IP, null);
            //luu notification
            NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.ASSIGN_IP, customer, description);
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
            NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.CHANGE_IP, customer, description);
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
            NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.RETURN_IP, customer, description);
            return requestCode;
        }

        public string AddRequestRentRack(string customer, string description)
        {
            //add request
            var requestCode = AddRequestANDLog(Constants.RequestTypeCode.RENT_RACK,
                Constants.StatusCode.REQUEST_PENDING, customer, description,
                null, null, Constants.TypeOfLog.LOG_RENT_RACK, null);
            //luu notification
            NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.RENT_RACK, customer, description);
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
            NotificationBLO.Current.AddNotification(requestCode, Constants.RequestTypeCode.RENT_RACK, customer, description);
            return requestCode;
        }
        #endregion

        #region cancel request

        public void CancelRequestAddServer(string requestCode, string customer, string taskCode)
        {
            var serverCodes = LogChangedContentBLO.Current.GetAddingServers(requestCode);
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
            var listServerIp = LogChangedContentBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
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
            var servers = (from l in LogChangedContentDAO.Current.Table
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
            var listServerIp = LogChangedContentBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
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
            var listServerIp = LogChangedContentBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_SERVERIP);
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
            var listRacks = LogChangedContentBLO.Current.GetLogInfoByRequestCode(requestCode, Constants.Object.OBJECT_RACKOFCUSTOMER);
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

        
        

    }
}
