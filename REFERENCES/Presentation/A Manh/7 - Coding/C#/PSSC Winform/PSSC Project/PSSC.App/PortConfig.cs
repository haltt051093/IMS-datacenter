using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;
using PSSC.Business.Services;

namespace PSSC.App
{
    public class PortConfig
    {
        public static SerialPort _INPUT_PORT = new SerialPort();
        public static SerialPort _OUTPUT_PORT = new SerialPort();
        public static string _INPUT_PORT_NAME = "InputPort";
        public static string _OUTPUT_PORT_NAME = "OutputPort";
        public static bool IS_CONNECT = false;

        public static bool AutoConfig(SerialPort _GLOBAL_PORT, string _GLOBAL_PORT_NAME)
        {
            PortSettingService service = new PortSettingService();
            try
            {
                //Query Ports (if they have in xml database)
                PortSetting portSetting = service.SelectByName(_GLOBAL_PORT_NAME);

                //Open Ports 
                if (_GLOBAL_PORT.IsOpen) { _GLOBAL_PORT.Close(); }
                if (portSetting != null)
                {
                    _GLOBAL_PORT.PortName = portSetting.Value;
                }
                _GLOBAL_PORT.BaudRate = 9600;
                _GLOBAL_PORT.WriteTimeout = 3000;
                _GLOBAL_PORT.Open();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public static string CheckOpenAll(SerialPort _GLOBAL_PORT, string _GLOBAL_PORT_NAME)
        {
            StringBuilder sb = new StringBuilder(_GLOBAL_PORT_NAME + ": ");
            if (_GLOBAL_PORT.IsOpen)
            {
                sb.Append(_GLOBAL_PORT.PortName + " port is already opened! \n");
            }
            else
            {
                sb.Append(_GLOBAL_PORT.PortName + " is not opened! \n");
            }
            return sb.ToString();
        }

    }
}
