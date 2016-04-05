using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.Business.Services;

namespace PSSC.App
{
    public class MarbleManagementFormService : FormService
    {
        //Service
        InputLogService inputLogService = new InputLogService();
        MarbleService marbleService = new MarbleService();
        OrderService orderService = new OrderService();
        OrderDetailService orderDetaiService = new OrderDetailService();
        RepositoryService repositoryService = new RepositoryService();
        DgvOutputMarblesHelper dgvHelper = new DgvOutputMarblesHelper();


        //Controls
        Button btnGetMarbles;
        Button btnClear;
        DataGridView dgvOutputMarbles;
        NumericUpDown nudRed;
        NumericUpDown nudGreen;
        NumericUpDown nudBlue;
        NumericUpDown nudPurple;
        NumericUpDown nudPink;
        NumericUpDown nudNumberOfPackages;
        TextBox txtRepositorySizeLimits;
        TextBox txtTotal;
        TextBox txtRedRepository;
        TextBox txtGreenRepository;
        TextBox txtBlueRepository;
        TextBox txtPurpleRepository;
        TextBox txtPinkRepository;
        RichTextBox rtbMessage;

        //Contructor
        public override void Setup()
        {
            //Setup Controls
            btnGetMarbles = GetControl<Button>("btnGetMarbles");
            btnClear = GetControl<Button>("btnClear");
            dgvOutputMarbles = GetControl<DataGridView>("dgvOutputMarbles");
            nudRed = GetControl<NumericUpDown>("nudRed");
            nudGreen = GetControl<NumericUpDown>("nudGreen");
            nudBlue = GetControl<NumericUpDown>("nudBlue");
            nudPurple = GetControl<NumericUpDown>("nudPurple");
            nudPink = GetControl<NumericUpDown>("nudPink");
            nudNumberOfPackages = GetControl<NumericUpDown>("nudNumberOfPackages");
            txtRepositorySizeLimits = GetControl<TextBox>("txtRepositorySizeLimits");
            txtTotal = GetControl<TextBox>("txtTotal");
            txtRedRepository = GetControl<TextBox>("txtRedRepository");
            txtGreenRepository = GetControl<TextBox>("txtGreenRepository");
            txtBlueRepository = GetControl<TextBox>("txtBlueRepository");
            txtPurpleRepository = GetControl<TextBox>("txtPurpleRepository");
            txtPinkRepository = GetControl<TextBox>("txtPinkRepository");
            rtbMessage = GetControl<RichTextBox>("rtbMessage");

            //Setup Controls - Initialize DataGirdView
            dgvHelper.dataGridView = dgvOutputMarbles;
            dgvHelper.Setup();

            //Setup Data

        }

        //Methods - Business
        public int GetTotalOutputMarbles()
        {
            return dgvHelper.GetTotalOutputMarbles();
        }

        public int GetOutputLimits()
        {
            return repositoryService.OutputLimits;
        }

        //Methods - Validation
        public bool ValidateNumberOfPackages()
        {
            TextBox textbox = null;
            MarbleColor marbleColor = MarbleColor.Unknow;
            StringBuilder sb = new StringBuilder();
            int temp = Convert.ToInt32(nudNumberOfPackages.Value);
            bool check = true;
            foreach (DataGridViewRow item in dgvOutputMarbles.Rows)
            {
                this.SelectControlsAndObjects<TextBox>(item.Cells[1].Value.ToString(), out textbox, out marbleColor);
                if (Convert.ToInt32(textbox.Text) < (Convert.ToInt32(item.Cells[2].Value) * Convert.ToInt32(nudNumberOfPackages.Value)))
                {
                    nudNumberOfPackages.Value = (decimal)(nudNumberOfPackages.Value - 1);
                    sb.Append(Convert.ToString(marbleColor) + "-");
                    check = false;
                }
            }
            if (!check)
            {
                sb.Remove(sb.Length - 1, 1);
                MessageBox.Show("Not enought " + sb.ToString() + " Marbles in repository for " + temp.ToString() + " Packages!");
            }

            return check;
        }

