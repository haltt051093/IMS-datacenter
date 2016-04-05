namespace PSSC.App
{
    partial class PortSettingForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblInputPort = new System.Windows.Forms.Label();
            this.lblOutputPort = new System.Windows.Forms.Label();
            this.cbxInputPort = new System.Windows.Forms.ComboBox();
            this.cbxOutputPort = new System.Windows.Forms.ComboBox();
            this.btnClose = new System.Windows.Forms.Button();
            this.lblFormName = new System.Windows.Forms.Label();
            this.btnSave = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.btnTesting = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.btnExit = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lblInputPort
            // 
            this.lblInputPort.AutoSize = true;
            this.lblInputPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInputPort.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblInputPort.Location = new System.Drawing.Point(31, 65);
            this.lblInputPort.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblInputPort.Name = "lblInputPort";
            this.lblInputPort.Size = new System.Drawing.Size(76, 16);
            this.lblInputPort.TabIndex = 6;
            this.lblInputPort.Text = "Input Port";
            // 
            // lblOutputPort
            // 
            this.lblOutputPort.AutoSize = true;
            this.lblOutputPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOutputPort.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblOutputPort.Location = new System.Drawing.Point(31, 100);
            this.lblOutputPort.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblOutputPort.Name = "lblOutputPort";
            this.lblOutputPort.Size = new System.Drawing.Size(87, 16);
            this.lblOutputPort.TabIndex = 5;
            this.lblOutputPort.Text = "Output Port";
            // 
            // cbxInputPort
            // 
            this.cbxInputPort.BackColor = System.Drawing.Color.Gray;
            this.cbxInputPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxInputPort.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbxInputPort.FormattingEnabled = true;
            this.cbxInputPort.Location = new System.Drawing.Point(122, 62);
            this.cbxInputPort.Name = "cbxInputPort";
            this.cbxInputPort.Size = new System.Drawing.Size(155, 21);
            this.cbxInputPort.TabIndex = 8;
            // 
            // cbxOutputPort
            // 
            this.cbxOutputPort.BackColor = System.Drawing.Color.Gray;
            this.cbxOutputPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxOutputPort.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.cbxOutputPort.FormattingEnabled = true;
            this.cbxOutputPort.Location = new System.Drawing.Point(122, 97);
            this.cbxOutputPort.Name = "cbxOutputPort";
            this.cbxOutputPort.Size = new System.Drawing.Size(155, 21);
            this.cbxOutputPort.TabIndex = 7;
            // 
            // btnClose
            // 
            this.btnClose.FlatAppearance.BorderSize = 0;
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClose.ForeColor = System.Drawing.Color.White;
            this.btnClose.Location = new System.Drawing.Point(337, 1);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(35, 35);
            this.btnClose.TabIndex = 12;
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // lblFormName
            // 
            this.lblFormName.AutoSize = true;
            this.lblFormName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFormName.ForeColor = System.Drawing.Color.White;
            this.lblFormName.Location = new System.Drawing.Point(9, 9);
            this.lblFormName.Name = "lblFormName";
            this.lblFormName.Size = new System.Drawing.Size(91, 16);
            this.lblFormName.TabIndex = 13;
            this.lblFormName.Text = "Port Setting";
            // 
            // btnSave
            // 
            this.btnSave.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnSave.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnSave.FlatAppearance.BorderSize = 0;
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            this.btnSave.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnSave.Location = new System.Drawing.Point(134, 157);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(100, 35);
            this.btnSave.TabIndex = 14;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnTesting
            // 
            this.btnTesting.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnTesting.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnTesting.FlatAppearance.BorderSize = 0;
            this.btnTesting.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTesting.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            this.btnTesting.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnTesting.Location = new System.Drawing.Point(12, 157);
            this.btnTesting.Name = "btnTesting";
            this.btnTesting.Size = new System.Drawing.Size(100, 35);
            this.btnTesting.TabIndex = 15;
            this.btnTesting.Text = "Testing";
            this.btnTesting.UseVisualStyleBackColor = false;
            this.btnTesting.Click += new System.EventHandler(this.btnTesting_Click);
            // 
            // btnExit
            // 
            this.btnExit.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnExit.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnExit.FlatAppearance.BorderSize = 0;
            this.btnExit.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnExit.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold);
            this.btnExit.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnExit.Location = new System.Drawing.Point(255, 157);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(100, 35);
            this.btnExit.TabIndex = 16;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = false;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // label3
            // 
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label3.Dock = System.Windows.Forms.DockStyle.Top;
            this.label3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label3.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label3.Location = new System.Drawing.Point(0, 0);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(373, 2);
            this.label3.TabIndex = 43;
            // 
            // label1
            // 
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.label1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label1.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label1.Location = new System.Drawing.Point(0, 233);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(373, 2);
            this.label1.TabIndex = 44;
            // 
            // label2
            // 
            this.label2.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label2.Dock = System.Windows.Forms.DockStyle.Left;
            this.label2.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label2.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label2.Location = new System.Drawing.Point(0, 2);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(2, 231);
            this.label2.TabIndex = 45;
            // 
            // label4
            // 
            this.label4.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label4.Dock = System.Windows.Forms.DockStyle.Right;
            this.label4.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label4.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label4.Location = new System.Drawing.Point(371, 2);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(2, 231);
            this.label4.TabIndex = 46;
            // 
            // PortSettingForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(373, 235);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnTesting);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.lblFormName);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.cbxOutputPort);
            this.Controls.Add(this.cbxInputPort);
            this.Controls.Add(this.lblOutputPort);
            this.Controls.Add(this.lblInputPort);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "PortSettingForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Port Setting";
            this.Load += new System.EventHandler(this.frmPortSetting_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblInputPort;
        private System.Windows.Forms.Label lblOutputPort;
        private System.Windows.Forms.ComboBox cbxInputPort;
        private System.Windows.Forms.ComboBox cbxOutputPort;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.Label lblFormName;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnSave;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnTesting;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnExit;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;



    }
}