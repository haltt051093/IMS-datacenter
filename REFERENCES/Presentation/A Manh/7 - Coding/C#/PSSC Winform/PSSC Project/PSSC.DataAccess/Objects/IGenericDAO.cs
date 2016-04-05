using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PSSC.DataAccess.Objects
{
    public interface IGenericDAO<T> where T:class
    {
        IEnumerable<T> SelectAll();
        T SelectByID(int id);
        void Create(T obj);
        void Update(T obj);
        void Delete(int id);
        void Save();
    }
}
