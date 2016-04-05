namespace PSSC.VirtualMachine.App
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
            this.btnTesting = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lblInputPort
            // 
            this.lblInputPort.AutoSize = true;
            this.lblInputPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInputPort.ForeColor = System.Drawing.Color.White;
            this.lblInputPort.Location = new System.Drawing.Point(31, 65);
            this.lblInputPort.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblInputPort.Name = "lblInputPort";
            this.lblInputPort.Size = new System.Drawing.Size(73, 16);
            this.lblInputPort.TabIndex = 0;
            this.lblInputPort.Text = "Input Port";
            // 
            // lblOutputPort
            // 
            this.lblOutputPort.AutoSize = true;
            this.lblOutputPort.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOutputPort.ForeColor = System.Drawing.Color.White;
            this.lblOutputPort.Location = new System.Drawing.Point(31, 100);
            this.lblOutputPort.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.lblOutputPort.Name = "lblOutputPort";
            this.lblOutputPort.Size = new System.Drawing.Size(84, 16);
            this.lblOutputPort.TabIndex = 0;
            this.lblOutputPort.Text = "Output Port";
            // 
            // cbxInputPort
            // 
            this.cbxInputPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxInputPort.FormattingEnabled = true;
            this.cbxInputPort.Location = new System.Drawing.Point(122, 62);
            this.cbxInputPort.Name = "cbxInputPort";
            this.cbxInputPort.Size = new System.Drawing.Size(155, 24);
            this.cbxInputPort.TabIndex = 1;
            // 
            // cbxOutputPort
            // 
            this.cbxOutputPort.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbxOutputPort.FormattingEnabled = true;
            this.cbxOutputPort.Location = new System.Drawing.Point(122, 97);
            this.cbxOutputPort.Name = "cbxOutputPort";
            this.cbxOutputPort.Size = new System.Drawing.Size(155, 24);
            this.cbxOutputPort.TabIndex = 1;
            // 
            // btnTesting
            // 
            this.btnTesting.BackColor = System.Drawing.Color.SteelBlue;
            this.btnTesting.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnTesting.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTesting.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTesting.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnTesting.Location = new System.Drawing.Point(12, 157);
            this.btnTesting.Name = "btnTesting";
            this.btnTesting.Size = new System.Drawing.Size(100, 35);
            this.btnTesting.TabIndex = 3;
            this.btnTesting.Text = "Testing";
            this.btnTesting.UseVisualStyleBackColor = false;
            this.btnTesting.Click += new System.EventHandler(this.btnTesting_Click);
            // 
            // btnSave
            // 
            this.btnSave.BackColor = System.Drawing.Color.SteelBlue;
            this.btnSave.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnSave.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnSave.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSave.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnSave.Location = new System.Drawing.Point(134, 157);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(100, 35);
            this.btnSave.TabIndex = 4;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnExit
            // 
            this.btnExit.BackColor = System.Drawing.Color.SteelBlue;
            this.btnExit.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnExit.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnExit.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnExit.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnExit.Location = new System.Drawing.Point(255, 157);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(100, 35);
            this.btnExit.TabIndex = 4;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = false;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // PortSettingForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.WindowFrame;
            this.ClientSize = new System.Drawing.Size(367, 231);
            this.Controls.Add(this.btnTesting);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.cbxOutputPort);
            this.Controls.Add(this.cbxInputPort);
            this.Controls.Add(this.lblOutputPort);
            this.Controls.Add(this.lblInputPort);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "PortSettingForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
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
        private System.Windows.Forms.Button btnTesting;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnExit;

    }
}