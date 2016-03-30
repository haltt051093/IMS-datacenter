using System;
using System.Linq;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Repository;
using Quartz;
using Quartz.Impl;
using IMS.Data.Models;

namespace IMS.Services
{
    public class Scheduler
    {
        public class TestJob : IJob
        {
            public void Execute(IJobExecutionContext context)
            {
                //lay ngay cuoi trong assigndate tru cho ngay hien tai. neu con 3 ngay thi genarate tiep thang sau, cong 1, cong 30 de ra end date
                DateTime today = DateTime.Now;
                var lastAssign = AssignedShiftDAO.Current.Table.OrderByDescending(x => x.StartedTime).FirstOrDefault();
                var lastDate = ((lastAssign == null || !lastAssign.StartedTime.HasValue) ? DateTime.Now.Date.AddDays(-1) : lastAssign.StartedTime.Value);
                //var lastGroup = AssignedShiftDAO.Current.Table().OrderByDescending(x => x.Date).Select(x => x.GroupCode).FirstOrDefault();
                if ((lastDate - today).Days < 3)
                {
                    //them 28 ngay, start group luon la group 1
                    ShiftBLO.Current.GenerateShift(lastDate.AddDays(1), lastDate.AddDays(28), Constants.GroupName.GROUP_1);
                }
            }
        }

        public class RemindJob : IJob
        {
            public void Execute(IJobExecutionContext context)
            {
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
                {
                    var job = JobBuilder.Create<TestJob>().Build();
                    var trigger = TriggerBuilder.Create()
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
                scheduler.Start();
            }
        }
    }
}