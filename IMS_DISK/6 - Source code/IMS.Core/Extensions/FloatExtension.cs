using System.Globalization;

namespace IMS.Core.Extensions
{
    public static class FloatExtension
    {
        public static string ToDecimaSpectator(this float value)
        {
            return value.ToString("N0", CultureInfo.CurrentUICulture);
        }
    }
}
