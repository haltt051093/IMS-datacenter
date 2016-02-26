using System.Linq;
using IMS.Core.Express;
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

        //Tien
        public string GenerateCode()
        {
            var code = "N" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
            var existing = dao.Query(x => x.NoteCode == code).FirstOrDefault();
            while (existing != null)
            {
                code = "N" + TextExpress.Randomize(6, TextExpress.NUMBER + TextExpress.NUMBER);
                existing = dao.Query(x => x.NoteCode == code).FirstOrDefault();
            }
            return code;
        }

    }
}
