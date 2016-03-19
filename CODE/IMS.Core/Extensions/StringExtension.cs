using System;
using System.Globalization;
using System.Text;

namespace IMS.Core.Extensions
{
    public static class StringExtension
    {
        public static byte[] ToBytes(this string str, Encoding encoding = null)
        {
            if (encoding != null)
            {
                return encoding.GetBytes(str);
            }
            return Encoding.UTF8.GetBytes(str);
        }

        public static bool? ToBool(this string str)
        {
            var result = false;
            if (bool.TryParse(str, out result) == false)
            {
                return null;
            }
            return result;
        }

        public static bool ToBool(this string str, bool defValue)
        {
            var result = defValue;
            if (bool.TryParse(str, out result) == false)
            {
                return defValue;
            }
            return result;
        }

        public static DateTime? ToDateTime(this string str)
        {
            var result = DateTime.Now;
            if (DateTime.TryParse(str, out result) == false)
            {
                return null;
            }
            return result;
        }

        public static DateTime ToDateTime(this string str, DateTime defValue)
        {
            var result = DateTime.Now;
            if (DateTime.TryParse(str, out result) == false)
            {
                return defValue;
            }
            return result;
        }

        public static DateTime? ToDateTime(this string str, string format)
        {
            var result = DateTime.Now;
            if (DateTime.TryParseExact(str, new string[] { format }, CultureInfo.InvariantCulture, DateTimeStyles.AllowWhiteSpaces, out result))
            {
                return null;
            }
            return result;
        }

        public static DateTime ToDateTime(this string str, string format, DateTime defValue)
        {
            var result = DateTime.Now;
            if (DateTime.TryParseExact(str, new string[] { format }, CultureInfo.InvariantCulture, DateTimeStyles.AllowWhiteSpaces, out result))
            {
                return defValue;
            }
            return result;
        }

        public static double? ToDouble(this string str)
        {
            var result = 0d;
            if (double.TryParse(str, out result) == false)
            {
                return null;
            }
            return result;
        }

        public static double ToDouble(this string str, double defValue)
        {
            var result = defValue;
            if (double.TryParse(str, out result) == false)
            {
                return defValue;
            }
            return result;
        }

        public static float? ToFloat(this string str)
        {
            var result = 0f;
            if (float.TryParse(str, out result) == false)
            {
                return null;
            }
            return result;
        }

        public static float ToFloat(this string str, float defValue)
        {
            var result = defValue;
            if (float.TryParse(str, out result) == false)
            {
                return defValue;
            }
            return result;
        }

        public static int? ToInt(this string str)
        {
            var result = 0;
            if(int.TryParse(str, out result) == false)
            {
                return null;
            }
            return result;
        }

        public static int ToInt(this string str, int defValue)
        {
            var result = defValue;
            if (int.TryParse(str, out result) == false)
            {
                return defValue;
            }
            return result;
        }

        public static long? ToLong(this string str)
        {
            var result = 0L;
            if (long.TryParse(str, out result) == false)
            {
                return null;
            }
            return result;
        }

        public static long ToLong(this string str, long defValue)
        {
            var result = defValue;
            if (long.TryParse(str, out result) == false)
            {
                return defValue;
            }
            return result;
        }
    }
}
