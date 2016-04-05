namespace PSSC.App
{
    partial class MarblesManagementForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.rtbMessage = new System.Windows.Forms.RichTextBox();
            this.btnGetMarbles = new System.Windows.Forms.Button();
            this.btnClear = new System.Windows.Forms.Button();
            this.nudPink = new System.Windows.Forms.NumericUpDown();
            this.nudPurple = new System.Windows.Forms.NumericUpDown();
            this.nudBlue = new System.Windows.Forms.NumericUpDown();
            this.nudGreen = new System.Windows.Forms.NumericUpDown();
            this.nudRed = new System.Windows.Forms.NumericUpDown();
            this.txtTotal = new System.Windows.Forms.TextBox();
            this.txtPinkRepository = new System.Windows.Forms.TextBox();
            this.txtPurpleRepository = new System.Windows.Forms.TextBox();
            this.txtBlueRepository = new System.Windows.Forms.TextBox();
            this.txtGreenRepository = new System.Windows.Forms.TextBox();
            this.txtRedRepository = new System.Windows.Forms.TextBox();
            this.txtRepositorySizeLimits = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.pnl_DataGirdView = new System.Windows.Forms.Panel();
            this.dgvOutputMarbles = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCDataGridView();
            this.llblResetRepository = new System.Windows.Forms.LinkLabel();
            this.lblRepositorySizeLimits = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblTotal = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblEqual = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblPinkRepository = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblPurpleRepository = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblBlueRepository = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblGreenRepository = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblRedRepository = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblPinkOutput = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblPurpleOutput = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblBlueOutput = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblGreenOutput = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblOutputLimits = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblOutputLimitsTitle = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblRedOutput = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblNumbersOfPackages = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.nudNumberOfPackages = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCNumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.nudPink)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudPurple)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudBlue)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudGreen)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudRed)).BeginInit();
            this.pnl_DataGirdView.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOutputMarbles)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudNumberOfPackages)).BeginInit();
            this.SuspendLayout();
            // 
            // rtbMessage
            // 
            this.rtbMessage.BackColor = System.Drawing.Color.DimGray;
            this.rtbMessage.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.rtbMessage.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rtbMessage.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.rtbMessage.Location = new System.Drawing.Point(30, 391);
            this.rtbMessage.Name = "rtbMessage";
            this.rtbMessage.ReadOnly = true;
            this.rtbMessage.Size = new System.Drawing.Size(752, 196);
            this.rtbMessage.TabIndex = 0;
            this.rtbMessage.Text = "";
            // 
            // btnGetMarbles
            // 
            this.btnGetMarbles.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnGetMarbles.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnGetMarbles.FlatAppearance.BorderSize = 0;
            this.btnGetMarbles.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnGetMarbles.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnGetMarbles.ForeColor = System.Drawing.Color.White;
            this.btnGetMarbles.Location = new System.Drawing.Point(560, 148);
            this.btnGetMarbles.Name = "btnGetMarbles";
            this.btnGetMarbles.Size = new System.Drawing.Size(100, 35);
            this.btnGetMarbles.TabIndex = 25;
            this.btnGetMarbles.Text = "Get Marbles";
            this.btnGetMarbles.UseVisualStyleBackColor = false;
            this.btnGetMarbles.Click += new System.EventHandler(this.btnGetMarbles_Click);
            // 
            // btnClear
            // 
            this.btnClear.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.btnClear.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnClear.FlatAppearance.BorderSize = 0;
            this.btnClear.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnClear.Font = new System.Drawing.Font("Tahoma", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnClear.ForeColor = System.Drawing.Color.White;
            this.btnClear.Location = new System.Drawing.Point(679, 148);
            this.btnClear.Name = "btnClear";
            this.btnClear.Size = new System.Drawing.Size(100, 35);
            this.btnClear.TabIndex = 26;
            this.btnClear.Text = "Clear";
            this.btnClear.UseVisualStyleBackColor = false;
            this.btnClear.Click += new System.EventHandler(this.btnClear_Click);
            // 
            // nudPink
            // 
            this.nudPink.BackColor = System.Drawing.Color.Gray;
            this.nudPink.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.nudPink.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudPink.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.nudPink.Location = new System.Drawing.Point(118, 336);
            this.nudPink.Name = "nudPink";
            this.nudPink.ReadOnly = true;
            this.nudPink.Size = new System.Drawing.Size(47, 20);
            this.nudPink.TabIndex = 12;
            this.nudPink.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudPink.ValueChanged += new System.EventHandler(this.nudColor_ValueChanged);
            // 
            // nudPurple
            // 
            this.nudPurple.BackColor = System.Drawing.Color.Gray;
            this.nudPurple.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.nudPurple.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudPurple.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.nudPurple.Location = new System.Drawing.Point(118, 291);
            this.nudPurple.Name = "nudPurple";
            this.nudPurple.ReadOnly = true;
            this.nudPurple.Size = new System.Drawing.Size(47, 20);
            this.nudPurple.TabIndex = 13;
            this.nudPurple.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudPurple.ValueChanged += new System.EventHandler(this.nudColor_ValueChanged);
            // 
            // nudBlue
            // 
            this.nudBlue.BackColor = System.Drawing.Color.Gray;
            this.nudBlue.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.nudBlue.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudBlue.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.nudBlue.Location = new System.Drawing.Point(118, 246);
            this.nudBlue.Name = "nudBlue";
            this.nudBlue.ReadOnly = true;
            this.nudBlue.Size = new System.Drawing.Size(47, 20);
            this.nudBlue.TabIndex = 14;
            this.nudBlue.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudBlue.ValueChanged += new System.EventHandler(this.nudColor_ValueChanged);
            // 
            // nudGreen
            // 
            this.nudGreen.BackColor = System.Drawing.Color.Gray;
            this.nudGreen.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.nudGreen.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudGreen.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.nudGreen.Location = new System.Drawing.Point(118, 203);
            this.nudGreen.Name = "nudGreen";
            this.nudGreen.ReadOnly = true;
            this.nudGreen.Size = new System.Drawing.Size(47, 20);
            this.nudGreen.TabIndex = 15;
            this.nudGreen.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudGreen.ValueChanged += new System.EventHandler(this.nudColor_ValueChanged);
            // 
            // nudRed
            // 
            this.nudRed.BackColor = System.Drawing.Color.Gray;
            this.nudRed.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.nudRed.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudRed.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.nudRed.Location = new System.Drawing.Point(118, 160);
            this.nudRed.Name = "nudRed";
            this.nudRed.ReadOnly = true;
            this.nudRed.Size = new System.Drawing.Size(47, 20);
            this.nudRed.TabIndex = 16;
            this.nudRed.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudRed.ValueChanged += new System.EventHandler(this.nudColor_ValueChanged);
            // 
            // txtTotal
            // 
            this.txtTotal.BackColor = System.Drawing.Color.Gray;
            this.txtTotal.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotal.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtTotal.Location = new System.Drawing.Point(499, 66);
            this.txtTotal.Multiline = true;
            this.txtTotal.Name = "txtTotal";
            this.txtTotal.ReadOnly = true;
            this.txtTotal.Size = new System.Drawing.Size(66, 30);
            this.txtTotal.TabIndex = 27;
            this.txtTotal.Text = "1";
            this.txtTotal.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtPinkRepository
            // 
            this.txtPinkRepository.BackColor = System.Drawing.Color.Gray;
            this.txtPinkRepository.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtPinkRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPinkRepository.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtPinkRepository.Location = new System.Drawing.Point(383, 66);
            this.txtPinkRepository.Multiline = true;
            this.txtPinkRepository.Name = "txtPinkRepository";
            this.txtPinkRepository.ReadOnly = true;
            this.txtPinkRepository.Size = new System.Drawing.Size(66, 30);
            this.txtPinkRepository.TabIndex = 28;
            this.txtPinkRepository.Text = "1";
            this.txtPinkRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtPurpleRepository
            // 
            this.txtPurpleRepository.BackColor = System.Drawing.Color.Gray;
            this.txtPurpleRepository.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtPurpleRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPurpleRepository.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtPurpleRepository.Location = new System.Drawing.Point(294, 66);
            this.txtPurpleRepository.Multiline = true;
            this.txtPurpleRepository.Name = "txtPurpleRepository";
            this.txtPurpleRepository.ReadOnly = true;
            this.txtPurpleRepository.Size = new System.Drawing.Size(66, 30);
            this.txtPurpleRepository.TabIndex = 29;
            this.txtPurpleRepository.Text = "1";
            this.txtPurpleRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtBlueRepository
            // 
            this.txtBlueRepository.BackColor = System.Drawing.Color.Gray;
            this.txtBlueRepository.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtBlueRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBlueRepository.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtBlueRepository.Location = new System.Drawing.Point(205, 66);
            this.txtBlueRepository.Multiline = true;
            this.txtBlueRepository.Name = "txtBlueRepository";
            this.txtBlueRepository.ReadOnly = true;
            this.txtBlueRepository.Size = new System.Drawing.Size(66, 30);
            this.txtBlueRepository.TabIndex = 30;
            this.txtBlueRepository.Text = "1";
            this.txtBlueRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtGreenRepository
            // 
            this.txtGreenRepository.BackColor = System.Drawing.Color.Gray;
            this.txtGreenRepository.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtGreenRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGreenRepository.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtGreenRepository.Location = new System.Drawing.Point(116, 66);
            this.txtGreenRepository.Multiline = true;
            this.txtGreenRepository.Name = "txtGreenRepository";
            this.txtGreenRepository.ReadOnly = true;
            this.txtGreenRepository.Size = new System.Drawing.Size(66, 30);
            this.txtGreenRepository.TabIndex = 31;
            this.txtGreenRepository.Text = "1";
            this.txtGreenRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtRedRepository
            // 
            this.txtRedRepository.BackColor = System.Drawing.Color.Gray;
            this.txtRedRepository.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtRedRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRedRepository.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtRedRepository.Location = new System.Drawing.Point(27, 66);
            this.txtRedRepository.Multiline = true;
            this.txtRedRepository.Name = "txtRedRepository";
            this.txtRedRepository.ReadOnly = true;
            this.txtRedRepository.Size = new System.Drawing.Size(66, 30);
            this.txtRedRepository.TabIndex = 32;
            this.txtRedRepository.Text = "1";
            this.txtRedRepository.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // txtRepositorySizeLimits
            // 
            this.txtRepositorySizeLimits.BackColor = System.Drawing.Color.Gray;
            this.txtRepositorySizeLimits.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtRepositorySizeLimits.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRepositorySizeLimits.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtRepositorySizeLimits.Location = new System.Drawing.Point(713, 66);
            this.txtRepositorySizeLimits.Multiline = true;
            this.txtRepositorySizeLimits.Name = "txtRepositorySizeLimits";
            this.txtRepositorySizeLimits.ReadOnly = true;
            this.txtRepositorySizeLimits.Size = new System.Drawing.Size(66, 30);
            this.txtRepositorySizeLimits.TabIndex = 40;
            this.txtRepositorySizeLimits.Text = "1";
            this.txtRepositorySizeLimits.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // label3
            // 
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label3.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label3.Location = new System.Drawing.Point(27, 120);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(752, 2);
            this.label3.TabIndex = 42;
            // 
            // label4
            // 
            this.label4.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label4.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label4.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label4.Location = new System.Drawing.Point(30, 378);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(752, 2);
            this.label4.TabIndex = 42;
            // 
            // pnl_DataGirdView
            // 
            this.pnl_DataGirdView.Controls.Add(this.dgvOutputMarbles);
            this.pnl_DataGirdView.Location = new System.Drawing.Point(205, 198);
            this.pnl_DataGirdView.Name = "pnl_DataGirdView";
            this.pnl_DataGirdView.Size = new System.Drawing.Size(574, 164);
            this.pnl_DataGirdView.TabIndex = 43;
            // 
            // dgvOutputMarbles
            // 
            this.dgvOutputMarbles.AllowUserToAddRows = false;
            this.dgvOutputMarbles.AllowUserToDeleteRows = false;
            this.dgvOutputMarbles.AllowUserToResizeColumns = false;
            this.dgvOutputMarbles.AllowUserToResizeRows = false;
            this.dgvOutputMarbles.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvOutputMarbles.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.dgvOutputMarbles.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvOutputMarbles.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.dgvOutputMarbles.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.DeepSkyBlue;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvOutputMarbles.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvOutputMarbles.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOutputMarbles.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dgvOutputMarbles.EnableHeadersVisualStyles = false;
            this.dgvOutputMarbles.Location = new System.Drawing.Point(0, 0);
            this.dgvOutputMarbles.MultiSelect = false;
            this.dgvOutputMarbles.Name = "dgvOutputMarbles";
            this.dgvOutputMarbles.ReadOnly = true;
            this.dgvOutputMarbles.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvOutputMarbles.RowHeadersVisible = false;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.Silver;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.Gray;
            this.dgvOutputMarbles.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvOutputMarbles.RowTemplate.ReadOnly = true;
            this.dgvOutputMarbles.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvOutputMarbles.Size = new System.Drawing.Size(574, 164);
            this.dgvOutputMarbles.TabIndex = 0;
            // 
            // llblResetRepository
            // 
            this.llblResetRepository.AutoSize = true;
            this.llblResetRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.llblResetRepository.LinkColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(128)))));
            this.llblResetRepository.Location = new System.Drawing.Point(650, 39);
            this.llblResetRepository.Name = "llblResetRepository";
            this.llblResetRepository.Size = new System.Drawing.Size(132, 16);
            this.llblResetRepository.TabIndex = 44;
            this.llblResetRepository.TabStop = true;
            this.llblResetRepository.Text = "Reset Repository";
            this.llblResetRepository.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblResetRepository_LinkClicked);
            // 
            // lblRepositorySizeLimits
            // 
            this.lblRepositorySizeLimits.AutoSize = true;
            this.lblRepositorySizeLimits.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblRepositorySizeLimits.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblRepositorySizeLimits.IsUppercase = false;
            this.lblRepositorySizeLimits.Location = new System.Drawing.Point(595, 70);
            this.lblRepositorySizeLimits.Name = "lblRepositorySizeLimits";
            this.lblRepositorySizeLimits.Size = new System.Drawing.Size(109, 24);
            this.lblRepositorySizeLimits.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblRepositorySizeLimits.TabIndex = 59;
            this.lblRepositorySizeLimits.Text = "Size Limits";
            // 
            // lblTotal
            // 
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblTotal.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblTotal.IsUppercase = false;
            this.lblTotal.Location = new System.Drawing.Point(500, 39);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(56, 24);
            this.lblTotal.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblTotal.TabIndex = 59;
            this.lblTotal.Text = "Total";
            // 
            // lblEqual
            // 
            this.lblEqual.AutoSize = true;
            this.lblEqual.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblEqual.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblEqual.IsUppercase = false;
            this.lblEqual.Location = new System.Drawing.Point(464, 66);
            this.lblEqual.Name = "lblEqual";
            this.lblEqual.Size = new System.Drawing.Size(22, 24);
            this.lblEqual.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblEqual.TabIndex = 59;
            this.lblEqual.Text = "=";
            // 
            // lblPinkRepository
            // 
            this.lblPinkRepository.AutoSize = true;
            this.lblPinkRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblPinkRepository.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblPinkRepository.IsUppercase = false;
            this.lblPinkRepository.Location = new System.Drawing.Point(390, 39);
            this.lblPinkRepository.Name = "lblPinkRepository";
            this.lblPinkRepository.Size = new System.Drawing.Size(50, 24);
            this.lblPinkRepository.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblPinkRepository.TabIndex = 59;
            this.lblPinkRepository.Text = "Pink";
            // 
            // lblPurpleRepository
            // 
            this.lblPurpleRepository.AutoSize = true;
            this.lblPurpleRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblPurpleRepository.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblPurpleRepository.IsUppercase = false;
            this.lblPurpleRepository.Location = new System.Drawing.Point(289, 39);
            this.lblPurpleRepository.Name = "lblPurpleRepository";
            this.lblPurpleRepository.Size = new System.Drawing.Size(71, 24);
            this.lblPurpleRepository.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblPurpleRepository.TabIndex = 58;
            this.lblPurpleRepository.Text = "Purple";
            // 
            // lblBlueRepository
            // 
            this.lblBlueRepository.AutoSize = true;
            this.lblBlueRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblBlueRepository.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblBlueRepository.IsUppercase = false;
            this.lblBlueRepository.Location = new System.Drawing.Point(205, 39);
            this.lblBlueRepository.Name = "lblBlueRepository";
            this.lblBlueRepository.Size = new System.Drawing.Size(52, 24);
            this.lblBlueRepository.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblBlueRepository.TabIndex = 57;
            this.lblBlueRepository.Text = "Blue";
            // 
            // lblGreenRepository
            // 
            this.lblGreenRepository.AutoSize = true;
            this.lblGreenRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblGreenRepository.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblGreenRepository.IsUppercase = false;
            this.lblGreenRepository.Location = new System.Drawing.Point(114, 39);
            this.lblGreenRepository.Name = "lblGreenRepository";
            this.lblGreenRepository.Size = new System.Drawing.Size(68, 24);
            this.lblGreenRepository.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblGreenRepository.TabIndex = 56;
            this.lblGreenRepository.Text = "Green";
            // 
            // lblRedRepository
            // 
            this.lblRedRepository.AutoSize = true;
            this.lblRedRepository.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblRedRepository.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblRedRepository.IsUppercase = false;
            this.lblRedRepository.Location = new System.Drawing.Point(33, 39);
            this.lblRedRepository.Name = "lblRedRepository";
            this.lblRedRepository.Size = new System.Drawing.Size(48, 24);
            this.lblRedRepository.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblRedRepository.TabIndex = 55;
            this.lblRedRepository.Text = "Red";
            // 
            // lblPinkOutput
            // 
            this.lblPinkOutput.AutoSize = true;
            this.lblPinkOutput.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblPinkOutput.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblPinkOutput.IsUppercase = false;
            this.lblPinkOutput.Location = new System.Drawing.Point(33, 331);
            this.lblPinkOutput.Name = "lblPinkOutput";
            this.lblPinkOutput.Size = new System.Drawing.Size(50, 24);
            this.lblPinkOutput.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblPinkOutput.TabIndex = 49;
            this.lblPinkOutput.Text = "Pink";
            // 
            // lblPurpleOutput
            // 
            this.lblPurpleOutput.AutoSize = true;
            this.lblPurpleOutput.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblPurpleOutput.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblPurpleOutput.IsUppercase = false;
            this.lblPurpleOutput.Location = new System.Drawing.Point(33, 286);
            this.lblPurpleOutput.Name = "lblPurpleOutput";
            this.lblPurpleOutput.Size = new System.Drawing.Size(71, 24);
            this.lblPurpleOutput.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblPurpleOutput.TabIndex = 48;
            this.lblPurpleOutput.Text = "Purple";
            // 
            // lblBlueOutput
            // 
            this.lblBlueOutput.AutoSize = true;
            this.lblBlueOutput.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblBlueOutput.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblBlueOutput.IsUppercase = false;
            this.lblBlueOutput.Location = new System.Drawing.Point(33, 241);
            this.lblBlueOutput.Name = "lblBlueOutput";
            this.lblBlueOutput.Size = new System.Drawing.Size(52, 24);
            this.lblBlueOutput.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblBlueOutput.TabIndex = 47;
            this.lblBlueOutput.Text = "Blue";
            // 
            // lblGreenOutput
            // 
            this.lblGreenOutput.AutoSize = true;
            this.lblGreenOutput.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblGreenOutput.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblGreenOutput.IsUppercase = false;
            this.lblGreenOutput.Location = new System.Drawing.Point(33, 198);
            this.lblGreenOutput.Name = "lblGreenOutput";
            this.lblGreenOutput.Size = new System.Drawing.Size(68, 24);
            this.lblGreenOutput.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblGreenOutput.TabIndex = 46;
            this.lblGreenOutput.Text = "Green";
            // 
            // lblOutputLimits
            // 
            this.lblOutputLimits.AutoSize = true;
            this.lblOutputLimits.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblOutputLimits.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblOutputLimits.IsUppercase = false;
            this.lblOutputLimits.Location = new System.Drawing.Point(339, 155);
            this.lblOutputLimits.Name = "lblOutputLimits";
            this.lblOutputLimits.Size = new System.Drawing.Size(21, 24);
            this.lblOutputLimits.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblOutputLimits.TabIndex = 45;
            this.lblOutputLimits.Text = "5";
            // 
            // lblOutputLimitsTitle
            // 
            this.lblOutputLimitsTitle.AutoSize = true;
            this.lblOutputLimitsTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblOutputLimitsTitle.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblOutputLimitsTitle.IsUppercase = false;
            this.lblOutputLimitsTitle.Location = new System.Drawing.Point(201, 155);
            this.lblOutputLimitsTitle.Name = "lblOutputLimitsTitle";
            this.lblOutputLimitsTitle.Size = new System.Drawing.Size(137, 24);
            this.lblOutputLimitsTitle.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblOutputLimitsTitle.TabIndex = 45;
            this.lblOutputLimitsTitle.Text = "Output Limits:";
            // 
            // lblRedOutput
            // 
            this.lblRedOutput.AutoSize = true;
            this.lblRedOutput.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblRedOutput.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblRedOutput.IsUppercase = false;
            this.lblRedOutput.Location = new System.Drawing.Point(33, 155);
            this.lblRedOutput.Name = "lblRedOutput";
            this.lblRedOutput.Size = new System.Drawing.Size(48, 24);
            this.lblRedOutput.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblRedOutput.TabIndex = 45;
            this.lblRedOutput.Text = "Red";
            // 
            // lblNumbersOfPackages
            // 
            this.lblNumbersOfPackages.AutoSize = true;
            this.lblNumbersOfPackages.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold);
            this.lblNumbersOfPackages.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.lblNumbersOfPackages.IsUppercase = false;
            this.lblNumbersOfPackages.Location = new System.Drawing.Point(379, 155);
            this.lblNumbersOfPackages.Name = "lblNumbersOfPackages";
            this.lblNumbersOfPackages.Size = new System.Drawing.Size(107, 24);
            this.lblNumbersOfPackages.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Large;
            this.lblNumbersOfPackages.TabIndex = 45;
            this.lblNumbersOfPackages.Text = "Package x";
            // 
            // nudNumberOfPackages
            // 
            this.nudNumberOfPackages.BackColor = System.Drawing.Color.Gray;
            this.nudNumberOfPackages.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.nudNumberOfPackages.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudNumberOfPackages.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.nudNumberOfPackages.Location = new System.Drawing.Point(493, 160);
            this.nudNumberOfPackages.Name = "nudNumberOfPackages";
            this.nudNumberOfPackages.ReadOnly = true;
            this.nudNumberOfPackages.Size = new System.Drawing.Size(47, 20);
            this.nudNumberOfPackages.TabIndex = 60;
            this.nudNumberOfPackages.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.nudNumberOfPackages.ValueChanged += new System.EventHandler(this.nudNumberOfPackages_ValueChanged);
            // 
            // MarblesManagementForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(794, 599);
            this.Controls.Add(this.nudNumberOfPackages);
            this.Controls.Add(this.lblRepositorySizeLimits);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.lblEqual);
            this.Controls.Add(this.lblPinkRepository);
            this.Controls.Add(this.lblPurpleRepository);
            this.Controls.Add(this.lblBlueRepository);
            this.Controls.Add(this.lblGreenRepository);
            this.Controls.Add(this.lblRedRepository);
            this.Controls.Add(this.lblPinkOutput);
            this.Controls.Add(this.lblPurpleOutput);
            this.Controls.Add(this.lblBlueOutput);
            this.Controls.Add(this.lblGreenOutput);
            this.Controls.Add(this.lblOutputLimits);
            this.Controls.Add(this.lblNumbersOfPackages);
            this.Controls.Add(this.lblOutputLimitsTitle);
            this.Controls.Add(this.lblRedOutput);
            this.Controls.Add(this.llblResetRepository);
            this.Controls.Add(this.pnl_DataGirdView);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.txtRepositorySizeLimits);
            this.Controls.Add(this.txtTotal);
            this.Controls.Add(this.txtPinkRepository);
            this.Controls.Add(this.txtPurpleRepository);
            this.Controls.Add(this.txtBlueRepository);
            this.Controls.Add(this.txtGreenRepository);
            this.Controls.Add(this.txtRedRepository);
            this.Controls.Add(this.btnGetMarbles);
            this.Controls.Add(this.btnClear);
            this.Controls.Add(this.nudPink);
            this.Controls.Add(this.nudPurple);
            this.Controls.Add(this.nudBlue);
            this.Controls.Add(this.nudGreen);
            this.Controls.Add(this.nudRed);
            this.Controls.Add(this.rtbMessage);
            this.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "MarblesManagementForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Marbles Management";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmMarblesManagement_Load);
            ((System.ComponentModel.ISupportInitialize)(this.nudPink)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudPurple)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudBlue)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudGreen)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudRed)).EndInit();
            this.pnl_DataGirdView.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOutputMarbles)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.nudNumberOfPackages)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RichTextBox rtbMessage;
        private System.Windows.Forms.Button btnGetMarbles;
        private System.Windows.Forms.Button btnClear;
        private System.Windows.Forms.NumericUpDown nudPink;
        private System.Windows.Forms.NumericUpDown nudPurple;
        private System.Windows.Forms.NumericUpDown nudBlue;
        private System.Windows.Forms.NumericUpDown nudGreen;
        private System.Windows.Forms.NumericUpDown nudRed;
        private System.Windows.Forms.TextBox txtTotal;
        private System.Windows.Forms.TextBox txtPinkRepository;
        private System.Windows.Forms.TextBox txtPurpleRepository;
        private System.Windows.Forms.TextBox txtBlueRepository;
        private System.Windows.Forms.TextBox txtGreenRepository;
        private System.Windows.Forms.TextBox txtRedRepository;
        private System.Windows.Forms.TextBox txtRepositorySizeLimits;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Panel pnl_DataGirdView;
        private System.Windows.Forms.LinkLabel llblResetRepository;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblRedOutput;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblGreenOutput;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblBlueOutput;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblPurpleOutput;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblPinkOutput;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblPinkRepository;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblPurpleRepository;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblBlueRepository;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblGreenRepository;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblRedRepository;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblTotal;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblRepositorySizeLimits;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblEqual;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblOutputLimits;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblOutputLimitsTitle;
        private XCommon.FormHelpers.ControlLibrary.PSSCDataGridView dgvOutputMarbles;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblNumbersOfPackages;
        private XCommon.FormHelpers.ControlLibrary.PSSCNumericUpDown nudNumberOfPackages;

    }
}