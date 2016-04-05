using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PSSC.XCommon
{
    public class OrderCodeGenerator: DataGenerator
    {
        //Methods
        public string GenerateOrderCode()
        {
            StringBuilder sb = new StringBuilder();
            for(int i = 0; i < 8; i++)
            {
                sb.Append(this.GenerateString(8));

            }
            return sb.ToString();
        }
    }
}
