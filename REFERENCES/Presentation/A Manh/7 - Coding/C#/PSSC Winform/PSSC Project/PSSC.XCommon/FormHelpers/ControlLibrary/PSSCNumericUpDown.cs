using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.XCommon.FormHelpers.ControlLibrary
{
    public class PSSCNumericUpDown: NumericUpDown
    {
        public PSSCNumericUpDown()
        {
            this.BackColor = Color.Gray;
            this.BorderStyle = BorderStyle.None;
            this.Font = new Font("Microsoft Sans Serif", 11.25F, FontStyle.Bold, GraphicsUnit.Point, ((byte)(0)));
            this.ForeColor = Color.WhiteSmoke;
            this.ReadOnly = true;
            this.Size = new Size(47, 20);
            this.TextAlign = HorizontalAlignment.Center;
        }
    }
}
