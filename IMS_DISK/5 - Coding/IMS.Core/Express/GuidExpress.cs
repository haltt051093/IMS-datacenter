using System;

namespace IMS.Core.Express
{
    public static class GuidExpress
    {
        public static string GenerateUniqueId()
        {
            var result = Guid.NewGuid().ToString();
            return result;
        }
    }
}
