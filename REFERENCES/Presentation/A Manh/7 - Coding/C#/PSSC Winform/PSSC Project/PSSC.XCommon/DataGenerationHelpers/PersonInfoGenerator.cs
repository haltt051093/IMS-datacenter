using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace PSSC.XCommon
{
    public class PersonInfoGenerator: DataGenerator
    {
        //Methods
        public string GeneratePersonName()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append(lastNames[random.Next(0, lastNames.Count() - 1)] + " ");
            sb.Append(middleNames[random.Next(0, middleNames.Count() - 1)] + " ");
            for (int i = 0; i < random.Next(1, 3); i++)
            {
                sb.Append(firstNames[random.Next(0, firstNames.Count() - 1)] + " ");
            }
            return sb.ToString().Trim();
        }

        public string GenerateEmail()
        {
            return this.GenerateEmailByName(this.GeneratePersonName());
        }

        public string GenerateEmailByName(string name)
        {
            StringBuilder sb = new StringBuilder();
            name = this.NormalizeString(name, false);

            List<string> words = Regex.Replace(name, @"\s+", ",").Split(',').ToList();
            words.RemoveAll(x => string.IsNullOrEmpty(x));

            //Generator
            for (int i = 0; i < words.Count; i++)
            {
                string temp = words[i].Trim().ToLower();
                if (!string.IsNullOrEmpty(temp))
                {
                    if (i == (words.Count - 1))
                    {
                        sb.Insert(0, temp);
                    }
                    else
                    {
                        sb.Append(temp.Substring(0, 1));
                    }
                }
            }
            sb.Append("@");
            sb.Append(domainNames[random.Next(0, domainNames.Count() - 1)]);
            return sb.ToString();
        }

        public string GeneratePhoneNumber()
        {
            StringBuilder sb = new StringBuilder();
            string result = phoneNumberHeaders[random.Next(0, phoneNumberHeaders.Count() - 1)];
            sb.Append(result);
            sb.Append(random.Next(1000000, 9999999));
            return sb.ToString();
        }

        public string GenerateAddress()
        {
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < random.Next(1, 4); i++ )
            {
                sb.Append(random.Next(1, 999));
                sb.Append("/");
            }
            sb.Remove(sb.Length - 1, 1);
            sb.Append(", đường ").Append(streets[random.Next(0, streets.Count() - 1)]);
            sb.Append(", phường ").Append(wards[random.Next(0,wards.Count() - 1)]);
            sb.Append(", ").Append(districts[random.Next(0, districts.Count() - 1)]);
            sb.Append(", Tp.HCM");
            return sb.ToString();
        }

        //Data
        List<string> firstNames = new List<string>() 
        { 
            "An","Ân","Bạc","Bạch","Bằng","Bảo","Bê","Bửu","Cao","Châu",
            "Chung","Chương","Chuyên","Công","Công Huyền","Công Nữ","Danh","Ðào",
            "Ðạo","Ðậu","Ðông","Dư","Ðức","Dương","Duy","Giang","Giao",
            "Hà","Hai","Hàn","Hạnh","Hoa","Hoài","Hương","Huy","Huỳnh",
            "Kha","Khưu","Kiên","Kim","Lâm","Lãnh","Liễu","Linh","Lĩnh",
            "Lộc","Lợi","Lưu","Luyện","Mạch","Mai","Mạnh","Minh","Mùi",
            "Nga","Ngân","Nghi","Nghiêm","Ngô","Ngọc","Ngưu","Nguyễn","Nhã",
            "Nhân","Nhất","Nhung","Ninh","Phú","Phúc","Phương","Quỳnh","Sâm",
            "Tân","Tần","Thạch","Thái","Thanh","Thảo","Thi","Thiên","Thiện",
            "Thiều","Thiệu","Thịnh","Thông","Tiến","Tôn Nữ","Trang","Trí","Triệu",
            "Trình","Từ","Tướng","Tuyên","Vân","Vạn","Vi","Vinh","Vũ",
            "Vương","Vỹ","Xuân","Yết"
        };
        List<string> middleNames = new List<string>() 
        { 
            "Ân","Bảo","Đại","Đinh","Đức","Hải","Linh","Mạnh","Minh","Nhi",
            "Phan","Thành","Thị","Thị Tú","Tú","Tuấn","Tuyết","Uyên","Văn"
        };

        List<string> lastNames = new List<string>() 
        { 
            "Bùi","Chu","Đan","Đặng","Đào","Diệp","Đinh","Đỗ","Dương","Đường",
            "Hà","Hồ","Huỳnh","Kha","Kiều","Lâm","Lê","Lục","Lưu",
            "Nguyễn","Nông","Ông","Phạm","Phan","Phùng","Quách","Tạ","Tôn",
            "Trần","Triệu","Trình","Trịnh","Ung","Văn","Võ","Vũ","Vương"
        };

        List<string> domainNames = new List<string>()
        {
            "gmail.com","yahoo.com.vn","hotmail.com", "outlook.com", "Inbox.com"
        };

        List<string> phoneNumberHeaders = new List<string>()
        {
            "091","094","0123","0125","0127","0129","090","093","0122","0126",
            "0128","0121","0120","098","097","0169","0168","0167","0166",
            "0165","092","0188","0199","095","096"
        };

        List<string> districts = new List<string>() 
        { 
            "quận 1","quận 2","quận 3","quận 4","quận 5","quận 6","quận 7","quận 8","quận 9","quận 10","quận 11","quận 12",
            "quận Tân Phú","quận Tân Bình","quận Phú Nhuận","quận Gò Vấp","quận Bình Thạnh","quận Bình Tân",
            "huyện Bình Chánh","huyện Cần Giờ","huyện Củ Chi","huyện Hóc Môn","huyện Nhà Bè"
        };

        List<string> wards = new List<string>() 
        { 
            "1","2","3","4","5","6","7","8","9","10","11","12",

        };

        List<string> streets = new List<string>() 
        { 
            "Bùi Thị Xuân","Bùi Viện","Cách Mạng Tháng Tám","Cao Bá Quát","Cống Quỳnh","Đặng Trần Côn","Đề Thám","Đồng Khởi","Hai Bà Trưng","Hàm Nghi",
            "Huyền Trân Công Chúa","Huỳnh Thúc Kháng","Lê Anh Xuân","Lê Duẩn","Lê Lai","Lê Lợi","Lê Thánh Tôn","Mạc Đĩnh Chi","Mạc Thị Bưởi",
            "Nam Kỳ Khởi Nghĩa","Nguyễn Bỉnh Khiêm","Nguyễn Cư Trinh","Nguyễn Đình Chiểu","Nguyễn Huệ","Nguyễn Hữu Cảnh","Nguyễn Thái Bình","Bà Huyện Thanh Quan","Bàn Cờ",
            "Cao Thắng","Điện Biên Phủ","Hồ Xuân Hương","Lý Thái Tổ","Cao Thắng","Đào Duy Anh","Đào Duy Từ","Đặng Văn Ngữ","Đoàn Thị Điểm",
            "Hồ Biểu Chánh","Huỳnh Văn Bánh","Nguyễn Trọng Tuyển","Nam Kỳ Khởi Nghĩa","Nguyễn Văn Trỗi","Phan Đăng Lưu","Phan Đình Phùng","Phan Xích Long","Phổ Quang",
            "Thích Quảng Đức","Trần Hữu Trang","Trần Khắc Chân","Trương Quốc Dung",
        };    
    }

}
