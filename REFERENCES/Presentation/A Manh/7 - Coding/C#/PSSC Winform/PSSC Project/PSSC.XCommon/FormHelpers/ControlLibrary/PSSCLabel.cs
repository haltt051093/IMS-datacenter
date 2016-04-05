using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PSSC.XCommon.FormHelpers.ControlLibrary
{
    public class PSSCLabel:Label
    {
        private StandardSize standardSize = StandardSize.Small;
        private bool isUppercase = false;
        private string oldText = "";

        [Description("The standard size of PSSC.")]
        [Category("PSSC")]
        public StandardSize StandardSize
        {
            get { return this.standardSize; }
            set { this.standardSize = value; this.Invalidate();}
        }

        [Description("Make uppercase text.")]
        [Category("PSSC")]
        public bool IsUppercase
        {
            get { return this.isUppercase; }
            set { this.isUppercase = value; this.Invalidate(); }
        }



        public PSSCLabel():base()
        {
            this.standardSize = StandardSize.Small;
            this.isUppercase = false;

            this.AutoSize = true;
            this.ForeColor = Color.DeepSkyBlue;
            //oldText = this.Text;
        }

        protected override void OnPaint(PaintEventArgs e)
        {
            base.OnPaint(e);
            this.SetSize();
            this.SetLetterCase();
        }

        protected override void OnTextChanged(EventArgs e)
        {
            base.OnTextChanged(e);
            if(!string.IsNullOrEmpty(this.Text))
            {
                if(!this.Text.ToLower().Equals(this.oldText.ToLower()))
                {
                    this.oldText = this.Text;
                }
            }
        }

        //Methods - Helpers
        private void SetSize()
        {
            float emSize = 0.0F;
            switch(this.standardSize)
            {
                case StandardSize.Large: emSize = 14.25F; break;
                case StandardSize.Medium: emSize = 13F; break;
                default: emSize = 9.75F; break;
            }
            this.Font = new Font("Microsoft Sans Serif", emSize, FontStyle.Bold);
        }

        private void SetLetterCase()
        {
            if (isUppercase)
            {
                this.Text = this.Text.ToUpper();
            }
            else
            {
                if (!string.IsNullOrEmpty(this.oldText))
                {
                    this.Text = this.oldText;
                }
                else
                {
                    this.Text = this.Text.ToLower();
                }
            }
        }

    }

    public enum StandardSize
    {
        Small = 1,
        Medium = 2,
        Large = 3
    }

}
