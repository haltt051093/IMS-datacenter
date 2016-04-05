using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PSSC.Business.Services
{
    interface IGenericService<T> where T:class
    {
        List<T> SelectAll();
        T SelectByID(int? id);
        bool Create(T obj);
        bool Update(T obj);
        bool Delete(int id);
    }
}
