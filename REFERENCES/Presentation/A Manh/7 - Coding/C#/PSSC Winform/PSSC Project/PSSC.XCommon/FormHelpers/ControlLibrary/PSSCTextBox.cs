using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.XCommon.FormHelpers.ControlLibrary
{
    public class PSSCTextBox: TextBox
    {
        public PSSCTextBox():base()
        {
            this.BackColor = Color.DimGray;
            this.BorderStyle = BorderStyle.FixedSingle;
            this.Font = new Font("Microsoft Sans Serif", 9.75F, FontStyle.Bold);
            this.ForeColor = Color.WhiteSmoke;
            this.Multiline = true;
            this.Height = 25;          
        }
    }
}
