using System.Collections.Generic;
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

        public void AssignTask(string requestCode, string shifthead, string staff)
        {
            dao.AssignTask(requestCode, shifthead, staff);
        }

        public List<TaskExtendedModel> ListTaskOfStaff(string staff)
        {
            return dao.ListTaskOfStaff(staff);
        }

        public void UpdateTaskStatus(string requestCode, string statusCode)
        {
            dao.UpdateTaskStatus(requestCode, statusCode);
        }
    }
}
