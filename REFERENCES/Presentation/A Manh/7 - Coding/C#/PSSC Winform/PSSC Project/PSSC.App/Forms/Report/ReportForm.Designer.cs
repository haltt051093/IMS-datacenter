namespace PSSC.App
{
    partial class ReportForm
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.ptbSearch = new System.Windows.Forms.PictureBox();
            this.pnlSearch = new System.Windows.Forms.Panel();
            this.txtSearch = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCTextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.lblPhone = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblName = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblEmail = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.txtEmail = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCTextBox();
            this.txtName = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCTextBox();
            this.txtPhone = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCTextBox();
            this.lblOrderDate = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblOrderId = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblOrderDateTitle = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.lblOrderIdTitle = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCLabel();
            this.txtCurrentPage = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCTextBox();
            this.btnLastPage = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.btnFirstPage = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.btnNextPage = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.btnPreviousPage = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCButton();
            this.dgvReport = new PSSC.XCommon.FormHelpers.ControlLibrary.PSSCDataGridView();
            this.llblViewDetails = new System.Windows.Forms.LinkLabel();
            this.lblTotalTitle = new System.Windows.Forms.Label();
            this.lblTotal = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.ptbSearch)).BeginInit();
            this.pnlSearch.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReport)).BeginInit();
            this.SuspendLayout();
            // 
            // ptbSearch
            // 
            this.ptbSearch.BackColor = System.Drawing.Color.DimGray;
            this.ptbSearch.Dock = System.Windows.Forms.DockStyle.Right;
            this.ptbSearch.Image = global::PSSC.App.Properties.Resources.IconSearch1;
            this.ptbSearch.Location = new System.Drawing.Point(6, 0);
            this.ptbSearch.Name = "ptbSearch";
            this.ptbSearch.Size = new System.Drawing.Size(20, 25);
            this.ptbSearch.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.ptbSearch.TabIndex = 5;
            this.ptbSearch.TabStop = false;
            // 
            // pnlSearch
            // 
            this.pnlSearch.BackColor = System.Drawing.Color.DimGray;
            this.pnlSearch.Controls.Add(this.ptbSearch);
            this.pnlSearch.Controls.Add(this.txtSearch);
            this.pnlSearch.Location = new System.Drawing.Point(545, 81);
            this.pnlSearch.Name = "pnlSearch";
            this.pnlSearch.Size = new System.Drawing.Size(236, 25);
            this.pnlSearch.TabIndex = 6;
            // 
            // txtSearch
            // 
            this.txtSearch.BackColor = System.Drawing.Color.DimGray;
            this.txtSearch.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtSearch.Dock = System.Windows.Forms.DockStyle.Right;
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.txtSearch.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtSearch.Location = new System.Drawing.Point(26, 0);
            this.txtSearch.Multiline = true;
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(210, 25);
            this.txtSearch.TabIndex = 4;
            this.txtSearch.KeyUp += new System.Windows.Forms.KeyEventHandler(this.txtSearch_KeyUp);
            // 
            // label3
            // 
            this.label3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label3.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label3.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label3.Location = new System.Drawing.Point(12, 557);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(769, 2);
            this.label3.TabIndex = 43;
            // 
            // label1
            // 
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.label1.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.label1.Location = new System.Drawing.Point(13, 117);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(769, 2);
            this.label1.TabIndex = 43;
            // 
            // lblPhone
            // 
            this.lblPhone.AutoSize = true;
            this.lblPhone.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblPhone.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblPhone.IsUppercase = false;
            this.lblPhone.Location = new System.Drawing.Point(24, 90);
            this.lblPhone.Name = "lblPhone";
            this.lblPhone.Size = new System.Drawing.Size(56, 16);
            this.lblPhone.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblPhone.TabIndex = 38;
            this.lblPhone.Text = "Phone:";
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblName.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblName.IsUppercase = false;
            this.lblName.Location = new System.Drawing.Point(24, 27);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(53, 16);
            this.lblName.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblName.TabIndex = 37;
            this.lblName.Text = "Name:";
            // 
            // lblEmail
            // 
            this.lblEmail.AutoSize = true;
            this.lblEmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblEmail.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblEmail.IsUppercase = false;
            this.lblEmail.Location = new System.Drawing.Point(24, 58);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.Size = new System.Drawing.Size(51, 16);
            this.lblEmail.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblEmail.TabIndex = 35;
            this.lblEmail.Text = "Email:";
            // 
            // txtEmail
            // 
            this.txtEmail.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.txtEmail.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtEmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.txtEmail.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtEmail.Location = new System.Drawing.Point(84, 58);
            this.txtEmail.Multiline = true;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.ReadOnly = true;
            this.txtEmail.Size = new System.Drawing.Size(230, 29);
            this.txtEmail.TabIndex = 33;
            // 
            // txtName
            // 
            this.txtName.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.txtName.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.txtName.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtName.Location = new System.Drawing.Point(84, 27);
            this.txtName.Multiline = true;
            this.txtName.Name = "txtName";
            this.txtName.ReadOnly = true;
            this.txtName.Size = new System.Drawing.Size(232, 29);
            this.txtName.TabIndex = 32;
            // 
            // txtPhone
            // 
            this.txtPhone.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.txtPhone.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtPhone.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.txtPhone.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtPhone.Location = new System.Drawing.Point(84, 90);
            this.txtPhone.Multiline = true;
            this.txtPhone.Name = "txtPhone";
            this.txtPhone.ReadOnly = true;
            this.txtPhone.Size = new System.Drawing.Size(146, 29);
            this.txtPhone.TabIndex = 31;
            // 
            // lblOrderDate
            // 
            this.lblOrderDate.AutoSize = true;
            this.lblOrderDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblOrderDate.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.lblOrderDate.IsUppercase = false;
            this.lblOrderDate.Location = new System.Drawing.Point(693, 58);
            this.lblOrderDate.Name = "lblOrderDate";
            this.lblOrderDate.Size = new System.Drawing.Size(0, 16);
            this.lblOrderDate.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblOrderDate.TabIndex = 7;
            // 
            // lblOrderId
            // 
            this.lblOrderId.AutoSize = true;
            this.lblOrderId.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblOrderId.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.lblOrderId.IsUppercase = false;
            this.lblOrderId.Location = new System.Drawing.Point(693, 27);
            this.lblOrderId.Name = "lblOrderId";
            this.lblOrderId.Size = new System.Drawing.Size(0, 16);
            this.lblOrderId.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblOrderId.TabIndex = 7;
            // 
            // lblOrderDateTitle
            // 
            this.lblOrderDateTitle.AutoSize = true;
            this.lblOrderDateTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblOrderDateTitle.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblOrderDateTitle.IsUppercase = false;
            this.lblOrderDateTitle.Location = new System.Drawing.Point(599, 58);
            this.lblOrderDateTitle.Name = "lblOrderDateTitle";
            this.lblOrderDateTitle.Size = new System.Drawing.Size(88, 16);
            this.lblOrderDateTitle.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblOrderDateTitle.TabIndex = 7;
            this.lblOrderDateTitle.Text = "Order Date:";
            // 
            // lblOrderIdTitle
            // 
            this.lblOrderIdTitle.AutoSize = true;
            this.lblOrderIdTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold);
            this.lblOrderIdTitle.ForeColor = System.Drawing.Color.DeepSkyBlue;
            this.lblOrderIdTitle.IsUppercase = false;
            this.lblOrderIdTitle.Location = new System.Drawing.Point(599, 27);
            this.lblOrderIdTitle.Name = "lblOrderIdTitle";
            this.lblOrderIdTitle.Size = new System.Drawing.Size(70, 16);
            this.lblOrderIdTitle.StandardSize = PSSC.XCommon.FormHelpers.ControlLibrary.StandardSize.Small;
            this.lblOrderIdTitle.TabIndex = 7;
            this.lblOrderIdTitle.Text = "Order ID:";
            // 
            // txtCurrentPage
            // 
            this.txtCurrentPage.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.txtCurrentPage.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.txtCurrentPage.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCurrentPage.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.txtCurrentPage.Location = new System.Drawing.Point(373, 562);
            this.txtCurrentPage.Multiline = true;
            this.txtCurrentPage.Name = "txtCurrentPage";
            this.txtCurrentPage.ReadOnly = true;
            this.txtCurrentPage.Size = new System.Drawing.Size(48, 25);
            this.txtCurrentPage.TabIndex = 3;
            this.txtCurrentPage.Text = "0";
            this.txtCurrentPage.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btnLastPage
            // 
            this.btnLastPage.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnLastPage.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnLastPage.FlatAppearance.BorderSize = 0;
            this.btnLastPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLastPage.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold);
            this.btnLastPage.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnLastPage.Location = new System.Drawing.Point(459, 557);
            this.btnLastPage.Name = "btnLastPage";
            this.btnLastPage.Size = new System.Drawing.Size(51, 36);
            this.btnLastPage.TabIndex = 2;
            this.btnLastPage.Text = "11";
            this.btnLastPage.UseVisualStyleBackColor = false;
            this.btnLastPage.Click += new System.EventHandler(this.btnLastPage_Click);
            // 
            // btnFirstPage
            // 
            this.btnFirstPage.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnFirstPage.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnFirstPage.FlatAppearance.BorderSize = 0;
            this.btnFirstPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnFirstPage.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold);
            this.btnFirstPage.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnFirstPage.Location = new System.Drawing.Point(284, 557);
            this.btnFirstPage.Name = "btnFirstPage";
            this.btnFirstPage.Size = new System.Drawing.Size(51, 36);
            this.btnFirstPage.TabIndex = 2;
            this.btnFirstPage.Text = "11";
            this.btnFirstPage.UseVisualStyleBackColor = false;
            this.btnFirstPage.Click += new System.EventHandler(this.btnFirstPage_Click);
            // 
            // btnNextPage
            // 
            this.btnNextPage.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnNextPage.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnNextPage.FlatAppearance.BorderSize = 0;
            this.btnNextPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnNextPage.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold);
            this.btnNextPage.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnNextPage.Location = new System.Drawing.Point(427, 557);
            this.btnNextPage.Name = "btnNextPage";
            this.btnNextPage.Size = new System.Drawing.Size(26, 36);
            this.btnNextPage.TabIndex = 2;
            this.btnNextPage.Text = "1";
            this.btnNextPage.UseVisualStyleBackColor = false;
            this.btnNextPage.Click += new System.EventHandler(this.btnNextPage_Click);
            // 
            // btnPreviousPage
            // 
            this.btnPreviousPage.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.btnPreviousPage.FlatAppearance.BorderColor = System.Drawing.Color.WhiteSmoke;
            this.btnPreviousPage.FlatAppearance.BorderSize = 0;
            this.btnPreviousPage.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnPreviousPage.Font = new System.Drawing.Font("Tahoma", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPreviousPage.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnPreviousPage.Location = new System.Drawing.Point(341, 557);
            this.btnPreviousPage.Name = "btnPreviousPage";
            this.btnPreviousPage.Size = new System.Drawing.Size(26, 36);
            this.btnPreviousPage.TabIndex = 2;
            this.btnPreviousPage.Text = "1";
            this.btnPreviousPage.UseVisualStyleBackColor = false;
            this.btnPreviousPage.Click += new System.EventHandler(this.btnPreviousPage_Click);
            // 
            // dgvReport
            // 
            this.dgvReport.AllowUserToAddRows = false;
            this.dgvReport.AllowUserToDeleteRows = false;
            this.dgvReport.AllowUserToResizeColumns = false;
            this.dgvReport.AllowUserToResizeRows = false;
            this.dgvReport.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvReport.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.dgvReport.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvReport.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.None;
            this.dgvReport.ColumnHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.Color.WhiteSmoke;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvReport.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvReport.ColumnHeadersHeight = 30;
            this.dgvReport.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.DisableResizing;
            this.dgvReport.EnableHeadersVisualStyles = false;
            this.dgvReport.Location = new System.Drawing.Point(12, 124);
            this.dgvReport.MultiSelect = false;
            this.dgvReport.Name = "dgvReport";
            this.dgvReport.ReadOnly = true;
            this.dgvReport.RowHeadersBorderStyle = System.Windows.Forms.DataGridViewHeaderBorderStyle.None;
            this.dgvReport.RowHeadersVisible = false;
            dataGridViewCellStyle4.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.Color.Silver;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.Color.Gray;
            this.dgvReport.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvReport.RowTemplate.ReadOnly = true;
            this.dgvReport.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvReport.Size = new System.Drawing.Size(769, 427);
            this.dgvReport.TabIndex = 1;
            this.dgvReport.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvReport_CellClick);
            // 
            // llblViewDetails
            // 
            this.llblViewDetails.ActiveLinkColor = System.Drawing.Color.AntiqueWhite;
            this.llblViewDetails.AutoSize = true;
            this.llblViewDetails.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.llblViewDetails.LinkColor = System.Drawing.Color.Orange;
            this.llblViewDetails.Location = new System.Drawing.Point(359, 90);
            this.llblViewDetails.Name = "llblViewDetails";
            this.llblViewDetails.Size = new System.Drawing.Size(94, 16);
            this.llblViewDetails.TabIndex = 45;
            this.llblViewDetails.TabStop = true;
            this.llblViewDetails.Text = "View Details";
            this.llblViewDetails.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblViewDetails_LinkClicked);
            // 
            // lblTotalTitle
            // 
            this.lblTotalTitle.AutoSize = true;
            this.lblTotalTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalTitle.Location = new System.Drawing.Point(327, 52);
            this.lblTotalTitle.Name = "lblTotalTitle";
            this.lblTotalTitle.Size = new System.Drawing.Size(72, 25);
            this.lblTotalTitle.TabIndex = 46;
            this.lblTotalTitle.Text = "Total:";
            // 
            // lblTotal
            // 
            this.lblTotal.AutoSize = true;
            this.lblTotal.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotal.Location = new System.Drawing.Point(404, 52);
            this.lblTotal.Name = "lblTotal";
            this.lblTotal.Size = new System.Drawing.Size(25, 25);
            this.lblTotal.TabIndex = 46;
            this.lblTotal.Text = "$";
            // 
            // ReportForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.AutoSize = true;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(64)))), ((int)(((byte)(64)))), ((int)(((byte)(64)))));
            this.ClientSize = new System.Drawing.Size(794, 599);
            this.Controls.Add(this.lblTotal);
            this.Controls.Add(this.lblTotalTitle);
            this.Controls.Add(this.llblViewDetails);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.lblPhone);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.lblEmail);
            this.Controls.Add(this.txtEmail);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.txtPhone);
            this.Controls.Add(this.lblOrderDate);
            this.Controls.Add(this.lblOrderId);
            this.Controls.Add(this.lblOrderDateTitle);
            this.Controls.Add(this.lblOrderIdTitle);
            this.Controls.Add(this.pnlSearch);
            this.Controls.Add(this.txtCurrentPage);
            this.Controls.Add(this.btnLastPage);
            this.Controls.Add(this.btnFirstPage);
            this.Controls.Add(this.btnNextPage);
            this.Controls.Add(this.btnPreviousPage);
            this.Controls.Add(this.dgvReport);
            this.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "ReportForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "ReportForm";
            this.Load += new System.EventHandler(this.ReportForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.ptbSearch)).EndInit();
            this.pnlSearch.ResumeLayout(false);
            this.pnlSearch.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReport)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private XCommon.FormHelpers.ControlLibrary.PSSCDataGridView dgvReport;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnPreviousPage;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnFirstPage;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnNextPage;
        private XCommon.FormHelpers.ControlLibrary.PSSCButton btnLastPage;
        private XCommon.FormHelpers.ControlLibrary.PSSCTextBox txtCurrentPage;
        private XCommon.FormHelpers.ControlLibrary.PSSCTextBox txtSearch;
        private System.Windows.Forms.PictureBox ptbSearch;
        private System.Windows.Forms.Panel pnlSearch;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblOrderIdTitle;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblOrderId;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblOrderDateTitle;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblOrderDate;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblPhone;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblName;
        private XCommon.FormHelpers.ControlLibrary.PSSCLabel lblEmail;
        private XCommon.FormHelpers.ControlLibrary.PSSCTextBox txtEmail;
        private XCommon.FormHelpers.ControlLibrary.PSSCTextBox txtName;
        private XCommon.FormHelpers.ControlLibrary.PSSCTextBox txtPhone;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.LinkLabel llblViewDetails;
        private System.Windows.Forms.Label lblTotalTitle;
        private System.Windows.Forms.Label lblTotal;
    }
}