using IMS.Data.Generic;
using IMS.Data.Repository;

namespace IMS.Data.Business
{
    public class AttributeBLO : BaseBLO<Models.Attribute>
    {
        protected AttributeDAO dao;
        private static AttributeBLO instance;

        public static AttributeBLO Current
        {
            get
            {
                if (instance == null)
                {
                    instance = new AttributeBLO();
                }
                return instance;
            }
        }


        private AttributeBLO()
        {
            baseDao = AttributeDAO.Current;
            dao = AttributeDAO.Current;
        }
    }
}
