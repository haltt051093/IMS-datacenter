using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;

namespace PSSC.App.FormModels
{
    public class OrderDetailFormModel
    {
        public int Id { get; set; }
        public string MarbleColor { get; set; }
        public int Quantity { get; set; }
        public double UnitPrice { get; set; }
        public double TotalPerMarbles { get; set; }

        public List<OrderDetailFormModel> GetOrderDetailsByOrderId(int orderId)
        {
            List<OrderDetailFormModel> list = new List<OrderDetailFormModel>();
            int count = 0;
            
            PsscDBContext psscDBContext = new PsscDBContext();
            List<OrderDetail> listOrderDetail = psscDBContext.OrderDetails.Include("Marble").Where(x => x.OrderId == orderId).ToList();         
            foreach(var item in listOrderDetail)
            {
                list.Add(new OrderDetailFormModel() 
                { 
                    Id = count++,
                    MarbleColor = item.Marble.MarbleColor,
                    Quantity = item.Quantity,
                    UnitPrice = (double)item.Marble.Price,
                    TotalPerMarbles = item.Quantity * (double)item.Marble.Price
                });
            }
            return list;
        }
    }
}
