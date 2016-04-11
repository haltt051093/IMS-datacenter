namespace IMS.Core.Extensions
{
    public static class ByteExtension
    {
        public static string ToHex(this byte[] data)
        {
            return ToHex(data, "");
        }

        public static string ToHex(this byte[] data, string prefix)
        {
            var lookup = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
            int i = 0, p = prefix.Length, l = data.Length;
            var c = new char[l * 2 + p];
            byte d;
            for (; i < p; ++i) c[i] = prefix[i];
            i = -1;
            --l;
            --p;
            while (i < l)
            {
                d = data[++i];
                c[++p] = lookup[d / 0x10];
                c[++p] = lookup[d % 0x10];
            }
            return new string(c, 0, c.Length);
        }
    }
}
