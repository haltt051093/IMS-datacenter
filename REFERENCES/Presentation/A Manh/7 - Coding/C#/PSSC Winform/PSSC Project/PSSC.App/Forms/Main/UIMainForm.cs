using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using PSSC.DataModel.Models;

namespace PSSC.App
{
    public partial class UIMainForm : Form
    {
        //Form object
        MarblesManagementForm frmMablesManagement = null;
        HistoryForm frmHistory = null;
        ReportForm frmReport = null;

        //Delegate and Event
        public delegate void SendDataToFormDelegate(string data);

        public event SendDataToFormDelegate SendDataToFormHandler;

        //Control
        public UIMainForm()
        {
            InitializeComponent();
        }

        private void frmUIMain_Load(object sender, EventArgs e)
        {
            btnMinimize.Text = "\u2013";
            btnClose.Text = "\u00d7";

            PsscDBContext psscDBContext = new PsscDBContext();
            List<Marble> list = psscDBContext.Marbles.ToList();

            //Auto config port
            PortConfig.AutoConfig(PortConfig._INPUT_PORT, PortConfig._INPUT_PORT_NAME);
            PortConfig.AutoConfig(PortConfig._OUTPUT_PORT, PortConfig._OUTPUT_PORT_NAME);
            PortConfig._INPUT_PORT.DataReceived += _INPUT_PORT_DataReceived;
            PortConfig._OUTPUT_PORT.DataReceived +=_OUTPUT_PORT_DataReceived;

            //Initialize Forms
            this.InitializeForms();

            //Check Connection every 10s
            this.CallThread_CheckConnection();

            //Open Default Form
            this.SetFormShow(frmMablesManagement);

        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnMinimize_Click(object sender, EventArgs e)
        {
            this.WindowState = FormWindowState.Minimized;
        }

        private void btnRepository_Click(object sender, EventArgs e)
        {
            SetFormShow(frmMablesManagement);
        }

        private void btnHistory_Click(object sender, EventArgs e)
        {
            SetFormShow(frmHistory);
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            SetFormShow(frmReport);
        }

        private void btnPortConfig_Click(object sender, EventArgs e)
        {
            FormCollection forms = Application.OpenForms;
            bool check = false;
            foreach (Form item in forms)
            {
                if (item.Name.Equals("PortSettingForm"))
                {
                    check = true;
                    item.Activate();
                    break;
                }
            }

            if (!check)
            {
                PortSettingForm form = new PortSettingForm();
                form.ShowDialog();
            }
        }

        //Event
        private void _INPUT_PORT_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string dataReceived = "";
            if (PortConfig._INPUT_PORT.IsOpen)
            {
                dataReceived = PortConfig._INPUT_PORT.ReadLine();
                //Machine asks Software is ready or not
                if (dataReceived.Equals("VirtualMachineHasNewMarble!!!")) 
                {

                    //Send To Machine to confirm that Software is ready to update input marbles
                    PortConfig._OUTPUT_PORT.WriteLine("VirtulaMachine,SendItToMe!!!"); 
                    return;
                }
                int temp = -1;
                if (int.TryParse(dataReceived, out temp))
                {
                    this.CallTheard_ProcessDataReceiverd(temp.ToString());
                }
            }
        }

        private void _OUTPUT_PORT_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string dataReceived = "";
            if (PortConfig._OUTPUT_PORT.IsOpen)
            {
                dataReceived = PortConfig._OUTPUT_PORT.ReadLine();
                int temp = -1;
                if (int.TryParse(dataReceived, out temp))
                {
                    this.CallTheard_ProcessDataReceiverd(temp.ToString());
                }
            }
        }

        //Methods - Call Thread
        /*---*/
        private void CallTheard_ProcessDataReceiverd(string dataReceived)
        {
            Thread thread = new Thread(new ParameterizedThreadStart(ProcessDataReceived));
            thread.IsBackground = true;
            thread.Start(dataReceived);
        }

        private void ProcessDataReceived(object obj)
        {
            string dataReceived = (string)obj;
            if (!string.IsNullOrEmpty(dataReceived))
            {
                if (SendDataToFormHandler != null)
                {
                    SendDataToFormHandler.Invoke(dataReceived);
                }
            }
        }

        /*---*/
        private void CallThread_CheckConnection()
        {
            Thread thread = new Thread(new ThreadStart(CheckConnection));
            thread.IsBackground = true;
            thread.Start();
        }

        private void CheckConnection()
        {
            while (true)
            {
                string temp = "InputPort: Connection Successful";
                if (!PortConfig._INPUT_PORT.IsOpen || !PortConfig._OUTPUT_PORT.IsOpen)
                {
                    temp = "InputPort: Connection Failed!";
                }

                if (lblStatus_Connection.InvokeRequired)
                {
                    lblStatus_Connection.Invoke(new MethodInvoker(() => lblStatus_Connection.Text = temp));
                }
                Thread.Sleep(10000);
            }
        }

        //Methods - Helper
        private void InitializeForms()
        {
            frmMablesManagement = new MarblesManagementForm();
            frmHistory = new HistoryForm();
            frmReport = new ReportForm();
        }

        private void SetFormShow(Form form)
        {
            bool isActive = false;
            //Check Form is Open
            foreach (Form item in Application.OpenForms)
            {
                //Exclude Main Form   
                if (!item.Name.Equals(this.Name))
                {
                    if (item.Name.Equals(form.Name))
                    {
                        isActive = true;
                    }
                    else
                    {
                        item.Visible = false;
                    }
                }

            }

            if (isActive)
            {
                //Open agian
                form.Visible = true;
            }
            else
            {
                //Open new
                form.TopLevel = false;
                pnlForms.Controls.Add(form);
                form.Visible = true;
            }
        }

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
