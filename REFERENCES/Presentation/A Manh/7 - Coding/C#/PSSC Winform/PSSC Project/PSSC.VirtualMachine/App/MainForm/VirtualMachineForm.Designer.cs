namespace PSSC.VirtualMachine.App
{
    partial class frmVirtualMachine
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
            this.components = new System.ComponentModel.Container();
            this.gbxInputMarbles = new System.Windows.Forms.GroupBox();
            this.lblStatus_InputMarbles = new System.Windows.Forms.Label();
            this.btnClear_InputMarbles = new System.Windows.Forms.Button();
            this.rtbLog_InputMarbles = new System.Windows.Forms.RichTextBox();
            this.btnInputRedMarble = new System.Windows.Forms.Button();
            this.btnInputPinkMarble = new System.Windows.Forms.Button();
            this.btnInputGreenMarble = new System.Windows.Forms.Button();
            this.btnInputBlueMarble = new System.Windows.Forms.Button();
            this.btnInputPurpleMarble = new System.Windows.Forms.Button();
            this.gbxOutputMarbles = new System.Windows.Forms.GroupBox();
            this.lblStatus_OutputMarbles = new System.Windows.Forms.Label();
            this.btnClear_OutputMarbles = new System.Windows.Forms.Button();
            this.rtbLog_OutputMarbles = new System.Windows.Forms.RichTextBox();
            this.gbxRepository = new System.Windows.Forms.GroupBox();
            this.lblPinkRepository = new System.Windows.Forms.Label();
            this.lblPurpleRepository = new System.Windows.Forms.Label();
            this.lblBlueRepository = new System.Windows.Forms.Label();
            this.lblGreenRepository = new System.Windows.Forms.Label();
            this.lblRedRepository = new System.Windows.Forms.Label();
            this.txtPinkRepository = new System.Windows.Forms.TextBox();
            this.txtPurpleRepository = new System.Windows.Forms.TextBox();
            this.txtBlueRepository = new System.Windows.Forms.TextBox();
            this.txtGreenRepository = new System.Windows.Forms.TextBox();
            this.txtRedRepository = new System.Windows.Forms.TextBox();
            this.lblRepositorySizeLimits = new System.Windows.Forms.Label();
            this.txtRepositorySizeLimits = new System.Windows.Forms.TextBox();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnUpdateData = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.serialPort1 = new System.IO.Ports.SerialPort(this.components);
            this.serialPort2 = new System.IO.Ports.SerialPort(this.components);
            this.lblConfiguration = new System.Windows.Forms.LinkLabel();
            this.btnQuickTesting = new System.Windows.Forms.Button();
            this.gbxInputMarbles.SuspendLayout();
            this.gbxOutputMarbles.SuspendLayout();
            this.gbxRepository.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // gbxInputMarbles
            // 
            this.gbxInputMarbles.Controls.Add(this.lblStatus_InputMarbles);
            this.gbxInputMarbles.Controls.Add(this.btnClear_InputMarbles);
            this.gbxInputMarbles.Controls.Add(this.rtbLog_InputMarbles);
            this.gbxInputMarbles.Controls.Add(this.btnInputRedMarble);
            this.gbxInputMarbles.Controls.Add(this.btnInputPinkMarble);
            this.gbxInputMarbles.Controls.Add(this.btnInputGreenMarble);
            this.gbxInputMarbles.Controls.Add(this.btnInputBlueMarble);
            this.gbxInputMarbles.Controls.Add(this.btnInputPurpleMarble);
            this.gbxInputMarbles.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxInputMarbles.ForeColor = System.Drawing.SystemColors.Window;
            this.gbxInputMarbles.Location = new System.Drawing.Point(23, 152);
            this.gbxInputMarbles.Name = "gbxInputMarbles";
            this.gbxInputMarbles.Size = new System.Drawing.Size(469, 322);
            this.gbxInputMarbles.TabIndex = 0;
            this.gbxInputMarbles.TabStop = false;
            this.gbxInputMarbles.Text = "Input Marbles";
            // 
            // lblStatus_InputMarbles
            // 
            this.lblStatus_InputMarbles.AutoSize = true;
            this.lblStatus_InputMarbles.ForeColor = System.Drawing.Color.Orange;
            this.lblStatus_InputMarbles.Location = new System.Drawing.Point(153, 36);
            this.lblStatus_InputMarbles.Name = "lblStatus_InputMarbles";
            this.lblStatus_InputMarbles.Size = new System.Drawing.Size(137, 16);
            this.lblStatus_InputMarbles.TabIndex = 3;
            this.lblStatus_InputMarbles.Text = "Connection Failed!";
            // 
            // btnClear_InputMarbles
            // 
            this.btnClear_InputMarbles.BackColor = System.Drawing.Color.Gray;
            this.btnClear_InputMarbles.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnClear_InputMarbles.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClear_InputMarbles.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnClear_InputMarbles.Location = new System.Drawing.Point(354, 31);
            this.btnClear_InputMarbles.Name = "btnClear_InputMarbles";
            this.btnClear_InputMarbles.Size = new System.Drawing.Size(82, 26);
            this.btnClear_InputMarbles.TabIndex = 2;
            this.btnClear_InputMarbles.Text = "Clear";
            this.btnClear_InputMarbles.UseVisualStyleBackColor = false;
            this.btnClear_InputMarbles.Click += new System.EventHandler(this.btnClear_InputMarbles_Click);
            // 
            // rtbLog_InputMarbles
            // 
            this.rtbLog_InputMarbles.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.rtbLog_InputMarbles.Location = new System.Drawing.Point(156, 63);
            this.rtbLog_InputMarbles.Name = "rtbLog_InputMarbles";
            this.rtbLog_InputMarbles.ReadOnly = true;
            this.rtbLog_InputMarbles.Size = new System.Drawing.Size(280, 229);
            this.rtbLog_InputMarbles.TabIndex = 1;
            this.rtbLog_InputMarbles.Text = "";
            // 
            // btnInputRedMarble
            // 
            this.btnInputRedMarble.BackColor = System.Drawing.Color.DarkRed;
            this.btnInputRedMarble.FlatAppearance.BorderColor = System.Drawing.Color.LightCoral;
            this.btnInputRedMarble.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInputRedMarble.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInputRedMarble.ForeColor = System.Drawing.Color.LightCoral;
            this.btnInputRedMarble.Location = new System.Drawing.Point(33, 63);
            this.btnInputRedMarble.Name = "btnInputRedMarble";
            this.btnInputRedMarble.Size = new System.Drawing.Size(106, 41);
            this.btnInputRedMarble.TabIndex = 0;
            this.btnInputRedMarble.Text = "RED";
            this.btnInputRedMarble.UseVisualStyleBackColor = false;
            this.btnInputRedMarble.Click += new System.EventHandler(this.btnInputMarbles_Click);
            // 
            // btnInputPinkMarble
            // 
            this.btnInputPinkMarble.BackColor = System.Drawing.Color.DeepPink;
            this.btnInputPinkMarble.FlatAppearance.BorderColor = System.Drawing.Color.LavenderBlush;
            this.btnInputPinkMarble.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInputPinkMarble.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInputPinkMarble.ForeColor = System.Drawing.Color.LavenderBlush;
            this.btnInputPinkMarble.Location = new System.Drawing.Point(33, 251);
            this.btnInputPinkMarble.Name = "btnInputPinkMarble";
            this.btnInputPinkMarble.Size = new System.Drawing.Size(106, 41);
            this.btnInputPinkMarble.TabIndex = 0;
            this.btnInputPinkMarble.Text = "PINK";
            this.btnInputPinkMarble.UseVisualStyleBackColor = false;
            this.btnInputPinkMarble.Click += new System.EventHandler(this.btnInputMarbles_Click);
            // 
            // btnInputGreenMarble
            // 
            this.btnInputGreenMarble.BackColor = System.Drawing.Color.DarkGreen;
            this.btnInputGreenMarble.FlatAppearance.BorderColor = System.Drawing.Color.LightGreen;
            this.btnInputGreenMarble.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInputGreenMarble.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInputGreenMarble.ForeColor = System.Drawing.Color.LightGreen;
            this.btnInputGreenMarble.Location = new System.Drawing.Point(33, 110);
            this.btnInputGreenMarble.Name = "btnInputGreenMarble";
            this.btnInputGreenMarble.Size = new System.Drawing.Size(106, 41);
            this.btnInputGreenMarble.TabIndex = 0;
            this.btnInputGreenMarble.Text = "GREEN";
            this.btnInputGreenMarble.UseVisualStyleBackColor = false;
            this.btnInputGreenMarble.Click += new System.EventHandler(this.btnInputMarbles_Click);
            // 
            // btnInputBlueMarble
            // 
            this.btnInputBlueMarble.BackColor = System.Drawing.Color.MediumBlue;
            this.btnInputBlueMarble.FlatAppearance.BorderColor = System.Drawing.Color.DeepSkyBlue;
            this.btnInputBlueMarble.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInputBlueMarble.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInputBlueMarble.ForeColor = System.Drawing.Color.LightSkyBlue;
            this.btnInputBlueMarble.Location = new System.Drawing.Point(33, 157);
            this.btnInputBlueMarble.Name = "btnInputBlueMarble";
            this.btnInputBlueMarble.Size = new System.Drawing.Size(106, 41);
            this.btnInputBlueMarble.TabIndex = 0;
            this.btnInputBlueMarble.Text = "BLUE";
            this.btnInputBlueMarble.UseVisualStyleBackColor = false;
            this.btnInputBlueMarble.Click += new System.EventHandler(this.btnInputMarbles_Click);
            // 
            // btnInputPurpleMarble
            // 
            this.btnInputPurpleMarble.BackColor = System.Drawing.Color.DarkViolet;
            this.btnInputPurpleMarble.FlatAppearance.BorderColor = System.Drawing.Color.Plum;
            this.btnInputPurpleMarble.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnInputPurpleMarble.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInputPurpleMarble.ForeColor = System.Drawing.Color.Thistle;
            this.btnInputPurpleMarble.Location = new System.Drawing.Point(33, 204);
            this.btnInputPurpleMarble.Name = "btnInputPurpleMarble";
            this.btnInputPurpleMarble.Size = new System.Drawing.Size(106, 41);
            this.btnInputPurpleMarble.TabIndex = 0;
            this.btnInputPurpleMarble.Text = "PURPLE";
            this.btnInputPurpleMarble.UseVisualStyleBackColor = false;
            this.btnInputPurpleMarble.Click += new System.EventHandler(this.btnInputMarbles_Click);
            // 
            // gbxOutputMarbles
            // 
            this.gbxOutputMarbles.Controls.Add(this.lblStatus_OutputMarbles);
            this.gbxOutputMarbles.Controls.Add(this.btnClear_OutputMarbles);
            this.gbxOutputMarbles.Controls.Add(this.rtbLog_OutputMarbles);
            this.gbxOutputMarbles.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbxOutputMarbles.ForeColor = System.Drawing.SystemColors.Window;
            this.gbxOutputMarbles.Location = new System.Drawing.Point(508, 152);
            this.gbxOutputMarbles.Name = "gbxOutputMarbles";
            this.gbxOutputMarbles.Size = new System.Drawing.Size(326, 322);
            this.gbxOutputMarbles.TabIndex = 1;
            this.gbxOutputMarbles.TabStop = false;
            this.gbxOutputMarbles.Text = "Output Marbles";
            // 
            // lblStatus_OutputMarbles
            // 
            this.lblStatus_OutputMarbles.AutoSize = true;
            this.lblStatus_OutputMarbles.ForeColor = System.Drawing.Color.Orange;
            this.lblStatus_OutputMarbles.Location = new System.Drawing.Point(19, 36);
            this.lblStatus_OutputMarbles.Name = "lblStatus_OutputMarbles";
            this.lblStatus_OutputMarbles.Size = new System.Drawing.Size(137, 16);
            this.lblStatus_OutputMarbles.TabIndex = 3;
            this.lblStatus_OutputMarbles.Text = "Connection Failed!";
            // 
            // btnClear_OutputMarbles
            // 
            this.btnClear_OutputMarbles.BackColor = System.Drawing.Color.Gray;
            this.btnClear_OutputMarbles.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnClear_OutputMarbles.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClear_OutputMarbles.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnClear_OutputMarbles.Location = new System.Drawing.Point(222, 31);
            this.btnClear_OutputMarbles.Name = "btnClear_OutputMarbles";
            this.btnClear_OutputMarbles.Size = new System.Drawing.Size(82, 26);
            this.btnClear_OutputMarbles.TabIndex = 2;
            this.btnClear_OutputMarbles.Text = "Clear";
            this.btnClear_OutputMarbles.UseVisualStyleBackColor = false;
            this.btnClear_OutputMarbles.Click += new System.EventHandler(this.btnClear_OutputMarbles_Click);
            // 
            // rtbLog_OutputMarbles
            // 
            this.rtbLog_OutputMarbles.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(224)))), ((int)(((byte)(224)))), ((int)(((byte)(224)))));
            this.rtbLog_OutputMarbles.Location = new System.Drawing.Point(22, 63);
            this.rtbLog_OutputMarbles.Name = "rtbLog_OutputMarbles";
            this.rtbLog_OutputMarbles.ReadOnly = true;
            this.rtbLog_OutputMarbles.Size = new System.Drawing.Size(280, 229);
            this.rtbLog_OutputMarbles.TabIndex = 1;
            this.rtbLog_OutputMarbles.Text = "";
            // 
            // gbxRepository
            // 
            this.gbxRepository.Controls.Add(this.lblPinkRepository);
            this.gbxRepository.Controls.Add(this.lblPurpleRepository);
            this.gbxRepository.Controls.Add(this.lblBlueRepository);
            this.gbxRepository.Controls.Add(this.lblGreenRepository);
            this.gbxRepository.Controls.Add(this.lblRedRepository);
            this.gbxRepository.Controls.Add(this.txtPinkRepository);
            this.gbxRepository.Controls.Add(this.txtPurpleRepository);
            this.gbxRepository.Controls.Add(this.txtBlueRepository);
            this.gbxRepository.Controls.Add(this.txtGreenRepository);
            this.gbxRepository.Controls.Add(this.txtRedRepository);
            this.gbxRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.gbxRepository.ForeColor = System.Drawing.SystemColors.Window;
            this.gbxRepository.Location = new System.Drawing.Point(23, 23);
            this.gbxRepository.Name = "gbxRepository";
            this.gbxRepository.Size = new System.Drawing.Size(503, 114);
            this.gbxRepository.TabIndex = 2;
            this.gbxRepository.TabStop = false;
            this.gbxRepository.Text = "Repository";
            // 
            // lblPinkRepository
            // 
            this.lblPinkRepository.AutoSize = true;
            this.lblPinkRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPinkRepository.ForeColor = System.Drawing.Color.HotPink;
            this.lblPinkRepository.Location = new System.Drawing.Point(407, 31);
            this.lblPinkRepository.Name = "lblPinkRepository";
            this.lblPinkRepository.Size = new System.Drawing.Size(56, 24);
            this.lblPinkRepository.TabIndex = 1;
            this.lblPinkRepository.Text = "PINK";
            // 
            // lblPurpleRepository
            // 
            this.lblPurpleRepository.AutoSize = true;
            this.lblPurpleRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPurpleRepository.ForeColor = System.Drawing.Color.Thistle;
            this.lblPurpleRepository.Location = new System.Drawing.Point(302, 31);
            this.lblPurpleRepository.Name = "lblPurpleRepository";
            this.lblPurpleRepository.Size = new System.Drawing.Size(89, 24);
            this.lblPurpleRepository.TabIndex = 1;
            this.lblPurpleRepository.Text = "PURPLE";
            // 
            // lblBlueRepository
            // 
            this.lblBlueRepository.AutoSize = true;
            this.lblBlueRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblBlueRepository.ForeColor = System.Drawing.Color.LightSkyBlue;
            this.lblBlueRepository.Location = new System.Drawing.Point(228, 31);
            this.lblBlueRepository.Name = "lblBlueRepository";
            this.lblBlueRepository.Size = new System.Drawing.Size(62, 24);
            this.lblBlueRepository.TabIndex = 1;
            this.lblBlueRepository.Text = "BLUE";
            // 
            // lblGreenRepository
            // 
            this.lblGreenRepository.AutoSize = true;
            this.lblGreenRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblGreenRepository.ForeColor = System.Drawing.Color.LightGreen;
            this.lblGreenRepository.Location = new System.Drawing.Point(128, 31);
            this.lblGreenRepository.Name = "lblGreenRepository";
            this.lblGreenRepository.Size = new System.Drawing.Size(82, 24);
            this.lblGreenRepository.TabIndex = 1;
            this.lblGreenRepository.Text = "GREEN";
            // 
            // lblRedRepository
            // 
            this.lblRedRepository.AutoSize = true;
            this.lblRedRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRedRepository.ForeColor = System.Drawing.Color.LightCoral;
            this.lblRedRepository.Location = new System.Drawing.Point(56, 31);
            this.lblRedRepository.Name = "lblRedRepository";
            this.lblRedRepository.Size = new System.Drawing.Size(52, 24);
            this.lblRedRepository.TabIndex = 1;
            this.lblRedRepository.Text = "RED";
            // 
            // txtPinkRepository
            // 
            this.txtPinkRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPinkRepository.Location = new System.Drawing.Point(403, 58);
            this.txtPinkRepository.Multiline = true;
            this.txtPinkRepository.Name = "txtPinkRepository";
            this.txtPinkRepository.ReadOnly = true;
            this.txtPinkRepository.Size = new System.Drawing.Size(66, 37);
            this.txtPinkRepository.TabIndex = 0;
            this.txtPinkRepository.Text = "1";
            this.txtPinkRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtPurpleRepository
            // 
            this.txtPurpleRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPurpleRepository.Location = new System.Drawing.Point(314, 58);
            this.txtPurpleRepository.Multiline = true;
            this.txtPurpleRepository.Name = "txtPurpleRepository";
            this.txtPurpleRepository.ReadOnly = true;
            this.txtPurpleRepository.Size = new System.Drawing.Size(66, 37);
            this.txtPurpleRepository.TabIndex = 0;
            this.txtPurpleRepository.Text = "1";
            this.txtPurpleRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtBlueRepository
            // 
            this.txtBlueRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBlueRepository.Location = new System.Drawing.Point(225, 58);
            this.txtBlueRepository.Multiline = true;
            this.txtBlueRepository.Name = "txtBlueRepository";
            this.txtBlueRepository.ReadOnly = true;
            this.txtBlueRepository.Size = new System.Drawing.Size(66, 37);
            this.txtBlueRepository.TabIndex = 0;
            this.txtBlueRepository.Text = "1";
            this.txtBlueRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtGreenRepository
            // 
            this.txtGreenRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGreenRepository.Location = new System.Drawing.Point(136, 58);
            this.txtGreenRepository.Multiline = true;
            this.txtGreenRepository.Name = "txtGreenRepository";
            this.txtGreenRepository.ReadOnly = true;
            this.txtGreenRepository.Size = new System.Drawing.Size(66, 37);
            this.txtGreenRepository.TabIndex = 0;
            this.txtGreenRepository.Text = "1";
            this.txtGreenRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtRedRepository
            // 
            this.txtRedRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRedRepository.Location = new System.Drawing.Point(47, 58);
            this.txtRedRepository.Multiline = true;
            this.txtRedRepository.Name = "txtRedRepository";
            this.txtRedRepository.ReadOnly = true;
            this.txtRedRepository.Size = new System.Drawing.Size(66, 37);
            this.txtRedRepository.TabIndex = 0;
            this.txtRedRepository.Text = "1";
            this.txtRedRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // lblRepositorySizeLimits
            // 
            this.lblRepositorySizeLimits.AutoSize = true;
            this.lblRepositorySizeLimits.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblRepositorySizeLimits.ForeColor = System.Drawing.SystemColors.Window;
            this.lblRepositorySizeLimits.Location = new System.Drawing.Point(19, 18);
            this.lblRepositorySizeLimits.Name = "lblRepositorySizeLimits";
            this.lblRepositorySizeLimits.Size = new System.Drawing.Size(112, 24);
            this.lblRepositorySizeLimits.TabIndex = 1;
            this.lblRepositorySizeLimits.Text = "SIZE LIMIT";
            // 
            // txtRepositorySizeLimits
            // 
            this.txtRepositorySizeLimits.BackColor = System.Drawing.SystemColors.Menu;
            this.txtRepositorySizeLimits.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRepositorySizeLimits.Location = new System.Drawing.Point(137, 11);
            this.txtRepositorySizeLimits.Multiline = true;
            this.txtRepositorySizeLimits.Name = "txtRepositorySizeLimits";
            this.txtRepositorySizeLimits.ReadOnly = true;
            this.txtRepositorySizeLimits.Size = new System.Drawing.Size(66, 37);
            this.txtRepositorySizeLimits.TabIndex = 0;
            this.txtRepositorySizeLimits.Text = "1";
            this.txtRepositorySizeLimits.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnReset
            // 
            this.btnReset.BackColor = System.Drawing.Color.SteelBlue;
            this.btnReset.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnReset.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnReset.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnReset.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnReset.Location = new System.Drawing.Point(137, 67);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(100, 35);
            this.btnReset.TabIndex = 2;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = false;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnUpdateData
            // 
            this.btnUpdateData.BackColor = System.Drawing.Color.SteelBlue;
            this.btnUpdateData.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnUpdateData.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUpdateData.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdateData.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnUpdateData.Location = new System.Drawing.Point(23, 67);
            this.btnUpdateData.Name = "btnUpdateData";
            this.btnUpdateData.Size = new System.Drawing.Size(100, 35);
            this.btnUpdateData.TabIndex = 2;
            this.btnUpdateData.Text = "Update Data";
            this.btnUpdateData.UseVisualStyleBackColor = false;
            this.btnUpdateData.Click += new System.EventHandler(this.btnUpdateData_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnUpdateData);
            this.panel1.Controls.Add(this.btnReset);
            this.panel1.Controls.Add(this.lblRepositorySizeLimits);
            this.panel1.Controls.Add(this.txtRepositorySizeLimits);
            this.panel1.Location = new System.Drawing.Point(535, 32);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(277, 105);
            this.panel1.TabIndex = 3;
            // 
            // lblConfiguration
            // 
            this.lblConfiguration.AutoSize = true;
            this.lblConfiguration.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblConfiguration.LinkColor = System.Drawing.Color.White;
            this.lblConfiguration.Location = new System.Drawing.Point(613, 8);
            this.lblConfiguration.Name = "lblConfiguration";
            this.lblConfiguration.Size = new System.Drawing.Size(82, 13);
            this.lblConfiguration.TabIndex = 4;
            this.lblConfiguration.TabStop = true;
            this.lblConfiguration.Text = "Configuration";
            this.lblConfiguration.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.lblConfiguration_LinkClicked);
            // 
            // btnQuickTesting
            // 
            this.btnQuickTesting.BackColor = System.Drawing.Color.Firebrick;
            this.btnQuickTesting.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnQuickTesting.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQuickTesting.ForeColor = System.Drawing.Color.Salmon;
            this.btnQuickTesting.Location = new System.Drawing.Point(706, 3);
            this.btnQuickTesting.Name = "btnQuickTesting";
            this.btnQuickTesting.Size = new System.Drawing.Size(104, 23);
            this.btnQuickTesting.TabIndex = 5;
            this.btnQuickTesting.Text = "Quick Testing";
            this.btnQuickTesting.UseVisualStyleBackColor = false;
            this.btnQuickTesting.Click += new System.EventHandler(this.btnQuickTesting_Click);
            // 
            // frmVirtualMachine
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(871, 493);
            this.Controls.Add(this.btnQuickTesting);
            this.Controls.Add(this.lblConfiguration);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.gbxRepository);
            this.Controls.Add(this.gbxOutputMarbles);
            this.Controls.Add(this.gbxInputMarbles);
            this.ForeColor = System.Drawing.SystemColors.Window;
            this.Name = "frmVirtualMachine";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Virtual Machine";
            this.Load += new System.EventHandler(this.frmVirtualMachine_Load);
            this.gbxInputMarbles.ResumeLayout(false);
            this.gbxInputMarbles.PerformLayout();
            this.gbxOutputMarbles.ResumeLayout(false);
            this.gbxOutputMarbles.PerformLayout();
            this.gbxRepository.ResumeLayout(false);
            this.gbxRepository.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox gbxInputMarbles;
        private System.Windows.Forms.Button btnInputPurpleMarble;
        private System.Windows.Forms.Button btnInputRedMarble;
        private System.Windows.Forms.Button btnInputGreenMarble;
        private System.Windows.Forms.Button btnInputBlueMarble;
        private System.Windows.Forms.Button btnInputPinkMarble;
        private System.Windows.Forms.Button btnClear_InputMarbles;
        private System.Windows.Forms.RichTextBox rtbLog_InputMarbles;
        private System.Windows.Forms.GroupBox gbxOutputMarbles;
        private System.Windows.Forms.RichTextBox rtbLog_OutputMarbles;
        private System.Windows.Forms.GroupBox gbxRepository;
        private System.Windows.Forms.TextBox txtPinkRepository;
        private System.Windows.Forms.TextBox txtPurpleRepository;
        private System.Windows.Forms.TextBox txtBlueRepository;
        private System.Windows.Forms.TextBox txtGreenRepository;
        private System.Windows.Forms.TextBox txtRedRepository;
        private System.Windows.Forms.Label lblRedRepository;
        private System.Windows.Forms.Label lblBlueRepository;
        private System.Windows.Forms.Label lblGreenRepository;
        private System.Windows.Forms.Label lblPinkRepository;
        private System.Windows.Forms.Label lblPurpleRepository;
        private System.Windows.Forms.Label lblRepositorySizeLimits;
        private System.Windows.Forms.TextBox txtRepositorySizeLimits;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnUpdateData;
        private System.Windows.Forms.Label lblStatus_InputMarbles;
        private System.Windows.Forms.Label lblStatus_OutputMarbles;
        private System.Windows.Forms.Button btnClear_OutputMarbles;
        private System.Windows.Forms.Panel panel1;
        private System.IO.Ports.SerialPort serialPort1;
        private System.IO.Ports.SerialPort serialPort2;
        private System.Windows.Forms.LinkLabel lblConfiguration;
        private System.Windows.Forms.Button btnQuickTesting;
    }
}

