using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace PSSC.VirtualMachine.XDatabase
{
    public interface IDBSeeder
    {
        XDocument GetXDocument();
    }
}
