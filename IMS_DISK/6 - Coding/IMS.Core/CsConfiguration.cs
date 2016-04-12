using System;
using System.Configuration;
using IMS.Core.Extensions;

namespace IMS.Core
{
    public class CsConfiguration
    {
        public static string GetConfiguration(string key)
        {
            return ConfigurationManager.AppSettings.Get(key);
        }

        public static void SetConfiguration(string key, string value)
        {
            ConfigurationManager.AppSettings.Set(key, value);
        }

        public static bool GetBool(string key, bool defValue = false)
        {
            var value = GetConfiguration(key);
            var result = value.ToBool(defValue);
            return result;
        }

        public static void SetBool(string key, bool value)
        {
            SetConfiguration(key, value.ToString());
        }

        public static DateTime GetDateTime(string key, DateTime defValue)
        {
            var value = GetConfiguration(key);
            var result = value.ToDateTime(defValue);
            return result;
        }

        public static void SetDateTime(string key, DateTime value)
        {
            SetConfiguration(key, value.ToString());
        }

        public static double GetDouble(string key, double defValue = 0)
        {
            var value = GetConfiguration(key);
            var result = value.ToDouble(defValue);
            return result;
        }

        public static void SetDouble(string key, double value)
        {
            SetConfiguration(key, value.ToString());
        }

        public static float GetFloat(string key, float defValue = 0)
        {
            var value = GetConfiguration(key);
            var result = value.ToFloat(defValue);
            return result;
        }

        public static void SetFloat(string key, float value)
        {
            SetConfiguration(key, value.ToString());
        }

        public static int GetInt(string key, int defValue = 0)
        {
            var value = GetConfiguration(key);
            var result = value.ToInt(defValue);
            return result;
        }

        public static void SetInt(string key, int value)
        {
            SetConfiguration(key, value.ToString());
        }

        public static long GetLong(string key, long defValue = 0)
        {
            var value = GetConfiguration(key);
            var result = value.ToLong(defValue);
            return result;
        }

        public static void SetLong(string key, long value)
        {
            SetConfiguration(key, value.ToString());
        }
    }
}
