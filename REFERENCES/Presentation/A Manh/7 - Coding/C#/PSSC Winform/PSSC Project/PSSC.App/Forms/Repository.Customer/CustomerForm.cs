using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using PSSC.XCommon;

namespace PSSC.App
{
    public partial class CustomerForm : Form
    {
        CustomerFormService formService = new CustomerFormService();
        
        //Delegate and Event
        public delegate void SendCustomerInfoDelegate(string OrderCode);

        public event SendCustomerInfoDelegate SendCustomerInfoHandler;

        //Control
        public CustomerForm()
        {
            InitializeComponent();
        }
  
        private void CustomerForm_Load(object sender, EventArgs e)
        {
            btnClose.Text = "\u00d7";

            //Setup service
            formService.Form = this;
            formService.Setup();
            formService.HasOrderCodeHandler += formService_HasOrderCodeHandler;
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            bool success = formService.Validation();
            if (success)
            {
                formService.CallThread_CreateOrder();
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void lblGenerateProfile_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            formService.CallThread_GeneratePersonProfile();
        }

        //Events
        private void formService_HasOrderCodeHandler(string OrderCode)
        {
            if (!string.IsNullOrEmpty(OrderCode))
            {
                if (SendCustomerInfoHandler != null)
                {
                    SendCustomerInfoHandler.Invoke(OrderCode);
                }
            }
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
