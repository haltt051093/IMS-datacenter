using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.XCommon;
using PSSC.VirtualMachine.DataModel;
using PSSC.VirtualMachine.DataAccess;

namespace PSSC.VirtualMachine.Business
{
    public class MarbleService
    {
        MarbleRepository repository = null;

        public MarbleService()
        {
            this.repository = new MarbleRepository();
        }

        public MarbleService(MarbleRepository repository)
        {
            this.repository = repository;
        }

        public int GetQuantityLimits ()
        {
            return repository.QuantityLimits;
        }

        public List<Marble> ToList()
        {
            return repository.ToList();
        }

        public Marble SelectByColor(MarbleColor color)
        {
            return repository.SelectByColor(color);
        }

        public bool Add(Marble obj)
        {
            try
            {
                repository.Add(obj);
                repository.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(Marble obj)
        {
            try
            {
                repository.Update(obj);
                repository.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Remove(Marble obj)
        {
            try
            {
                repository.Remove(obj);
                repository.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }
     
    }
}
