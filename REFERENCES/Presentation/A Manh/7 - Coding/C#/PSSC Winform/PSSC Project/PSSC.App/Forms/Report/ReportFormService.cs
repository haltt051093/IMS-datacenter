using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.Business.Services;
using System.Windows.Forms;
using System.Drawing;

namespace PSSC.App
{
    public class ReportFormService: FormService
    {
        //Service
        OrderService orderService = new OrderService();
        OrderDetailService orderDetaiService = new OrderDetailService();
        DgvReportHelper dgvHelper = new DgvReportHelper();

        //Controls
        Button btnFirstPage;
        Button btnPreviousPage;
        Button btnNextPage;
        Button btnLastPage;
        DataGridView dgvReport;
        TextBox txtCurrentPage;

        //Contructor
        public override void Setup()
        {
            //Setup Controls
            btnFirstPage = GetControl<Button>("btnFirstPage");
            btnPreviousPage = GetControl<Button>("btnPreviousPage");
            btnNextPage = GetControl<Button>("btnNextPage");
            btnLastPage = GetControl<Button>("btnLastPage");
            dgvReport = GetControl<DataGridView>("dgvReport");
            txtCurrentPage = GetControl<TextBox>("txtCurrentPage");

            //Setup Controls - Initialize DataGirdView
            dgvHelper.dataGridView = dgvReport;
            dgvHelper.Setup();

            //Setup Data
        }

        //Methods - Business
        public int GetNumberOfPages()
        {
            return dgvHelper.NumberOfPages;
        }

        public void SetCurrentPage(int currentPage)
        {
            dgvHelper.CurrentPage = currentPage;
        }

        public void SetSearchString(string searchString)
        {
            dgvHelper.SearchString = searchString;
        }

        //Methods - Call Thread
        /*---*/
        public void CallThread_UpdateDataFormDataBase()
        {
            this.CallThreadToDoTask(new ThreadStart(this.UpdateDataFormDataBase));
        }

        private void UpdateDataFormDataBase()
        {
            if(dgvReport.InvokeRequired)
            {
                dgvReport.Invoke(new MethodInvoker(delegate()
                                {
                                    dgvHelper.LoadData(orderService.SelectAll().OrderByDescending(x => x.OrderDate).ToList());
                                }));
            }
            this.UpdateDataToTextbox(txtCurrentPage, Convert.ToString(dgvHelper.CurrentPage));

            //Set controls button of dgvReport
            this.SetControlEnable(btnFirstPage, true);
            this.SetControlEnable(btnPreviousPage, true);
            this.SetControlEnable(btnNextPage, true);
            this.SetControlEnable(btnLastPage, true);

            if (dgvHelper.CurrentPage == 1)
            {
                this.SetControlEnable(btnFirstPage, false);
                this.SetControlEnable(btnPreviousPage, false);
            }
            else if (dgvHelper.CurrentPage == dgvHelper.NumberOfPages)
            {
                this.SetControlEnable(btnNextPage, false);
                this.SetControlEnable(btnLastPage, false);
            }
        }

        //Methods - Override - Helpers
        public override bool SelectControlsAndObjects<T>(string data, out T obj, out MarbleColor marbleColor)
        {
            throw new NotImplementedException();
        }

        public override bool UpdateDataToRichTextBox(System.Windows.Forms.RichTextBox rtbObj, string content, MarbleColor marbleColor)
        {
            throw new NotImplementedException();
        }

        //Methods - Helpers

    }
}
