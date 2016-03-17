using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Data.Business;
using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.ViewModels;

namespace IMS.Data.Repository
{
    public class TaskDAO : BaseDAO<Task>
    {
        public static TaskDAO instance;

        public static TaskDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new TaskDAO();
                }
                return instance;
            }
        }

        public override Task GetByKeys(Task entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }

        public void AssignTask(string requestCode, string shifthead, string staff)
        {
            var task = new Task()
            {
                RequestCode = requestCode,
                ShiftHead = shifthead,
                AssignedStaff = staff,
                StatusCode = Constants.StatusCode.TASK_ACCEPTING,
                AssignedTime = DateTime.Now,
            };
            Add(task);
        }

        public List<TaskExtendedModel> ListTaskOfStaff(string staff)
        {
            var tasks = from t in Table()
                        join s in StatusDAO.Current.Table()
                            on t.StatusCode equals s.StatusCode into st
                        from subst in st.DefaultIfEmpty()
                        join rt in RequestDAO.Current.Table()
                            on t.RequestCode equals rt.RequestCode into rtt
                        from subrtt in rtt.DefaultIfEmpty()
                        where t.AssignedStaff == staff
                        select new TaskExtendedModel()
                        {
                            StaffName = subst.StatusName,
                            RequestCode = t.RequestCode,
                            RequestTypeCode = subrtt.RequestType,
                            ShiftHead = t.ShiftHead,
                            AssignedTime = t.AssignedTime
                        };
            if (tasks != null)
            {
                foreach (var task in tasks.ToList())
                {
                    //shifthead name
                    var shifthead = task.ShiftHead;
                    var shiftheadName = AccountBLO.Current.GetAccountByCode(shifthead).Fullname;
                    task.ShiftHeadName = shiftheadName;
                    //staff name
                    var staffName = AccountBLO.Current.GetAccountByCode(staff).Fullname;
                    task.StaffName = staffName;
                    //requesttype name
                    task.RequestTypeName = RequestTypeBLO.Current.GetTypeName(task.RequestTypeCode);
                }
            }
            return tasks.ToList();
        }
    }
}
