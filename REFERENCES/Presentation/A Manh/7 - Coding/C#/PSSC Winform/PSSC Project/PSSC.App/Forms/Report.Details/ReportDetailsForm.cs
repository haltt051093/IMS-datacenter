using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.Reporting.WinForms;
using PSSC.DataModel.Models;
using PSSC.App.FormModels;

namespace PSSC.App
{
    public partial class ReportDetailsForm : Form
    {
        int orderId = 0;

        public ReportDetailsForm()
        {
            InitializeComponent();
        }

        public ReportDetailsForm(int orderId)
        {
            InitializeComponent();
            this.orderId = orderId;
        }

        private void ReportDetailsForm_Load(object sender, EventArgs e)
        {
            btnClose.Text = "\u00d7";

            PsscDBContext psscDBContext = new PsscDBContext();
            OrderDetailFormModel odfm = new OrderDetailFormModel();
            try
            {
                List<Order> listOrderTemp = new List<Order>()
            {
                psscDBContext.Orders.Where(x => x.OrderId == this.orderId).FirstOrDefault()
            };

                this.reportViewer1.LocalReport.DataSources.Clear();
                this.reportViewer1.LocalReport.ReportEmbeddedResource = "PSSC.App.ReportOrderDetails.rdlc";

                ReportDataSource OrderDetailDS = new ReportDataSource("OrderDetailDS", odfm.GetOrderDetailsByOrderId(this.orderId));
                ReportDataSource OrderDS = new ReportDataSource("OrderDS", listOrderTemp);
                this.reportViewer1.LocalReport.DataSources.Add(OrderDetailDS);
                this.reportViewer1.LocalReport.DataSources.Add(OrderDS);

                this.reportViewer1.LocalReport.Refresh();
                this.reportViewer1.RefreshReport();
            }
            catch {}
        }
        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //Methods - Helper
        //Move winform with no Border
        protected override void WndProc(ref Message m)
        {
            switch (m.Msg)
            {
                case 0x84:
                    base.WndProc(ref m);
                    if ((int)m.Result == 0x1)
                        m.Result = (IntPtr)0x2;
                    return;
            }

            base.WndProc(ref m);
        }

   
    }
}
