using System;
using System.Collections.Generic;
using System.Linq;
using IMS.Core;
using IMS.Core.Express;
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

        public void AssignTask(string requestCode, string shifthead, string staff, string preStaff)
        {
            var taskCode = GenerateCode(); ;

            var task = new Task()
            {
                TaskCode = taskCode,
                RequestCode = requestCode,
                ShiftHead = shifthead,
                AssignedStaff = staff,
                StatusCode = Constants.StatusCode.TASK_ACCEPTING,
                AssignedTime = DateTime.Now,
                PreAssignedStaff = preStaff
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
                            StatusName = subst.StatusName,
                            RequestCode = t.RequestCode,
                            RequestTypeCode = subrtt.RequestType,
                            ShiftHead = t.ShiftHead,
                            AssignedTime = t.AssignedTime,
                            StatusCode = subst.StatusCode,
                            TaskCode = t.TaskCode
                        };

            var list = new List<TaskExtendedModel>();
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
                    list.Add(task);
                }
            }
            return list.ToList();
        }

        public void UpdateTaskStatus(string taskCode, string statusCode)
        {
            var query = (from t in Table()
                         where t.TaskCode == taskCode
                         select t).FirstOrDefault();
            if (query != null)
            {
                query.StatusCode = statusCode;
                Update(query);
            }
        }

        public string GenerateCode()
        {
            var code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = Query(x => x.RequestCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "T" + TextExpress.Randomize(9, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = Query(x => x.RequestCode == code).FirstOrDefault();
            }
            return code;
        }
    }
}
