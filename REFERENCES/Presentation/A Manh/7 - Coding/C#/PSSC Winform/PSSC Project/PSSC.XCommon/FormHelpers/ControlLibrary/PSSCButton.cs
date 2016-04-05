using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.XCommon.FormHelpers.ControlLibrary
{
    public class PSSCButton: Button
    {
        public PSSCButton():base()
        {
            this.BackColor = Color.DeepSkyBlue;
            this.FlatStyle = FlatStyle.Flat;
            this.FlatAppearance.BorderColor = Color.WhiteSmoke;
            this.FlatAppearance.BorderSize = 0;    
            this.Font = new Font("Tahoma", 9.0F, FontStyle.Bold);
            this.ForeColor = Color.WhiteSmoke;
            this.Width = 100;
            this.Height = 35;
            this.UseVisualStyleBackColor = false;
        }
    }
}
