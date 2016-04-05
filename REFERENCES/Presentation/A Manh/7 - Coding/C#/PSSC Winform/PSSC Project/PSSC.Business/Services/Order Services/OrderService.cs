using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PSSC.DataModel.Models;
using PSSC.DataAccess.Objects;

namespace PSSC.Business.Services
{
    public class OrderService : IGenericService<Order>
    {
         private IGenericDAO<Order> OrderDAO = null;

        public OrderService()
        {
            this.OrderDAO = new GenericDAO<Order>();
        }

        public OrderService(GenericDAO<Order> OrderDAO)
        {
            this.OrderDAO = OrderDAO;
        }

        public List<Order> SelectAll()
        {
            return OrderDAO.SelectAll().OrderBy(x => x.OrderId).ToList();
        }

        public Order SelectByID(int? id)
        {
            Order obj = null;
            if (id.HasValue)
            {
                obj = OrderDAO.SelectByID((int)id);
            }
            return obj;
        }

        public Order SelectByOrderCode(string orderCode)
        {
            Order obj = null;
            if(!string.IsNullOrEmpty(orderCode))
            {
                obj = OrderDAO.SelectAll().Where(x => x.OrderCode == orderCode).FirstOrDefault();
            }
            return obj;
        }

        public bool Create(Order obj)
        {
            try
            {
                if(!obj.Total.HasValue)
                {
                    obj.Total = 0;
                }
                obj.OrderDate= DateTime.Now;
                OrderDAO.Create(obj);
                OrderDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool Update(Order obj)
        {
            try
            {
                if (!obj.Total.HasValue)
                {
                    obj.Total = 0;
                }
                OrderDAO.Update(obj);
                OrderDAO.Save();
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
                OrderDAO.Delete(id);
                OrderDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

        public bool DeleteByOrderCode(string orderCode)
        {
            try
            {
                Order order = OrderDAO.SelectAll().Where(x => x.OrderCode.Equals(orderCode)).FirstOrDefault();
                OrderDAO.Delete(order.OrderId);
                OrderDAO.Save();
            }
            catch
            {
                return false;
            }
            return true;
        }

       
    }
}
