using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using PSSC.XCommon;
using PSSC.VirtualMachine.XDatabase;
using PSSC.VirtualMachine.DataModel;
using PSSC.VirtualMachine.Business;


namespace PSSC.VirtualMachine.App
{
    public class VirtualMachineFormService : FormService
    {
        //Service
        MarbleService service = new MarbleService();

        //Controls
        Label lblStatus_InputMarbles;
        Label lblStatus_OutputMarbles;
        TextBox txtRepositorySizeLimits;
        TextBox txtRedRepository;
        TextBox txtGreenRepository;
        TextBox txtBlueRepository;
        TextBox txtPurpleRepository;
        TextBox txtPinkRepository;
        RichTextBox rtbLog_InputMarbles;
        RichTextBox rtbLog_OutputMarbles;
        protected void te() { }

        //Contructor
        public VirtualMachineFormService():base(){}

        public override void Setup()
        {
            //Setup Controls
            lblStatus_InputMarbles = GetControl<Label>("lblStatus_InputMarbles");
            lblStatus_OutputMarbles = GetControl<Label>("lblStatus_OutputMarbles");
            txtRepositorySizeLimits = GetControl<TextBox>("txtRepositorySizeLimits");
            txtRedRepository = GetControl<TextBox>("txtRedRepository");
            txtGreenRepository = GetControl<TextBox>("txtGreenRepository");
            txtBlueRepository = GetControl<TextBox>("txtBlueRepository");
            txtPurpleRepository = GetControl<TextBox>("txtPurpleRepository");
            txtPinkRepository = GetControl<TextBox>("txtPinkRepository");
            rtbLog_InputMarbles = GetControl<RichTextBox>("rtbLog_InputMarbles");
            rtbLog_OutputMarbles = GetControl<RichTextBox>("rtbLog_OutputMarbles");
            
            //Setup Data
            txtRepositorySizeLimits.Text = Convert.ToString(service.GetQuantityLimits());
        }

        //Methods - Call Thread
        /*---*/
        public bool CallThread_CheckConnection()
        {
            try
            {
                this.CallThreadToDoTask(new ThreadStart(this.CheckConnection));
            }
            catch
            {
                return false;
            }
            return true;
        }

        private void CheckConnection()
        {
            while (true)
            {
                string temp1 = "Connection Successful";
                if (!PortConfig._INPUT_PORT.IsOpen)
                {
                    temp1 = "Connection Failed!";
                }
                if (lblStatus_InputMarbles.InvokeRequired)
                {
                    lblStatus_InputMarbles.Invoke(new MethodInvoker(() => lblStatus_InputMarbles.Text = temp1));
                }

                string temp2 = "Connection Successful";
                if (!PortConfig._OUTPUT_PORT.IsOpen)
                {
                    temp2 = "Connection Failed!";
                }
                if (lblStatus_OutputMarbles.InvokeRequired)
                {
                    lblStatus_OutputMarbles.Invoke(new MethodInvoker(() => lblStatus_OutputMarbles.Text = temp2));
                }
                Thread.Sleep(10000);
            }
        }

        /*---*/
        public bool CallThread_InputMarblesFormUser(object obj)
        {
            try
            {
                this.CallThreadToDoTask(new ParameterizedThreadStart(this.InputMarblesFormUser), obj);
            }
            catch 
            {
                return false;
            }
            return true;
        }

        private void InputMarblesFormUser(object obj)
        {
            object[] elements = (object[])(obj);
            TextBox textbox = (TextBox)elements[0];
            MarbleColor marbleColor = (MarbleColor)elements[1];

            StringBuilder status = new StringBuilder();

            int marbleQuantity = service.SelectByColor(marbleColor).Quantity;
            if (marbleQuantity >= service.GetQuantityLimits())
            {
                status.Append("Not enough space for " + Convert.ToString(marbleColor) + " Marble!\n");
            }
            else
            {
                marbleQuantity++;
                try
                {
                    PortConfig._OUTPUT_PORT.WriteLine(((int)marbleColor).ToString());
                    service.Update(new Marble()
                    {
                        MarbleColor = Convert.ToString(marbleColor),
                        Quantity = marbleQuantity
                    });
                    status.Append("Input 1 " + Convert.ToString(marbleColor) + " Marble!\n");
                    this.UpdateDataToTextbox(textbox, Convert.ToString(marbleQuantity));
                }
                catch
                {
                    status.Append("This " + Convert.ToString(marbleColor) + " Marble is removed!\n");
                }

            }
            this.UpdateDataToRichTextBox(rtbLog_InputMarbles, status.ToString(), marbleColor);
        }

        /*---*/
        public bool CallThread_GetMarblesFormDataReceived(object obj)
        {
            try
            {
                this.CallThreadToDoTask(new ParameterizedThreadStart(this.GetMarblesFormDataReceived), obj);
            }
            catch
            {
                return false;
            }
            return true;
        }

