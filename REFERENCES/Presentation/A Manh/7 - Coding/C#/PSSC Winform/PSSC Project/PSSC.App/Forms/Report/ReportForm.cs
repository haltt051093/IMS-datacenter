using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.App
{
    public partial class ReportForm : Form
    {
        ReportFormService formService = new ReportFormService();
        int currentPage = 0;
        int orderId = -1;

        public ReportForm()
        {
            
            InitializeComponent();
        }

        private void ReportForm_Load(object sender, EventArgs e)
        {
            btnFirstPage.Text = "\u25C0\u25C0";
            btnPreviousPage.Text = "\u25C0";
            btnNextPage.Text = "\u25B6";
            btnLastPage.Text = "\u25B6\u25B6";

            //Setup service
            formService.Form = this;
            formService.Setup();

            //Update data
            formService.CallThread_UpdateDataFormDataBase();
        }

        private void btnFirstPage_Click(object sender, EventArgs e)
        {
            this.currentPage = 1;
            formService.SetCurrentPage(this.currentPage);
            formService.CallThread_UpdateDataFormDataBase();

        }

        private void btnPreviousPage_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtCurrentPage.Text, out currentPage))
            {
                this.currentPage--;
                formService.SetCurrentPage(this.currentPage);
                formService.CallThread_UpdateDataFormDataBase();
            }
        }

        private void btnNextPage_Click(object sender, EventArgs e)
        {
            if(int.TryParse(txtCurrentPage.Text, out currentPage))
            {
                this.currentPage++;
                formService.SetCurrentPage(this.currentPage);
                formService.CallThread_UpdateDataFormDataBase();
            }
        }

        private void btnLastPage_Click(object sender, EventArgs e)
        {
            this.currentPage = formService.GetNumberOfPages();
            formService.SetCurrentPage(this.currentPage);
            formService.CallThread_UpdateDataFormDataBase();
        }

        private void llblViewDetails_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if(orderId == -1)
            {
                MessageBox.Show("Please select customer to view details!");
                return;
            }
            try
            {
                FormCollection forms = Application.OpenForms;
                bool check = false;
                foreach (Form item in forms)
                {
                    if (item.Name.Equals("ReportDetailsForm"))
                    {
                        check = true;
                        item.Activate();
                        break;
                    }
                }

                if (!check)
                {
                    ReportDetailsForm reportDetailsForm = new ReportDetailsForm(this.orderId);
                    reportDetailsForm.ShowDialog();
                }
            }
            catch
            {
                return;
            }
        }

        private void txtSearch_KeyUp(object sender, KeyEventArgs e)
        {
            try
            {
                string stringSearch = Convert.ToString(txtSearch.Text);
                stringSearch = stringSearch.Replace("\r\n", string.Empty).Trim();
                formService.SetSearchString(stringSearch);
                formService.CallThread_UpdateDataFormDataBase();

            }
            catch
            {
                return;
            }
        }

        private void dgvReport_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                int index = dgvReport.CurrentRow.Index;
                if(dgvReport.Rows[index].Selected && int.TryParse(dgvReport.Rows[index].Cells[0].Value.ToString(), out this.orderId))
                {                   
                    lblOrderId.Text = dgvReport.Rows[index].Cells[0].Value.ToString();
                    txtName.Text = dgvReport.Rows[index].Cells[1].Value.ToString();
                    txtEmail.Text = dgvReport.Rows[index].Cells[2].Value.ToString(); 
                    txtPhone.Text = dgvReport.Rows[index].Cells[3].Value.ToString();
                    lblOrderDate.Text = dgvReport.Rows[index].Cells[4].Value.ToString();
                    lblTotal.Text = dgvReport.Rows[index].Cells[5].Value.ToString();
                    llblViewDetails.Visible = true;                  
                }
                else
                {
                    llblViewDetails.Visible = false;
                }
            }
            catch
            {
                return;
            }
        }
      
    }
}
