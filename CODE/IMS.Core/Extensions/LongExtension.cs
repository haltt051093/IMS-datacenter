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

        public static DateTime AsEpochToDateTime(this long value, bool isUniversalTime = false)
        {
            var currentTick = (value * TimeSpan.TicksPerSecond) + Constants.TimeConversion.EPOCH_VS_TICK_OFFSET;
            var datekind = DateTimeKind.Unspecified;
            if (isUniversalTime)
            {
                datekind = DateTimeKind.Utc;
            }
            var result = new DateTime(currentTick, datekind);
            if (isUniversalTime)
            {
                result = result.ToLocalTime();
            }
            return result;
        }
    }
}
