using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.Business.Services;

namespace PSSC.App
{
    public partial class MarblesManagementForm : Form
    {
        UIMainForm UIMainForm = null;

        MarbleManagementFormService formService = new MarbleManagementFormService();
        string orderCodeTemp = string.Empty;

        //Controls
        public MarblesManagementForm()
        {
            InitializeComponent();
        }

        private void frmMarblesManagement_Load(object sender, EventArgs e)
        {
            //Listening Event Fom other form
            foreach (Form item in Application.OpenForms)
            {
                if (item.Name.Equals("UIMainForm"))
                {
                    UIMainForm = (UIMainForm)item;
                    break;
                }
            }
            UIMainForm.SendDataToFormHandler += UIMainForm_SendDataToFormHandler;   

            //Setup service
            formService.Form = this;
            formService.Setup();
      

            //Update data
            formService.CallThread_UpdateDataFormDataBase();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            if (btnClear.Text.Equals("Stop"))
            {
                formService.DisplayButtonText(btnGetMarbles, "Get Marbles");
                formService.DisplayButtonText(btnClear, "Clear");
                formService.SetAllControlsEnable(true);
            }
            formService.ClearSelectedValues();
        }

        private void btnGetMarbles_Click(object sender, EventArgs e)
        {

            if (!formService.ValidateBeforeGettingMarbles()) { return; }
            try
            {
                if(PortConfig._OUTPUT_PORT.IsOpen)
                {
                    if ( btnGetMarbles.Text.Equals("Continue"))
                    {
                        PortConfig._OUTPUT_PORT.WriteLine("1003"); //Send to Machine to continue getting Marbles
                    }
                    else
                    {
                        PortConfig._OUTPUT_PORT.WriteLine("1001"); //Send to Arduino to ask before getting Marbles 
                    }
                }
                return;
            }
            catch
            {

                MessageBox.Show("Please Check Machine Connection!");
                return;
            }        
        }

        bool resetMode = false;
        private void llblResetRepository_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            if(resetMode)//Reset to 0
	        {
		        formService.ResetDatabse(0);
                resetMode = false;
	        }
            else//Reset To Full
            {
                formService.ResetDatabse(9);
                resetMode = true;
            }
            formService.CallThread_UpdateDataFormDataBase();
        }

        private void nudColor_ValueChanged(object sender, EventArgs e)
        {
            NumericUpDown nudColor = null;
            if (sender is NumericUpDown)
            {
                nudColor = sender as NumericUpDown;
                TextBox textbox = null;
                MarbleColor marbleColor = new MarbleColor();

                formService.SelectControlsAndObjects<TextBox>(nudColor.Name, out textbox, out marbleColor);

                //Check marbles in repository
                int selectedValue = Convert.ToInt32(nudColor.Value);
                int quantityInRepository = Convert.ToInt32(textbox.Text);
                if (selectedValue > quantityInRepository)
                {
                    MessageBox.Show("Not enought " + Convert.ToString(marbleColor) + " Marbles in repository!");
                    nudColor.Value = (decimal)quantityInRepository;
                    return;
                }
                else
                {
                    formService.CallThread_AddValueToDataGridView(nudColor);
                }
            }
        }

        private void nudNumberOfPackages_ValueChanged(object sender, EventArgs e)
        {
            //if (nudNumberOfPackages.Value <= 0 && dgvOutputMarbles.Rows.Count > 0)
            //{
            //    nudNumberOfPackages.Value = 1;
            //    return;
            //}
        }

        //Events
        private void UIMainForm_SendDataToFormHandler(string dataReceived)
        {
            //MessageBox.Show(data.ToString());
            if (dataReceived.Equals("2001")) //Test Arduino Connection
            {               
                FormCollection forms = Application.OpenForms;
                bool check = false;
                foreach (Form item in forms)
                {
                    if (item.Name.Equals("CustomerForm"))
                    {
                        check = true;
                        item.Activate();
                        break;
                    }
                }

                if (!check)
                {
                    CustomerForm customerForm = new CustomerForm();
                    customerForm.SendCustomerInfoHandler += customerForm_SendCustomerInfoHandler;
                    customerForm.ShowDialog();
                }
            }
            else if(dataReceived.Equals("2002")) //Arduino sends message: Get Marbles Successful
            {
                try
                {
                    //Check if still have packages need to send.
                    if (PortConfig._OUTPUT_PORT.IsOpen && nudNumberOfPackages.Value > 0)
                    {
                        formService.UpdateDataToRichTextBox(rtbMessage, "Start to send next package...\n");
                        Thread.Sleep(2000);
                        PortConfig._OUTPUT_PORT.WriteLine("1003"); //Send to Arduino to test connection before getting other packages.
                    }
                    return;
                }
                catch
                {

                    MessageBox.Show("Please Check Machine Connection!");
                    return;
                }        
            }
            else if (dataReceived.Equals("2003")) // Arduino sends message: Ready to next packages
            {
                if (this.InvokeRequired)
                {
                    this.Invoke(new MethodInvoker(() => formService.CallThread_GetMarblesOutOfMachine(this.orderCodeTemp)));
                }
                else
                {
                    formService.CallThread_GetMarblesOutOfMachine(this.orderCodeTemp);
                }
            }            
            else if (dataReceived.Equals("2101")) //Arduino sends error message: If this first time, nnput the first box to the conveyor belt
            {
                MessageBox.Show("Please input the box before getting marbles!");
                formService.SetAllControlsEnable(true);
            }
            else if (dataReceived.Equals("2103")) //Arduino sends error message: If this not first time, nnput the other boxs to the conveyor belt
            {
                MessageBox.Show("Please input the box before getting marbles!");
                formService.DisplayButtonText(btnGetMarbles,"Continue");
                formService.DisplayButtonText(btnClear, "Stop");
            }
            else 
            {
                formService.CallThread_UpdateInputMarblesFormMachine(dataReceived);
            }
        }

        private void customerForm_SendCustomerInfoHandler(string OrderCode)
        {
            this.orderCodeTemp = OrderCode;
            if (this.InvokeRequired)
            {
                this.Invoke(new MethodInvoker(() => formService.CallThread_GetMarblesOutOfMachine(OrderCode)));
            }
        }

      
    }
}
