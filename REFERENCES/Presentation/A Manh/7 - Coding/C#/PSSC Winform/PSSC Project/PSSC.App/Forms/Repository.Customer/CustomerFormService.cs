using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using System.Text.RegularExpressions;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.Business.Services;


namespace PSSC.App
{
    
    public class CustomerFormService : FormService
    {
        //Services
        OrderService orderService = new OrderService();
        public string OrderCode { get; set; }

        //Delegates and events
        public delegate void HasOrderCodeDelegate(string OrderCode);
        public event HasOrderCodeDelegate HasOrderCodeHandler;

        //Controls 
        Button btnSave;
        Button btnExit;
        TextBox txtName;
        TextBox txtEmail;
        TextBox txtPhone;
        TextBox txtAddress;
        RichTextBox rtbMessage;

        //Contructors
        public override void Setup()
        {
            //Setup Controls
            btnSave = GetControl<Button>("btnSave");
            btnExit = GetControl<Button>("btnExit");
            txtName = GetControl<TextBox>("txtName");
            txtEmail = GetControl<TextBox>("txtEmail");
            txtPhone = GetControl<TextBox>("txtPhone");
            txtAddress = GetControl<TextBox>("txtAddress");
            rtbMessage = GetControl<RichTextBox>("rtbMessage");

            //Setup Data
        }

        //Methods - Validation
        public bool Validation()
        {
            StringBuilder sb = new StringBuilder();
            bool isValid = true;
            int count = 0;
            if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrWhiteSpace(txtName.Text))
            {
                sb.AppendLine((++count) + ".The Name field is Required.");
                isValid = false;
            }

            if (string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                sb.AppendLine((++count) + ".The Email field is Required.");
                isValid = false;
            }
            else
            {
                if (!this.isEmail(txtEmail.Text))
                {
                    sb.AppendLine((++count) + ".The Email is not valid.");
                    isValid = false;
                }
            }

            if (string.IsNullOrEmpty(txtPhone.Text) || string.IsNullOrWhiteSpace(txtPhone.Text))
            {

                sb.AppendLine((++count) + ".The Phone field is Required.");
                isValid = false;
            }
            else
            {
                if (!this.isPhone(txtPhone.Text))
                {
                    sb.AppendLine((++count) + ".Phone field accepts only Digits.");
                    isValid = false;
                }
            }

            if (string.IsNullOrEmpty(txtAddress.Text) || string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                sb.AppendLine((++count) + ".The Address field is Required.");
                isValid = false;
            }
            //sb.AppendLine("- - - - - - - - - - - - - - - - - - - - - - - - - - ");
            rtbMessage.Text = sb.ToString();

            return isValid;
        }

        public bool isEmail(string input)
        {
            try
            {
                string pattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";
                Regex regex = new Regex(pattern);
                Match match = regex.Match(input);
                if (match.Success)
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
            return false;
        }

        public bool isPhone(string input)
        {
            try
            {
                int temp = 0;
                if (int.TryParse(input, out temp))
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
            return false;
        }

        //Methods - Call Thread
        /*---*/
        public void CallThread_CreateOrder()
        {
            this.CallThreadToDoTask(new ThreadStart(CreateOrder));
        }

        private void CreateOrder()
        {
            OrderCodeGenerator tool = new OrderCodeGenerator();
            StringBuilder sb = new StringBuilder();

            //Disable controls
            this.SetControlEnable(btnSave, false);
            this.SetControlEnable(btnExit, false);
            try
            {
                //Create OrderCode
                this.OrderCode = string.Empty;
                this.OrderCode = tool.GenerateOrderCode();

                //Create Order
                Order order = new Order()
                {
                    OrderCode = this.OrderCode,
                    CustomerName = Convert.ToString(txtName.Text),
                    CustomerEmail = Convert.ToString(txtEmail.Text),
                    CustomerPhone = Convert.ToString(txtPhone.Text),
                    CustomerAddress = Convert.ToString(txtAddress.Text)
                };
                orderService.Create(order);
                //sb.AppendLine("Order is created successful!");
                //sb.AppendLine("- - - - - - - - - - - - - - - - - - - - - - - - - - ");
                if(HasOrderCodeHandler != null)
                {
                    HasOrderCodeHandler.Invoke(this.OrderCode);
                }
                if (Form.InvokeRequired)
                {
                    Form.Invoke(new MethodInvoker(() => Form.Close()));
                }
            }
            catch
            {
                sb.AppendLine("Order was unsuccessful! Please try again!");
                sb.AppendLine("- - - - - - - - - - - - - - - - - - - - - - - - - - ");
                this.SetControlEnable(btnSave, true);
                this.SetControlEnable(btnExit, true);
                this.UpdateDataToRichTextBox(rtbMessage, sb.ToString());
            }         
        }

        /*---*/
        public void CallThread_GeneratePersonProfile()
        {
            this.CallThreadToDoTask(new ThreadStart(GeneratePersonProfile));
        }

        private void GeneratePersonProfile()
        {
            PersonInfoGenerator tool = new PersonInfoGenerator();
            string customerName = tool.GeneratePersonName();
            this.UpdateDataToTextbox(txtName, customerName);
            this.UpdateDataToTextbox(txtEmail, tool.GenerateEmailByName(customerName));
            this.UpdateDataToTextbox(txtPhone, tool.GeneratePhoneNumber());
            this.UpdateDataToTextbox(txtAddress, tool.GenerateAddress());
        }

        //Methods - Override - Helpers
        public override bool SelectControlsAndObjects<T>(string data, out T obj, out MarbleColor marbleColor)
        {
            throw new NotImplementedException();
        }

        public override bool UpdateDataToRichTextBox(RichTextBox rtbObj, string content, MarbleColor marbleColor)
        {
            throw new NotImplementedException();
        }
    }
}
