using PSSC.DataModel.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using PSSC.XCommon;

namespace PSSC.App
{
    public class DgvOutputMarblesHelper
    {
        public DataGridView dataGridView { get; set; }

        private List<DgvOutputMarblesHelperCache> listBackup = new List<DgvOutputMarblesHelperCache>();

        public void Setup()
        {
            //Create Columns
            dataGridView.ColumnCount = 3;
            dataGridView.Columns[0].Name = "Marble Color";
            dataGridView.Columns[1].Name = "Output";
            dataGridView.Columns[2].Name = "Status";
            DataGridViewImageColumn imageColumn = new DataGridViewImageColumn();
            imageColumn.Image = PSSC.App.Properties.Resources.SymbolCheck1;
            dataGridView.Columns.Insert(0, imageColumn);

            //Set Color, Font, Size for Columns Header
            dataGridView.EnableHeadersVisualStyles = false;
            dataGridView.Columns[0].Width = 50;
        }

        public int GetTotalOutputMarbles()
        {
            int totalOutputMarbles = 0;
            try
            {
                foreach(DataGridViewRow row in dataGridView.Rows)
                {
                    totalOutputMarbles += Convert.ToInt32(row.Cells[2].Value);
                }
            }
            catch
            {
                return -1;
            }
            return totalOutputMarbles;
        }

        public bool AddRows(MarbleColor marbleColor, int outputQuantity)
        {
            try
            {
                int index = -1;
                //Find row 
                foreach (DataGridViewRow item in dataGridView.Rows)
                {
                    if (item.Cells[1].Value.ToString().Equals(Convert.ToString(marbleColor)))
                    {
                        index = item.Index;
                        break;
                    }
                }

                if(index != -1)
                {
                    //If row exist, update quantity
                    dataGridView.Rows[index].Cells[2].Value = outputQuantity;
                }
                else
                {
                    //If have no rows, create it
                    index = dataGridView.Rows.Add(new Bitmap(1, 1), marbleColor, outputQuantity, "Waiting");

                    //Set Color for Cells
                    dataGridView.Rows[index].Cells[3].Style.ForeColor = Color.Orange;          
                }       
               
                //Check quantity = 0 or not, if quantity == 0, remove row
                if(outputQuantity == 0)
                {
                    dataGridView.Rows.RemoveAt(index);
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool UpdateRows(MarbleColor marbleColor, int outputQuantity)
        {
            try
            {
                int index = -1;
                //Find row 
                foreach (DataGridViewRow item in dataGridView.Rows)
                {
                    if (item.Cells[1].Value.ToString().Equals(Convert.ToString(marbleColor)))
                    {
                        index = item.Index;
                        break;
                    }
                }
                //Find no rows
                if (index == -1)
                {
                    return false;
                }
                else
                {
                    //If has row then update
                    dataGridView.Rows[index].Cells[2].Value = outputQuantity;
                }

                //Check finish
                if (outputQuantity == 0)
                {
                    dataGridView.Rows[index].Cells[0].Value = PSSC.App.Properties.Resources.SymbolCheck1;
                    dataGridView.Rows[index].Cells[3].Value = "Success";
                    dataGridView.Rows[index].Cells[3].Style.ForeColor = Color.Lime;
                }
                else
                {
                    dataGridView.Rows[index].Cells[0].Value = new Bitmap(1, 1);
                    dataGridView.Rows[index].Cells[3].Value = "Waiting";

                    //Set Color for Cells
                    dataGridView.Rows[index].Cells[3].Style.ForeColor = Color.Orange;   
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool RemoveRows()
        {
            try
            {
                dataGridView.Rows.Clear();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Backup()
        {
            try
            {
                if(dataGridView.Rows.Count > 0)
                {
                    foreach (DataGridViewRow item in dataGridView.Rows)
                    {
                        listBackup.Add(new DgvOutputMarblesHelperCache()
                        {
                            ColorName = (MarbleColor)item.Cells[1].Value,
                            Quantity = item.Cells[2].Value.ToString()
                        });
                    }
                }
            }
            catch 
            {
                return false;
            }
            return true;
        }

        public bool Restore()
        {
            try
            {
                if (dataGridView.Rows.Count > 0)
                {
                    foreach (var item in listBackup)
                    {
                        this.UpdateRows(item.ColorName,Convert.ToInt32(item.Quantity));
                    }
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool ClearCache()
        {
            try
            {
                listBackup.Clear();
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }

    public class DgvOutputMarblesHelperCache
    {
        public MarbleColor ColorName {get;set;}
        public string Quantity {get;set;}
    }
}
