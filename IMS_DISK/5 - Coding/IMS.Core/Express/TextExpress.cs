using System.Security.Cryptography;
using System.Text;

namespace IMS.Core.Express
{
    public static class TextExpress
    {
        public const string NUMBER = "0123456789";
        public const string LOWER = "abcdefghijklmnopqrstuvwxyz";
        public const string UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

        public static string Randomize(int length, string customChar = null)
        {
            var charString = LOWER + UPPER + NUMBER
                        + LOWER + UPPER + NUMBER;
            if (!string.IsNullOrEmpty(customChar))
            {
                charString = customChar;
            }
            var charArray = charString.ToCharArray();
            var charLength = charArray.Length;
            var randomByte = new byte[length];
            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(randomByte);
            }
            var result = new StringBuilder(length);
            foreach (var b in randomByte)
            {
                var idx = b%charLength;
                result.Append(charArray[idx]);
            }
            return result.ToString();
        }
    }
}
