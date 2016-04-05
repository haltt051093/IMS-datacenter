using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.XCommon
{
    public abstract class FormService
    {
        public Form Form { get; set; }

        public FormService()
        {

        }

        private List<Thread> listCurrentThreads = new List<Thread>();

        //Find Control In Form
        public T GetControl<T>(string name) where T : class
        {
            try
            {
                var control = Form.Controls.Find(name, true).FirstOrDefault();
                if (control != null && (control is T))
                {
                    return control as T;
                }
            }
            catch
            {
                return null;
            }
            return null;
        }

        //Call Thread To Do Job
        public bool CallThreadToDoTask(ThreadStart start)
        {
            try
            {
                Thread thread = new Thread(start);
                thread.IsBackground = true;
                thread.Start();
            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool CallThreadToDoTask(ThreadStart start, string name)
        {
            try
            {
                Thread thread = new Thread(start);
                thread.IsBackground = true;
                thread.Name = name;
                this.AddThread(thread);
                thread.Start();
            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool CallThreadToDoTask(ParameterizedThreadStart start, object obj)
        {
            try
            {
                Thread thread = new Thread(new ParameterizedThreadStart(start));
                thread.IsBackground = true;
                thread.Start(obj);
            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool CallThreadToDoTask(ParameterizedThreadStart start, object obj, string name)
        {
            try
            {
                Thread thread = new Thread(new ParameterizedThreadStart(start));
                thread.IsBackground = true;
                thread.Name = name;
                this.AddThread(thread);
                thread.Start(obj);
            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool StopThreadToDoTask(string name)
        {
            try
            {
                this.RemoveThread(name);
            }
            catch
            {
                return false;
            }
            return true;
        }

        private bool AddThread(Thread thread)
        {
            try
            {
                Thread temp = listCurrentThreads.Find(x => x.Name.Equals(thread.Name));
                if (temp != null && temp.IsAlive)
                {
                    temp.Abort();
                    listCurrentThreads.Remove(temp);

                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        private bool RemoveThread(string name)
        {
            try
            {
                Thread temp = listCurrentThreads.Find(x => x.Name.Equals(name));
                if (temp != null && temp.IsAlive)
                {
                    temp.Abort();
                    listCurrentThreads.Remove(temp);
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        //Function - Invoke Method
        public bool DisplayButtonText(Button button, string text)
        {
            try
            {
                if (button.InvokeRequired)
                {
                    button.Invoke(new MethodInvoker(() => button.Text = text));
                    button.Enabled = true;
                }
                else
                {
                    button.Text = text;
                    button.Enabled = true;
                }

            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool UpdateDataToNumericUpDown(NumericUpDown numericUpDown, decimal value)
        {
            try
            {
                if (numericUpDown.InvokeRequired)
                {
                    numericUpDown.Invoke(new MethodInvoker(() => numericUpDown.Value = value));
                }
                else
                {
                    numericUpDown.Value = value;
                }

            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool UpdateDataToRichTextBox(RichTextBox richtextbox, string content)
        {
            try
            {

                if (richtextbox.InvokeRequired)
                {
                    richtextbox.Invoke(new MethodInvoker(delegate()
                    {
                        richtextbox.AppendText(content);
                        richtextbox.ScrollToCaret(); //Cho phep rtb tu scroll xuong
                    }));

                }
                else
                {
                    richtextbox.AppendText(content);
                    richtextbox.ScrollToCaret();
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool UpdateDataToTextbox(TextBox textbox, string content)
        {
            try
            {
                if (textbox.InvokeRequired)
                {
                    textbox.Invoke(new MethodInvoker(() => textbox.Text = content));
                }
                else
                {
                    textbox.Text = content;
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool SetControlEnable(Control control, bool value)
        {
            try
            {
                if (control.InvokeRequired)
                {
                    control.Invoke(new MethodInvoker(() => control.Enabled = value));
                }
                else
                {
                    control.Enabled = value;
                }

            }
            catch
            {

                return false;
            }
            return true;
        }

        public bool SetControlForeColor(Control control, Color color)
        {
            try
            {
                if (control.InvokeRequired)
                {
                    control.Invoke(new MethodInvoker(() => control.ForeColor = color));
                }
                else
                {
                    control.ForeColor = color;
                }

            }
            catch
            {

                return false;
            }
            return true;
        }

        //Methods - Abstract
        public abstract void Setup();
        public abstract bool SelectControlsAndObjects<T>(string data, out T obj, out MarbleColor marbleColor) where T : class, new();
        public abstract bool UpdateDataToRichTextBox(RichTextBox rtbObj, string content, MarbleColor marbleColor);
    }
}
