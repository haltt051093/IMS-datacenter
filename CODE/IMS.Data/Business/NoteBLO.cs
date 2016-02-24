using IMS.Data.Generic;
using IMS.Data.Models;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class NoteBLO : BaseBLO<Note>
    {
        protected NoteDAO dao;
        private static NoteBLO instance;

        public static NoteBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new NoteBLO();
                }
                return instance;
            }
        }


        private NoteBLO()
        {
            baseDao = NoteDAO.Current;
            dao = NoteDAO.Current;
        }
    }
}