        public bool ValidateBeforeGettingMarbles()
        {
            //Check user selects marbles or not
            if (dgvOutputMarbles.Rows.Count == 0)
            {
                MessageBox.Show("Please select marbles!");
                return false;
            }

            //Check max marbles can get out.
            if (this.GetTotalOutputMarbles() > this.GetOutputLimits())
            {
                MessageBox.Show("Output Marbles must be less than or equal " + this.GetOutputLimits() + ".");
                return false;
            }

            //Check user selects Packages or not
            if (nudNumberOfPackages.Value <= 0)
            {
                MessageBox.Show("Please select Packages!");
                return false;
            }

            //Check Packages Quantity
            if (nudNumberOfPackages.Value > 0 && dgvOutputMarbles.Rows.Count > 0)
            {
                if (!this.ValidateNumberOfPackages()) { return false; }
            }
            return true;
        }

        //Methods - Call Thread
        /*---*/
        public void CallThread_AddValueToDataGridView(NumericUpDown numericUpDown)
        {
            this.CallThreadToDoTask(new ParameterizedThreadStart(this.AddValueToDataGridView), numericUpDown);
        }

        private void AddValueToDataGridView(object obj)
        {

            int quantity = 0;
            MarbleColor marbleColor = new MarbleColor();

            NumericUpDown numericUpDown = (NumericUpDown)obj;
            if (dgvOutputMarbles.InvokeRequired)
            {
                dgvOutputMarbles.Invoke(new MethodInvoker(delegate()
                {
                    quantity = Convert.ToInt32(numericUpDown.Value);
                    switch (numericUpDown.Name)
                    {
                        case "nudRed": marbleColor = MarbleColor.Red; break;
                        case "nudGreen": marbleColor = MarbleColor.Green; break;
                        case "nudBlue": marbleColor = MarbleColor.Blue; break;
                        case "nudPurple": marbleColor = MarbleColor.Purple; break;
                        case "nudPink": marbleColor = MarbleColor.Pink; break;
                        default: break;
                    }
                    if (!Convert.ToString(marbleColor).Equals("Unknow"))
                    {
                        dgvHelper.AddRows(marbleColor, quantity);
                    }
                }));
            }

            //Update Number Of Packages
            if (dgvOutputMarbles.Rows.Count > 0 && nudNumberOfPackages.Value == 0)
            {
                this.UpdateDataToNumericUpDown(nudNumberOfPackages, 1);
            }
            else if (dgvOutputMarbles.Rows.Count == 0)
            {
                this.UpdateDataToNumericUpDown(nudNumberOfPackages, 0);
            }

        }

        /*---*/
        public void CallThread_UpdateInputMarblesFormMachine(string dataReceived)
        {
            this.CallThreadToDoTask(new ParameterizedThreadStart(this.UpdateInputMarblesFormMachine), dataReceived);
        }

        private void UpdateInputMarblesFormMachine(object obj)
        {
            string dataReceived = (string)obj;
            TextBox textbox = null;
            MarbleColor marbleColor = MarbleColor.Unknow;

            if (!string.IsNullOrEmpty(dataReceived))
            {
                string status = "";
                //Check Repository Limits
                if (this.LookupCodeOfRepositoryLimits(dataReceived, out status))
                {
                    this.UpdateDataToRichTextBox(rtbMessage, "Not enough space for " + status + " Marble!\n");
                    return;
                }

                //Input Marbles
                this.SelectControlsAndObjects<TextBox>(dataReceived, out textbox, out marbleColor);
                int quantityTemp = 0;

                if (!Convert.ToString(marbleColor).Equals("Unknow"))
                {
                    //Get Current quantiy in Database
                    quantityTemp = (int)repositoryService.SelectRepositoryByMarbleColor(marbleColor).Quantity;
                    quantityTemp++;

                    //Update Repository Database
                    repositoryService.UpdateQuantityByMarbleColor(marbleColor, quantityTemp);

                    //Update Textbox Control
                    this.UpdateDataToTextbox(textbox, quantityTemp.ToString());
                    this.UpdateDataToTextbox(txtTotal, repositoryService.GetTotalMarbles().ToString());

                    //Display Message
                    status = "Receive 1 " + Convert.ToString(marbleColor) + " Marble!\n";
                    this.UpdateDataToRichTextBox(rtbMessage, status, marbleColor);
                }

            }
        }

