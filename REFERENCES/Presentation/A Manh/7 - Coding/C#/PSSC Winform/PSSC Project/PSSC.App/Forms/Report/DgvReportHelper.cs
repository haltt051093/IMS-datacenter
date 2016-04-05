using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Globalization;
using PSSC.DataModel.Models;

namespace PSSC.App
{
    public class DgvReportHelper
    {
        public DataGridView dataGridView { get; set; }
        public int PageSize{ get;set;}
        public int CurrentPage { get; set; }
        public int NumberOfPages { get; set; }
        public string SearchString { get; set; }
        
        public void Setup()
        {
            //Create Columns
            dataGridView.ColumnCount = 6;
            dataGridView.Columns[0].Name = "Order ID";
            dataGridView.Columns[1].Name = "Name";
            dataGridView.Columns[2].Name = "Email";
            dataGridView.Columns[3].Name = "Phone";
            dataGridView.Columns[4].Name = "Order Date";
            dataGridView.Columns[5].Name = "Total";


            //Set Color, Font, Size for Columns Header
            dataGridView.EnableHeadersVisualStyles = false;
            dataGridView.Columns["Order ID"].Width = 80;
            dataGridView.Columns["Name"].Width = 150;
            dataGridView.Columns["Email"].Width = 170;
            dataGridView.Columns["Order Date"].Width = 100;
            dataGridView.Columns["Total"].Width = 60;

            //Setup Data
            if(this.PageSize == 0)
            {
                this.PageSize = 18;
            }
            if(this.CurrentPage == 0)
            {
                this.CurrentPage = 1;
            }
        }

        public bool LoadData(List<Order> list)
        {
            try
            {               
                //Search in List
                if(!string.IsNullOrEmpty(this.SearchString))
                {
                    this.SearchString = this.SearchString.ToLower();
                    list = list.Where(x => x.CustomerName.ToLower().Contains(this.SearchString) ||
                                           x.CustomerEmail.ToLower().Contains(this.SearchString) ||
                                           x.CustomerPhone.ToLower().Contains(this.SearchString) ||
                                           x.OrderId.ToString().ToLower().Contains(this.SearchString) ||
                                           Convert.ToDateTime(x.OrderDate).ToString("MM/dd/yyyy").ToLower().Contains(this.SearchString) ||
                                           x.Total.ToString().ToLower().Contains(this.SearchString)
                                     ).ToList();
                }

                //Paging
                this.NumberOfPages = list.Count() / this.PageSize;

                if ((list.Count() / this.PageSize) > this.PageSize)
                {
                    this.NumberOfPages++;
                }
                list = list.Skip((this.CurrentPage - 1) * this.PageSize).Take(this.PageSize).ToList();
                dataGridView.Rows.Clear();
                foreach(var item in  list)
                {
                    dataGridView.Rows.Add(item.OrderId,
                                          item.CustomerName,
                                          item.CustomerEmail,
                                          item.CustomerPhone,
                                          Convert.ToDateTime(item.OrderDate).ToString("MM/dd/yyyy"),
                                          "$" + item.Total);
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

    }
}