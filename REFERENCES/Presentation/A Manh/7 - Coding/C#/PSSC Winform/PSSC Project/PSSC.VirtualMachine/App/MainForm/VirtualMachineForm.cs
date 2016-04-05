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
using System.IO.Ports;
using PSSC.XCommon;
using PSSC.VirtualMachine.XDatabase;
using PSSC.VirtualMachine.DataModel;
using PSSC.VirtualMachine.Business;

namespace PSSC.VirtualMachine.App
{
    public delegate int CheckReadyToSendDelegate();
    public partial class frmVirtualMachine : Form
    {
        VirtualMachineFormService formService = new VirtualMachineFormService();
        bool isReadyToSend = false;
        public frmVirtualMachine()
        {
            InitializeComponent();
        }

        private void frmVirtualMachine_Load(object sender, EventArgs e)
        {
            //Auto config port
            PortConfig.AutoConfig(PortConfig._INPUT_PORT, PortConfig._INPUT_PORT_NAME);
            PortConfig.AutoConfig(PortConfig._OUTPUT_PORT, PortConfig._OUTPUT_PORT_NAME);
            PortConfig._INPUT_PORT.DataReceived += _INPUT_PORT_DataReceived;
            
            //Setup service
            formService.Form = this;
            formService.Setup();

            //Update data form xml
            formService.CallThread_UpdateDataToFormXML();

            //Check Connection every 10s
            formService.CallThread_CheckConnection();
        }

        //Controls
        private void lblConfiguration_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FormCollection forms = Application.OpenForms;
            bool check = false;
            foreach (Form item in forms)
            {
                if (item.Name.Equals("frmPortSetting"))
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

        private void btnQuickTesting_Click(object sender, EventArgs e)
        {
            if (PortConfig._INPUT_PORT.IsOpen && PortConfig._OUTPUT_PORT.IsOpen)
            {
                MessageBox.Show("Connection Successful!");
            }
            else
            {
                MessageBox.Show("Connection Failed!");
            }
        }

        private void btnUpdateData_Click(object sender, EventArgs e)
        {
            formService.CallThread_UpdateDataToFormXML();
        }

        private void btnReset_Click(object sender, EventArgs e)
        {

            DBRepository.DeleteDB("MarbleDB");
            DBRepository.CreateDB();
            rtbLog_InputMarbles.Clear();
            rtbLog_OutputMarbles.Clear();
            formService.CallThread_UpdateDataToFormXML();
        }

        private void btnClear_InputMarbles_Click(object sender, EventArgs e)
        {
            rtbLog_InputMarbles.Clear();
        }

        private void btnClear_OutputMarbles_Click(object sender, EventArgs e)
        {
            rtbLog_OutputMarbles.Clear();
        }

        private void btnInputMarbles_Click(object sender, EventArgs e)
        {
            //Send message to ask before send
            try
            {
                //PortConfig._OUTPUT_PORT.WriteLine("StartToSendMarble");
                if (!isReadyToSend && PortConfig._OUTPUT_PORT.IsOpen)
                {
                    //Send to Software to ask Software is ready or not
                    PortConfig._OUTPUT_PORT.WriteLine("VirtualMachineHasNewMarble!!!"); 
                }  
            }
            catch 
            {
                PortConfig._INPUT_PORT.DiscardInBuffer();
                PortConfig._OUTPUT_PORT.DiscardOutBuffer();
                isReadyToSend = false;
                MessageBox.Show("Please Check Software Connection!");
                return;
            }

            //Check reply message before send
            CheckReadyToSendDelegate checkReadyToSend = new CheckReadyToSendDelegate(delegate()
            {
                int i = 1; //1 - ready
                DateTime dt1 = DateTime.Now;
                while (!isReadyToSend)
                {
                    if (isReadyToSend)
                    {
                        break;
                    }
                    DateTime dt2 = DateTime.Now;
                    TimeSpan span = dt2 - dt1;
                    int difference = (int)span.TotalMilliseconds;
                    if (difference > 5000)
                    {
                        i = 0;
                        break;
                    }
                }
                return i;
            });

            IAsyncResult result = checkReadyToSend.BeginInvoke(null, null);
            if (checkReadyToSend.EndInvoke(result) == 0)
            {
                PortConfig._INPUT_PORT.DiscardInBuffer();
                PortConfig._OUTPUT_PORT.DiscardOutBuffer();
                isReadyToSend = false;
                return;
            }

            //If everything OK
            MarbleColor marbleColor = MarbleColor.Unknow;
            TextBox textbox = null;

            bool hasReturnTrue= false;
            if ((Button)sender is Button)
            {
                Button button = sender as Button;
                hasReturnTrue = formService.SelectControlsAndObjects<TextBox>(button.Name, out textbox, out marbleColor);
            }
            if (hasReturnTrue)
            {
                object[] elements = new object[] { textbox, marbleColor };
                formService.CallThread_InputMarblesFormUser(elements);
                isReadyToSend = false;
            }
        }
        bool test = false;
        //Event
        private void _INPUT_PORT_DataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            string dataReceived = "";
            if (PortConfig._INPUT_PORT.IsOpen)
            {
                dataReceived = PortConfig._INPUT_PORT.ReadLine();
                //Receieved form Software to confirm that Software is ready
                if (dataReceived.Equals("VirtulaMachine,SendItToMe!!!")) 
                {
                    isReadyToSend = true;                   
                    return;
                }
                int temp = -1;
                if (int.TryParse(dataReceived, out temp))
                {
                    if (temp == 1001)// Send to Software to confirm "Ready"
                    {
                        try
                        {
                            PortConfig._OUTPUT_PORT.WriteLine("2001");
                            return;
                        }
                        catch
                        {
                            PortConfig._OUTPUT_PORT.WriteLine("2101");
                            return;
                        }
                    }
                    else if(temp == 1002) //Send to Software to confirm "Get Marbles successfull"
                    {
                        try
                        {
                            PortConfig._OUTPUT_PORT.WriteLine("2002");
                            return;
                        }
                        catch
                        {
                            return;
                        }
                    }
                    else if (temp == 1003 ) //Send to Software to confirm "Ready to send 2nd, 3rd,..."
                    {
                        try
                        {
                            if (!test)
                            {
                                PortConfig._OUTPUT_PORT.WriteLine("2103");
                                test = true;
                            }
                            else
                            {
                                PortConfig._OUTPUT_PORT.WriteLine("2003"); 
                            }
                            return;
                        }
                        catch
                        {
                            PortConfig._OUTPUT_PORT.WriteLine("2103");
                            return;
                        }
                    }
                    else
                    {
                        formService.CallThread_GetMarblesFormDataReceived(temp);
                    }
                }
            }
        }

    }
}
