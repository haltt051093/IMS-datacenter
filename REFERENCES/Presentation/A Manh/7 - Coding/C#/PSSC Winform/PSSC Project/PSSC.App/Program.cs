using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.App
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Database.SetInitializer(new DropCreateDatabaseIfModelChanges<PSSC.DataModel.Models.PsscDBContext>());
            Database.SetInitializer(new PSSC.DataModel.Models.PsscDBContextSeeder());
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            //Application.Run(new CustomerForm());
            //Application.Run(new ReportForm());
            Application.Run(new UIMainForm());

        }
    }
}
