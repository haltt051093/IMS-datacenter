using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.XCommon;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class OrderDetailService:IGenericService<OrderDetail>
    {
         private IGenericDAO<OrderDetail> OrderDetailDAO = null;

        public OrderDetailService()
        {
            this.OrderDetailDAO = new GenericDAO<OrderDetail>();
        }

        public OrderDetailService(GenericDAO<OrderDetail> OrderDetailDAO)
        {
            this.OrderDetailDAO = OrderDetailDAO;
        }

        public List<OrderDetail> SelectAll()
        {
            return OrderDetailDAO.SelectAll().OrderBy(x => x.OrderDetailId).ToList();
        }

        public OrderDetail SelectByID(int? id)
        {
            OrderDetail obj = null;
            if (id.HasValue)
            {
                obj = OrderDetailDAO.SelectByID((int)id);
            }
            return obj;
        }

        public bool Create(OrderDetail obj)
        {
            try
            {
                OrderDetailDAO.Create(obj);
                OrderDetailDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Create(string orderCode, MarbleColor marbleColor)
        {
            OrderService orderService = new OrderService();
            MarbleService marbleService = new MarbleService();
            Order order = orderService.SelectByOrderCode(orderCode);
            Marble marble = marbleService.SelectByColor(marbleColor);

            try
            {
                if(order != null && marble != null)
                {
                    OrderDetail orderDetail = OrderDetailDAO.SelectAll()
                                             .Where(x => x.MarbleId == marble.MarbleId && x.OrderId == order.OrderId)
                                             .FirstOrDefault();
                    if (orderDetail == null)
                    {
                        orderDetail = new OrderDetail()
                        {
                            OrderId = order.OrderId,
                            MarbleId = marble.MarbleId,
                            Quantity = 1,
                            UnitPrice = (marble.Price.HasValue) ? (double)marble.Price : 100
                        };
                        this.Create(orderDetail); 
                    }
                    else
                    {
                        orderDetail.Quantity++;
                        this.Update(orderDetail);
                    }
                    order.Total = this.CalculateTotal(order.OrderId);
                    orderService.Update(order);
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(OrderDetail obj)
        {
            try
            {
                OrderDetailDAO.Update(obj);
                OrderDetailDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Delete(int id)
        {
            try
            {
                OrderDetailDAO.Delete(id);
                OrderDetailDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        //Business
        private double CalculateTotal(int? orderId)
        {
            double total = 0;
            if(orderId.HasValue)
            {            
                var list = OrderDetailDAO.SelectAll().Where(x => x.OrderId == orderId);
                foreach(var item in list)
                {
                    total += item.Quantity * item.UnitPrice;
                }
            }
            return total;
        }
    }
}
