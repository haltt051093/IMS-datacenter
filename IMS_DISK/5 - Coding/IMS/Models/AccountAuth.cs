﻿
namespace IMS.Models
{
    public class AccountAuth
    {
        public string Username { get; set; }
        public string Role { get; set; }
        public string Fullname { get; set; }
        public string GroupCode { get; set; }
        public bool IsPersistent { get ; set; }
    }
}