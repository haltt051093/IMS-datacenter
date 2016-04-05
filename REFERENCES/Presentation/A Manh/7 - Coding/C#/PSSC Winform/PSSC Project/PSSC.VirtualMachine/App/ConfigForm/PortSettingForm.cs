using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;
using System.Threading;
using PSSC.VirtualMachine.XDatabase;
using PSSC.VirtualMachine.DataModel;
using PSSC.VirtualMachine.Business;

namespace PSSC.VirtualMachine.App
{
    public partial class PortSettingForm : Form
    {
        PortSettingService service = new PortSettingService();

        public PortSettingForm()
        {
            InitializeComponent();
        }

        private void frmPortSetting_Load(object sender, EventArgs e)
        {
            //Load data to combobox
            LoadDataToCombobox(cbxInputPort, ref  PortConfig._INPUT_PORT, PortConfig._INPUT_PORT_NAME);
            LoadDataToCombobox(cbxOutputPort, ref PortConfig._OUTPUT_PORT, PortConfig._OUTPUT_PORT_NAME);
        }

        //Controls
        private void btnTesting_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(PortConfig.CheckOpenAll(PortConfig._INPUT_PORT, PortConfig._INPUT_PORT_NAME));
            sb.Append(PortConfig.CheckOpenAll(PortConfig._OUTPUT_PORT, PortConfig._OUTPUT_PORT_NAME));
            MessageBox.Show(sb.ToString());
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(SavePortSetting(cbxInputPort, ref PortConfig._INPUT_PORT, PortConfig._INPUT_PORT_NAME));
            sb.Append(SavePortSetting(cbxOutputPort, ref PortConfig._OUTPUT_PORT, PortConfig._OUTPUT_PORT_NAME));
            MessageBox.Show(sb.ToString());
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //Methods - Helper
        private bool LoadDataToCombobox(ComboBox combobox,  ref SerialPort _GLOBAL_PORT, string _GLOBAL_PORT_NAME)
        {
            Dictionary<string, string> dictionary = new Dictionary<string, string>();
            try
            {
                //Create items for Combobox
                foreach (var port in SerialPort.GetPortNames())
                {
                    dictionary.Add(port, port);
                }
                combobox.DataSource = new BindingSource(dictionary, null);
                combobox.DisplayMember = "Name";
                combobox.ValueMember = "Value";
                combobox.SelectedIndex = -1;

                //Query Ports (if they have in xml database)
                PortSetting portSetting = service.SelectByName(_GLOBAL_PORT_NAME);
                if (portSetting != null) { combobox.SelectedValue = portSetting.Value.ToString(); }

                //Open Ports 
                if (_GLOBAL_PORT.IsOpen) { _GLOBAL_PORT.Close(); }
                if (combobox.SelectedIndex != -1 && !_GLOBAL_PORT.PortName.Equals(combobox.SelectedValue.ToString()))
                {
                    _GLOBAL_PORT.PortName = combobox.SelectedValue.ToString();
                }
                _GLOBAL_PORT.Open();
            }
            catch
            {
                return false;
            }
            return true;
        }

        private string SavePortSetting(ComboBox combobox, ref SerialPort _GLOBAL_PORT, string _GLOBAL_PORT_NAME)
        {
            StringBuilder sb = new StringBuilder(_GLOBAL_PORT_NAME + ": ");
            string portNameTemp = _GLOBAL_PORT.PortName;
            try
            {             
                if (_GLOBAL_PORT.IsOpen) { _GLOBAL_PORT.Close(); }
                if (cbxInputPort.SelectedIndex != -1 && !_GLOBAL_PORT.PortName.Equals(combobox.SelectedValue.ToString()))
                {           
                        _GLOBAL_PORT.PortName = combobox.SelectedValue.ToString();
                        
                }
                _GLOBAL_PORT.Open();
            }
            catch 
            {
                //Set default if error
                string errorMessage = sb.Append("Cannot save " + _GLOBAL_PORT.PortName + ". This port is already used!\n").ToString();
                combobox.SelectedValue = portNameTemp;
                _GLOBAL_PORT.PortName = portNameTemp;
                _GLOBAL_PORT.Open();
                return errorMessage;

            }
            service.Update(new PortSetting { Name = _GLOBAL_PORT_NAME, Value = _GLOBAL_PORT.PortName });
            return  sb.Append(_GLOBAL_PORT.PortName + " is saved successful!\n").ToString();
        }
    }
}
