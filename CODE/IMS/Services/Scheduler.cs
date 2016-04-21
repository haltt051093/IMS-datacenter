using System;
using System.Linq;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Repository;
using Quartz;
using Quartz.Impl;
using IMS.Data.Models;
using IMS.Data.ViewModels;
using System.Collections.Generic;
using IMS.Controllers;

namespace IMS.Services
{
    public class Scheduler
    {
        public class MasterJob : IJob
        {
            public void Execute(IJobExecutionContext context)
            {
                var scheduler = StdSchedulerFactory.GetDefaultScheduler();
                var list = RequestBLO.Current.GetTodayOfflineRequest();
                if (list != null)
                {
                    foreach (var item in list)
                    {
                        if (!item.AppointmentTime.HasValue)
                        {
                            continue;
                        }
                        var job = JobBuilder.Create<OfflineRequestJob>()
                            .UsingJobData("requestcode", item.RequestCode)
                            .Build();
                        var trigger = TriggerBuilder.Create()
                            .StartNow()
                            .StartAt(new DateTimeOffset(item.AppointmentTime.Value.AddMinutes(-15)))
                            .Build();
                        scheduler.ScheduleJob(job, trigger);
                    }
                }
                {
                    var job = JobBuilder.Create<AssignShiftJob>().Build();
                    var trigger = TriggerBuilder.Create()
                        .StartNow()
                        .StartAt(new DateTimeOffset(DateTime.Now.AddMinutes(15)))
                        .Build();
                    scheduler.ScheduleJob(job, trigger);
                }
            }
        }

        public class OfflineRequestJob : IJob
        {
            public void Execute(IJobExecutionContext context)
            {
                //Add log
                Log logSchedule = new Log
                {
                    Object = Constants.Object.OBJECT_SCHEDULE,
                    ChangedValueOfObject = "Check offline request.",
                    LogTime = DateTime.Now
                };

                var dataMap = context.JobDetail.JobDataMap;
                var requestCode = dataMap.GetString("requestcode");
                var request = RequestBLO.Current.GetByKeys(new Request { RequestCode = requestCode });
                //notification
                var result = new NotificationResultModel();
                var activeGroupCode = AssignedShiftBLO.Current.GetActiveGroup();
                var activeStaff = AccountBLO.Current.GetAccountsByGroup(activeGroupCode)
                    .Where(x => x.Role == Constants.Role.SHIFT_HEAD)
                    .ToList();
                var desc = "Customer will come at " + request.AppointmentTime;
                foreach (var shiftHead in activeStaff)
                {
                    var notifCode = NotificationBLO.Current.AddNotification(requestCode, Constants.Object.OBJECT_REQUEST, shiftHead.Username, desc);
                    result.NotificationCodes.Add(notifCode);
                }
                //DOING
                Notify(result.NotificationCodes);
            }
        }

        public static void Notify(IEnumerable<string> notificationCodes)
        {
            foreach (var notiCode in notificationCodes)
            {
                var noti = NotificationBLO.Current.GetByKeys(new Notification { NotificationCode = notiCode });
                if (noti == null)
                {
                    continue;
                }
                RemoteControllerHub.Current.Clients.User(noti.Username).Notify(noti);
            }
        }

        public class AssignShiftJob : IJob
        {
            public void Execute(IJobExecutionContext context)
            {
                //Add log
                Log logSchedule = new Log
                {
                    Object = Constants.Object.OBJECT_SCHEDULE,
                    ChangedValueOfObject = "Generate assigned shift",
                    LogTime = DateTime.Now
                };
                LogBLO.Current.Add(logSchedule);
                //lay ngay cuoi trong assigndate tru cho ngay hien tai. neu con 3 ngay thi genarate tiep thang sau, cong 1, cong 30 de ra end date
                DateTime today = DateTime.Now.Date;
                var lastAssign = AssignedShiftDAO.Current.Table.OrderByDescending(x => x.StartedTime).FirstOrDefault();
                var lastDate = DateTime.Now.Date.AddDays(-1);
                if (lastAssign != null && lastAssign.StartedTime.HasValue)
                {
                    lastDate = lastAssign.StartedTime.Value.Date;
                }
                else if (!string.IsNullOrEmpty(CsConfiguration.GetConfiguration("lastDate")))
                {
                    lastDate = CsConfiguration.GetDateTime("lastDate", today);
                }

                var lastGroup = Constants.GroupName.GROUP_1;
                if (lastAssign != null && lastAssign.GroupCode != null)
                {
                    lastGroup = lastAssign.GroupCode;
                }
                else if (!string.IsNullOrEmpty(CsConfiguration.GetConfiguration("lastGroup")))
                {
                    lastGroup = CsConfiguration.GetConfiguration("lastGroup");
                }

                //var  = AssignedShiftDAO.Current.Table().OrderByDescending(x => x.Date).Select(x => x.GroupCode).FirstOrDefault();
                if ((lastDate - today).Days < 3)
                {
                    //them 28 ngay, start group luon la group 1
                    ShiftBLO.Current.GenerateShift(lastDate.AddDays(1), lastDate.AddDays(28), lastGroup);
                }
            }
        }

        public class RemindJob : IJob
        {
            public void Execute(IJobExecutionContext context)
            {
                //Add log
                Log logSchedule = new Log
                {
                    Object = Constants.Object.OBJECT_SCHEDULE,
                    ChangedValueOfObject = "Notify unfinished task.",
                    LogTime = DateTime.Now
                };
                LogBLO.Current.Add(logSchedule);
                var result = TaskBLO.Current.CheckEndOfShiftTasks();
                foreach (var notiCode in result.NotificationCodes)
                {
                    var noti = NotificationBLO.Current.GetByKeys(new Notification { NotificationCode = notiCode });
                    if (noti == null)
                    {
                        continue;
                    }
                    RemoteControllerHub.Current.Clients.User(noti.Username).Notify(noti);
                }
            }
        }

        public class JobScheduler
        {
            public static void Start()
            {
                var scheduler = StdSchedulerFactory.GetDefaultScheduler();
                scheduler.Start();
                {
                    var job = JobBuilder.Create<MasterJob>().Build();
                    var trigger = TriggerBuilder.Create()
                        .StartNow()
                        .WithDailyTimeIntervalSchedule(s =>
                            s.WithIntervalInHours(24)
                            .OnEveryDay()
                            .StartingDailyAt(TimeOfDay.HourAndMinuteOfDay(0, 0)))
                        .Build();
                    scheduler.ScheduleJob(job, trigger);
                }
                {
                    var job = JobBuilder.Create<RemindJob>().Build();
                    var trigger = TriggerBuilder.Create()
                        .WithDailyTimeIntervalSchedule(x =>
                            x.OnEveryDay()
                                .WithIntervalInHours(8)
                                .StartingDailyAt(TimeOfDay.HourAndMinuteOfDay(5, 30)))
                        .Build();
                    scheduler.ScheduleJob(job, trigger);
                }

                var testJob = new MasterJob();
                testJob.Execute(null);
                var assignJob = new AssignShiftJob();
                assignJob.Execute(null);
            }
        }

        //public void Notify(IEnumerable<string> notificationCodes)
        //{
        //    foreach (var notiCode in notificationCodes)
        //    {
        //        var noti = NotificationBLO.Current.GetByKeys(new Notification { NotificationCode = notiCode });
        //        if (noti == null)
        //        {
        //            continue;
        //        }
        //        RemoteControllerHub.Current.Clients.User(noti.Username).Notify(noti);
        //    }
        //}
    }
}