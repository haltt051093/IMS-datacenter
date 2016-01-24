using System;
using System.Globalization;

namespace IMS.Core.Extensions
{
    public static class LongExtension
    {
        public static string ToDecimaSpectator(this long value)
        {
            return value.ToString("N0", CultureInfo.CurrentUICulture);
        }
    }
}
