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
            var existing = Query(x => x.Id == entry.Id).FirstOrDefault();
            if (existing == null)
            {
                existing = Query(x => x.TaskCode == entry.TaskCode).FirstOrDefault();
            }
            return existing;
        }

        public List<TaskExtendedModel> ListTaskOfStaff(string staff)
        {
            var tasksQuery = from t in Table()
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

            var tasks = tasksQuery.ToList();
            foreach (var task in tasks)
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
            return tasks;
        }

        public void CancelWaitingTask(string requestCode, string staff)
        {
            var query = from t in Table()
                        where t.RequestCode == requestCode && t.AssignedStaff == staff
                              && t.StatusCode == Constants.StatusCode.TASK_WAITING
                        select t;
            if (query != null)
            {
                var task = query.FirstOrDefault();
                task.StatusCode = Constants.StatusCode.TASK_CANCEL;
                Update(task);
            }
        }
    }
}
