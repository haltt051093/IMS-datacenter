using System;
using System.Linq;
using System.Collections.Generic;
using IMS.Core;
using IMS.Core.Express;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;
using IMS.Data.ViewModels;

namespace IMS.Data.Business
{
    public class TaskBLO : BaseBLO<Task>
    {
        protected TaskDAO dao;
        private static TaskBLO instance;

        public static TaskBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new TaskBLO();
                }
                return instance;
            }
        }


        private TaskBLO()
        {
            baseDao = TaskDAO.Current;
            dao = TaskDAO.Current;
        }

        public void AssignTask(string requestCode, string shifthead, string staff, string preStaff)
        {
            var taskCode = GenerateCode();
            if (shifthead == staff)
            {
                var task = new Task()
                {
                    TaskCode = taskCode,
                    RequestCode = requestCode,
                    ShiftHead = shifthead,
                    AssignedStaff = staff,
                    StatusCode = Constants.StatusCode.TASK_DOING,
                    AssignedTime = DateTime.Now,
                    PreAssignedStaff = preStaff
                };
                dao.Add(task);
            }
            else
            {
                var task = new Task()
                {
                    TaskCode = taskCode,
                    RequestCode = requestCode,
                    ShiftHead = shifthead,
                    AssignedStaff = staff,
                    StatusCode = Constants.StatusCode.TASK_WAITING,
                    AssignedTime = DateTime.Now,
                    PreAssignedStaff = preStaff
                };
                dao.Add(task);
            }
        }

        public List<TaskExtendedModel> ListTaskOfStaff(string staff)
        {
            return dao.ListTaskOfStaff(staff);
        }

        public void UpdateTaskStatus(string taskCode, string statusCode)
        {
            var existing = dao.GetByKeys(new Task { TaskCode = taskCode });
            if (existing != null)
            {
                existing.StatusCode = statusCode;
                dao.Update(existing);
            }
        }

        public string GenerateCode()
        {
            var code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.RequestCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.RequestCode == code).FirstOrDefault();
            }
            return code;
        }

        public void CancelWaitingTask(string taskCode)
        {
            dao.CancelWaitingTask(taskCode);
        }

        public NotificationResultModel CheckEndOfShiftTasks()
        {
            var result = new NotificationResultModel();

            var activeGroupCode = AssignedShiftBLO.Current.GetActiveGroup();
            if (string.IsNullOrEmpty(activeGroupCode))
            {
                return result;
            }

            var activeStaffs = AccountBLO.Current.GetAccountsByGroup(activeGroupCode)
                .Where(x => x.Role == Constants.Role.STAFF)
                .Select(x => x.Username)
                .ToList();

            var pendingTasks = dao.Query(x => activeStaffs.Contains(x.AssignedStaff)
                    && (x.StatusCode == Constants.StatusCode.TASK_DOING || x.StatusCode == Constants.StatusCode.TASK_NOTFINISH));
            var staffPendingTasks = pendingTasks.GroupBy(x => x.AssignedStaff)
                .ToList();

            foreach (var staffPendingTask in staffPendingTasks)
            {
                var message = string.Format("You have {0} taks need to be completed before your shift ends", staffPendingTask.Count());
                var notifCode = NotificationBLO.Current.AddNotification(string.Empty, Constants.Object.OBJECT_TASK_LIST, staffPendingTask.Key, message);
                result.NotificationCodes.Add(notifCode);
            }

            return result;
        }
    }
}
