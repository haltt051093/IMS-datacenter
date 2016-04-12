using System.Globalization;

namespace IMS.Core.Extensions
{
    public static class DoubleExtension
    {
        public static string ToDecimaSpectatorString(this double value)
        {
            return value.ToString("N0", CultureInfo.CurrentUICulture);
        }
    }
}