        /*---*/
        public void CallThread_GetMarblesOutOfMachine(string OrderCode)
        {
            this.CallThreadToDoTask(new ParameterizedThreadStart(this.GetMarblesOutOfMachine), OrderCode);
        }

        private void GetMarblesOutOfMachine(object obj)
        {
            dgvHelper.Backup();
            TextBox textbox = null;
            MarbleColor marbleColor = MarbleColor.Unknow;
            string orderCode = (string)obj;


            //Disable Controls
            this.SetAllControlsEnable(false);

            //Start to Get Marbles - Get each row in DataGridView
            bool isFinish = false;

            foreach (DataGridViewRow row in dgvOutputMarbles.Rows)
            {
                //Get value of marble to send
                int sendValue = -1;
                this.SelectControlsAndObjects(row.Cells[1].Value.ToString(), out textbox, out marbleColor);
                sendValue = Convert.ToInt32(marbleColor);

                if (sendValue != -1)
                {
                    int outPutQuantity = Convert.ToInt32(row.Cells[2].Value);
                    bool isSucessful = false;
                    //Get each item in one row
                    for (int i = 0; i < outPutQuantity; i++)
                    {
                        StringBuilder sb = new StringBuilder();
                        //Send value to machine
                        try
                        {
                            if (PortConfig._OUTPUT_PORT.IsOpen)
                            {
                                PortConfig._OUTPUT_PORT.WriteLine(sendValue.ToString());
                                isSucessful = true;
                            }
                            else
                            {
                                MessageBox.Show("Port is not opened!");
                                break;
                            }
                        }
                        catch
                        {
                            //sb.Append("1 " + Convert.ToString(marbleColor) + " Failed to get out!\n");
                            this.UpdateDataToRichTextBox(rtbMessage, "Fail to get out!");
                            break;
                        }

                        //Send OK
                        if (isSucessful)
                        {
                            int quantityTemp = (int)repositoryService.SelectRepositoryByMarbleColor(marbleColor).Quantity;
                            quantityTemp--;

                            //Update Database - Update Quantity Of Repository
                            repositoryService.UpdateQuantityByMarbleColor(marbleColor, quantityTemp);

                            //Update Database - Update Order Details
                            orderDetaiService.Create(orderCode, marbleColor);

                            //Update DataGrideView Control
                            if (dgvOutputMarbles.InvokeRequired)
                            {
                                dgvOutputMarbles.Invoke(new MethodInvoker(delegate()
                                {
                                    dgvHelper.UpdateRows(marbleColor, Convert.ToInt32(row.Cells[2].Value) - 1);

                                }));
                            }

                            try
                            {
                                //Update TextBox Control                           
                                this.UpdateDataToTextbox(textbox, quantityTemp.ToString());
                                this.UpdateDataToTextbox(txtTotal, repositoryService.GetTotalMarbles().ToString());
                            }
                            catch { }
                            //Update Status
                            sb.Append("Send 1 " + Convert.ToString(marbleColor) + " sucessful!\n");
                            isFinish = true;
                        }
                        //Display message
                        this.UpdateDataToRichTextBox(rtbMessage, sb.ToString(), marbleColor);
                        Thread.Sleep(800);
                    }//End for      

                    if (!isSucessful)
                    {
                        orderService.DeleteByOrderCode(orderCode);
                        isFinish = false;
                        break;
                    }
                }
            }//End foreach
            try
            {
                //If have only one packages, send Message 1002 for Arduino - 1002: Finish
                if (isFinish && PortConfig._OUTPUT_PORT.IsOpen)
                {
                    Thread.Sleep(5000);
                    this.UpdateDataToNumericUpDown(nudNumberOfPackages, (decimal)(Convert.ToDecimal(nudNumberOfPackages.Value) - 1));
                    PortConfig._OUTPUT_PORT.WriteLine("1002");
                }
     
                //If still have more packages
                if (nudNumberOfPackages.Value > 0)
                {
                    if (dgvOutputMarbles.InvokeRequired)
                    {
                        dgvOutputMarbles.Invoke(new MethodInvoker(delegate()
                        {
                            dgvHelper.Restore();
                        }));
                    }                  
                }

                //If get all packages successfull
                if (nudNumberOfPackages.Value == 0)
                {
                    //Clear selected value
                    if (dgvOutputMarbles.InvokeRequired)
                    {
                        dgvOutputMarbles.Invoke(new MethodInvoker(delegate()
                        {
                            dgvHelper.RemoveRows();
                            dgvHelper.ClearCache();
                        }));
                    }

                    //Reset Name of Button
                    this.DisplayButtonText(btnGetMarbles, "Get Marbles");
                    this.DisplayButtonText(btnClear, "Clear");

                    //Clear NumericUpDown
                    this.ResetAllNumericUpDown();
                    this.SetAllControlsEnable(true);                    
                }             

            }
            catch
            {
                return;
            }
        }

