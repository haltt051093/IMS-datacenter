﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IMS.Core.Extensions;

namespace IMS.Data.ViewModels
{
    public class IPAddressModel
    {
        public int First { get; set; }
        public int Second { get; set; }
        public int Third { get; set; }
        public int Fourth { get; set; }

        public IPAddressModel()
        {
        }

        public IPAddressModel(string address)
        {
            var parts = address.Split(new char[] { '.' }, StringSplitOptions.RemoveEmptyEntries);
            if (parts.Length > 0)
            {
                First = parts[0].ToInt(0);
            }
            if (parts.Length > 1)
            {
                Second = parts[1].ToInt(0);
            }
            if (parts.Length > 2)
            {
                Third = parts[2].ToInt(0);
            }
            if (parts.Length > 3)
            {
                Fourth = parts[3].ToInt(0);
            }
        }

        public override string ToString()
        {
            return First + "." + Second + "." + Third + "." + Fourth;
        }
    }
}