        private void GetMarblesFormDataReceived(object obj)
        {
            string dataReceived = obj.ToString();
            TextBox textbox = null;
            MarbleColor marbleColor = MarbleColor.Unknow;

            if (!string.IsNullOrEmpty(dataReceived))
            {
                this.SelectControlsAndObjects<TextBox>(dataReceived, out textbox, out marbleColor);
                int quantityTemp = 0;

                if (!Convert.ToString(marbleColor).Equals("Unknow"))
                {
                    //Get Current quantiy in Database
                    quantityTemp = (int)service.SelectByColor(marbleColor).Quantity;
                    quantityTemp--;

                    //Update Repository Database
                    service.Update(new Marble() { MarbleColor = Convert.ToString(marbleColor), Quantity = quantityTemp });

                    //Update Textbox Control
                    this.UpdateDataToTextbox(textbox, quantityTemp.ToString());

                    //Display Message
                    string status = "Get 1 " + Convert.ToString(marbleColor) + " Marble sucessful!\n";
                    this.UpdateDataToRichTextBox(rtbLog_OutputMarbles, status, marbleColor);
                }
            }
        }

        /*---*/
        public bool CallThread_UpdateDataToFormXML()
        {
            try
            {
                this.CallThreadToDoTask(new ThreadStart(this.UpdateDataToFormXML));
            }
            catch
            {
                return false;
            }
            return true;
        }

        private void UpdateDataToFormXML()
        {                  
            UpdateDataToTextbox(txtRepositorySizeLimits, Convert.ToString(service.GetQuantityLimits()));
            UpdateDataToTextbox(txtRedRepository, service.SelectByColor(MarbleColor.Red).Quantity.ToString());
            UpdateDataToTextbox(txtGreenRepository, service.SelectByColor(MarbleColor.Green).Quantity.ToString());
            UpdateDataToTextbox(txtBlueRepository, service.SelectByColor(MarbleColor.Blue).Quantity.ToString());
            UpdateDataToTextbox(txtPurpleRepository, service.SelectByColor(MarbleColor.Purple).Quantity.ToString());
            UpdateDataToTextbox(txtPinkRepository, service.SelectByColor(MarbleColor.Pink).Quantity.ToString());
        }

        //Methods - Override - Helpers
        public override bool SelectControlsAndObjects<T>(string data, out T obj, out MarbleColor marbleColor)
        {
            obj = new T();
            marbleColor = MarbleColor.Unknow;
            try
            {
                //Check data (get form machine) is number
                switch (data)
                {
                    case "1":
                    case "Red":
                    case "btnInputRedMarble":
                        {
                            if (typeof(T) == typeof(TextBox))
                            {
                                obj = GetControl<T>("txtRedRepository");
                            }
                            marbleColor = MarbleColor.Red;
                            break;
                        }
                    case "5":
                    case "Green":
                    case "btnInputGreenMarble":
                        {
                            if (typeof(T) == typeof(TextBox))
                            {
                                obj = GetControl<T>("txtGreenRepository");
                            }
                            marbleColor = MarbleColor.Green;
                            break;
                        }
                    case "7":
                    case "Blue":
                    case "btnInputBlueMarble":
                        {
                            if (typeof(T) == typeof(TextBox))
                            {
                                obj = GetControl<T>("txtBlueRepository");
                            }
                            marbleColor = MarbleColor.Blue;
                            break;
                        }
                    case "9":
                    case "Purple":
                    case "btnInputPurpleMarble":
                        {
                            if (typeof(T) == typeof(TextBox))
                            {
                                obj = GetControl<T>("txtPurpleRepository");
                            }
                            marbleColor = MarbleColor.Purple;
                            break;
                        }
                    case "10":
                    case "Pink":
                    case "btnInputPinkMarble":
                        {
                            if (typeof(T) == typeof(TextBox))
                            {
                                obj = GetControl<T>("txtPinkRepository");
                            }
                            marbleColor = MarbleColor.Pink;
                            break;
                        }
                    default:
                        {
                            return false;
                        }
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public override bool UpdateDataToRichTextBox(RichTextBox rtbObj, string content, MarbleColor marbleColor)
        {
            try
            {
                if (rtbObj.InvokeRequired)
                {
                    rtbObj.Invoke(new MethodInvoker(delegate()
                    {
                        switch ((int)marbleColor)
                        {
                            case 1: rtbObj.SelectionColor = Color.Red; break;
                            case 5: rtbObj.SelectionColor = Color.Green; break;
                            case 7: rtbObj.SelectionColor = Color.Blue; break;
                            case 9: rtbObj.SelectionColor = Color.Purple; break;
                            case 10: rtbObj.SelectionColor = Color.Magenta; break;
                            default: rtbObj.SelectionColor = Color.Black; break;
                        }
                        rtbObj.AppendText(content);
                        rtbObj.ScrollToCaret(); //Cho phep rtb tu scroll xuong
                    }));
                }
            }
            catch
            {
                return false;
            }
            return true;
        }
    }
}
