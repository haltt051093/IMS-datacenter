using System.Globalization;

namespace IMS.Core.Extensions
{
    public static class IntegerExtension
    {
        public static string ToDecimaSpectator(this int value)
        {
            return value.ToString("N0", CultureInfo.CurrentUICulture);
        }
    }
}
