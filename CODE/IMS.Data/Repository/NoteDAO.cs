using System.Linq;
using IMS.Data.Generic;
using IMS.Data.Models;

namespace IMS.Data.Repository
{
    public class NoteDAO : BaseDAO<Note>
    {
        public static NoteDAO instance;

        public static NoteDAO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new NoteDAO();
                }
                return instance;
            }
        }

        public override Note GetByKeys(Note entry)
        {
            return Query(x => x.Id == entry.Id).FirstOrDefault();
        }
    }
}
