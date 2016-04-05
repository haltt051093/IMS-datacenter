using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace PSSC.XCommon
{
    public abstract class DataGenerator
    {
        protected Random random = new Random();

        //Methods - Basic
        public string GenerateString()
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            char[] letters = new char[random.Next(5, 8)];

            for (int i = 0; i < letters.Length; i++)
            {
                letters[i] = chars[random.Next(0, chars.Length)];
            }

            return (new string(letters));
        }

        public string GenerateString(int length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            char[] letters = new char[length];

            for (int i = 0; i < length; i++)
            {
                letters[i] = chars[random.Next(0, chars.Length)];
            }

            return (new string(letters));
        }

        public string NormalizeString(string input, bool keepSpecialCharacters)
        {
            string result = "";
            if (!string.IsNullOrEmpty(input))
            {
                result = input;
                result = Regex.Replace(result, "[à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ]", "a");
                result = Regex.Replace(result, "[À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ]", "A");
                result = Regex.Replace(result, "[è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ]", "e");
                result = Regex.Replace(result, "[È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ]", "e");
                result = Regex.Replace(result, "[ì|í|ị|ỉ|ĩ]", "i");
                result = Regex.Replace(result, "[Ì|Í|Ị|Ỉ|Ĩ]", "i");
                result = Regex.Replace(result, "[ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ]", "o");
                result = Regex.Replace(result, "[Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ]", "o");
                result = Regex.Replace(result, "[ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ]", "u");
                result = Regex.Replace(result, "[Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ]", "u");
                result = Regex.Replace(result, "[ỳ|ý|ỵ|ỷ|ỹ]", "y");
                result = Regex.Replace(result, "[Ỳ|Ý|Ỵ|Ỷ|Ỹ]", "y");
                result = Regex.Replace(result, "[đ]", "d");
                result = Regex.Replace(result, "[Đ]", "D");
                if (!keepSpecialCharacters)
                {
                    result = Regex.Replace(result, "[^a-zA-Z0-9]+", " ");
                }
                result = Regex.Replace(result, @"\s+", " ");
            }

            return result;
        }

    }
}