        /*---*/
        public void CallThread_UpdateDataFormDataBase()
        {
            this.CallThreadToDoTask(new ThreadStart(this.UpdateDataFormDataBase));
        }

        private void UpdateDataFormDataBase()
        {
            UpdateDataToTextbox(txtRepositorySizeLimits, Convert.ToString(repositoryService.QuantityLimits));
            UpdateDataToTextbox(txtTotal, Convert.ToString(repositoryService.GetTotalMarbles()));
            UpdateDataToTextbox(txtRedRepository, repositoryService.SelectRepositoryByMarbleColor(MarbleColor.Red).Quantity.ToString());
            UpdateDataToTextbox(txtGreenRepository, repositoryService.SelectRepositoryByMarbleColor(MarbleColor.Green).Quantity.ToString());
            UpdateDataToTextbox(txtBlueRepository, repositoryService.SelectRepositoryByMarbleColor(MarbleColor.Blue).Quantity.ToString());
            UpdateDataToTextbox(txtPurpleRepository, repositoryService.SelectRepositoryByMarbleColor(MarbleColor.Purple).Quantity.ToString());
            UpdateDataToTextbox(txtPinkRepository, repositoryService.SelectRepositoryByMarbleColor(MarbleColor.Pink).Quantity.ToString());
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
                    case "nudRed":
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
                    case "nudGreen":
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
                    case "nudBlue":
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
                    case "nudPurple":
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
                    case "nudPink":
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
                            case 1: rtbObj.SelectionColor = Color.Maroon; break;
                            case 5: rtbObj.SelectionColor = Color.LawnGreen; break;
                            case 7: rtbObj.SelectionColor = Color.MidnightBlue; break;
                            case 9: rtbObj.SelectionColor = Color.Indigo; break;
                            case 10: rtbObj.SelectionColor = Color.MediumVioletRed; break;
                            default: rtbObj.SelectionColor = Color.WhiteSmoke; break;
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

        //Methods - Helpers
        public bool ClearSelectedValues()
        {
            try
            {
                nudRed.Value = 0;
                nudGreen.Value = 0;
                nudBlue.Value = 0;
                nudPurple.Value = 0;
                nudPink.Value = 0;
                dgvHelper.RemoveRows();
                rtbMessage.Clear();
            }
            catch
            {
                return false;
            }
            return true;
        }

        private bool LookupCodeOfRepositoryLimits(string data, out string status)
        {
            status = "";
            try
            {
                switch (data)
                {
                    case "101": status = "Red"; break;
                    case "105": status = "Green"; break;
                    case "107": status = "Blue"; break;
                    case "109": status = "Purple"; break;
                    case "110": status = "Pink"; break;
                    default: return false;
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public void ResetDatabse(int value)
        {
            repositoryService.ResetRepository(value);
        }

        private void ResetAllNumericUpDown()
        {
            this.UpdateDataToNumericUpDown(nudRed, 0);
            this.UpdateDataToNumericUpDown(nudGreen, 0);
            this.UpdateDataToNumericUpDown(nudBlue, 0);
            this.UpdateDataToNumericUpDown(nudPurple, 0);
            this.UpdateDataToNumericUpDown(nudPink, 0);
        }

        public void SetAllControlsEnable(bool value)
        {
            this.SetControlEnable(nudRed, value);
            this.SetControlEnable(nudGreen, value);
            this.SetControlEnable(nudBlue, value);
            this.SetControlEnable(nudPurple, value);
            this.SetControlEnable(nudPink, value);
            this.SetControlEnable(nudNumberOfPackages, value);
            this.SetControlEnable(btnGetMarbles, value);
            this.SetControlEnable(btnClear, value);
        }


    }
}
