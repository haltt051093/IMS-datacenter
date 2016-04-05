namespace PSSC.App
{
    partial class UIMainForm
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
            this.btnPortConfig = new System.Windows.Forms.Button();
            this.btnRepository = new System.Windows.Forms.Button();
            this.btnReport = new System.Windows.Forms.Button();
            this.pnlForms = new System.Windows.Forms.Panel();
            this.lblFormName = new System.Windows.Forms.Label();
            this.lblStatus_Connection = new System.Windows.Forms.Label();
            this.btnMinimize = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnPortConfig
            // 
            this.btnPortConfig.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnPortConfig.FlatAppearance.BorderSize = 0;
            this.btnPortConfig.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnPortConfig.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPortConfig.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.btnPortConfig.Location = new System.Drawing.Point(196, 29);
            this.btnPortConfig.Name = "btnPortConfig";
            this.btnPortConfig.Size = new System.Drawing.Size(127, 35);
            this.btnPortConfig.TabIndex = 0;
            this.btnPortConfig.Text = "CONFIGURATION";
            this.btnPortConfig.UseVisualStyleBackColor = false;
            this.btnPortConfig.Click += new System.EventHandler(this.btnPortConfig_Click);
            // 
            // btnRepository
            // 
            this.btnRepository.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnRepository.FlatAppearance.BorderSize = 0;
            this.btnRepository.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRepository.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.btnRepository.Location = new System.Drawing.Point(8, 29);
            this.btnRepository.Name = "btnRepository";
            this.btnRepository.Size = new System.Drawing.Size(104, 35);
            this.btnRepository.TabIndex = 0;
            this.btnRepository.Text = "REPOSITORY";
            this.btnRepository.UseVisualStyleBackColor = false;
            this.btnRepository.Click += new System.EventHandler(this.btnRepository_Click);
            // 
            // btnReport
            // 
            this.btnReport.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnReport.FlatAppearance.BorderSize = 0;
            this.btnReport.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnReport.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReport.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.btnReport.Location = new System.Drawing.Point(118, 29);
            this.btnReport.Name = "btnReport";
            this.btnReport.Size = new System.Drawing.Size(72, 35);
            this.btnReport.TabIndex = 0;
            this.btnReport.Text = "REPORT";
            this.btnReport.UseVisualStyleBackColor = false;
            this.btnReport.Click += new System.EventHandler(this.btnReport_Click);
            // 
            // pnlForms
            // 
            this.pnlForms.Location = new System.Drawing.Point(8, 70);
            this.pnlForms.Name = "pnlForms";
            this.pnlForms.Size = new System.Drawing.Size(794, 592);
            this.pnlForms.TabIndex = 1;
            // 
            // lblFormName
            // 
            this.lblFormName.AutoSize = true;
            this.lblFormName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFormName.ForeColor = System.Drawing.Color.White;
            this.lblFormName.Location = new System.Drawing.Point(9, 9);
            this.lblFormName.Name = "lblFormName";
            this.lblFormName.Size = new System.Drawing.Size(166, 16);
            this.lblFormName.TabIndex = 2;
            this.lblFormName.Text = "Product Sorted System";
            // 
            // lblStatus_Connection
            // 
            this.lblStatus_Connection.AutoSize = true;
            this.lblStatus_Connection.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStatus_Connection.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(128)))), ((int)(((byte)(0)))));
            this.lblStatus_Connection.Location = new System.Drawing.Point(4, 670);
            this.lblStatus_Connection.Name = "lblStatus_Connection";
            this.lblStatus_Connection.Size = new System.Drawing.Size(113, 13);
            this.lblStatus_Connection.TabIndex = 3;
            this.lblStatus_Connection.Text = "Ports: Connection Fail!";
            // 
            // btnMinimize
            // 
            this.btnMinimize.FlatAppearance.BorderSize = 0;
            this.btnMinimize.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMinimize.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnMinimize.ForeColor = System.Drawing.Color.White;
            this.btnMinimize.Location = new System.Drawing.Point(742, 1);
            this.btnMinimize.Name = "btnMinimize";
            this.btnMinimize.Size = new System.Drawing.Size(35, 35);
            this.btnMinimize.TabIndex = 4;
            this.btnMinimize.UseVisualStyleBackColor = true;
            this.btnMinimize.Click += new System.EventHandler(this.btnMinimize_Click);
            // 
            // btnClose
            // 
            this.btnClose.FlatAppearance.BorderSize = 0;
            this.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClose.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClose.ForeColor = System.Drawing.Color.White;
            this.btnClose.Location = new System.Drawing.Point(778, 1);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(35, 35);
            this.btnClose.TabIndex = 5;
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // UIMainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(814, 690);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnMinimize);
            this.Controls.Add(this.lblStatus_Connection);
            this.Controls.Add(this.lblFormName);
            this.Controls.Add(this.pnlForms);
            this.Controls.Add(this.btnReport);
            this.Controls.Add(this.btnRepository);
            this.Controls.Add(this.btnPortConfig);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "UIMainForm";
            this.Text = "UIMainForm";
            this.Load += new System.EventHandler(this.frmUIMain_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnPortConfig;
        private System.Windows.Forms.Button btnRepository;
        private System.Windows.Forms.Button btnReport;
        private System.Windows.Forms.Panel pnlForms;
        private System.Windows.Forms.Label lblFormName;
        private System.Windows.Forms.Label lblStatus_Connection;
        private System.Windows.Forms.Button btnMinimize;
        private System.Windows.Forms.Button btnClose;


    }
}