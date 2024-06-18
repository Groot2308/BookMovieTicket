﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MimeKit;
using MovieBooker.Models;
using StackExchange.Redis;
using System.Net;
using MailKit.Net.Smtp;
using Newtonsoft.Json;
using System.Net.Http.Json;

namespace MovieBooker.Pages
{
    public class RegisterModel : PageModel
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly IConnectionMultiplexer _redisConnection;
        private readonly HttpClient _httpClient;

        public RegisterModel(IHttpClientFactory httpClientFactory, IConnectionMultiplexer redisConnection, HttpClient httpClient)
        {
            _httpClientFactory = httpClientFactory;
            _redisConnection = redisConnection;
            _httpClient = httpClient;
        }

        [BindProperty]
        public User User { get; set; } = default!;

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (User.Password != User.ConfirmPassword)
            {
                ModelState.AddModelError(string.Empty, "Confirm Password incorrect.");
                return Page();
            }
            var httpClient = _httpClientFactory.CreateClient();
            var SignUpData = new { User.UserName, User.Email, User.Password, User.PhoneNumber, User.Address, User.Gender, User.Dob };
            TempData["SignUpData"] = JsonConvert.SerializeObject(SignUpData);
            var response = await httpClient.GetAsync($"https://localhost:5000/api/User/CheckSignUpEmail/{User.Email}");
            if (response.StatusCode == HttpStatusCode.NotFound)
            {
                var email = new MimeMessage();
                email.From.Add(MailboxAddress.Parse(User.From));
                email.To.Add(MailboxAddress.Parse(User.Email));
                email.Subject = "Vui lòng xác thực email của bạn";
                int number = GenerateRandom5DigitNumber();


                //string emailBody = "Your single-use code is: " + number.ToString();
                string emailBody = $@"
    <html>
    <head>
        <style>
            body {{
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }}
            .container {{
                max-width: 600px;
                margin: 20px auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }}
            h2 {{
                color: #da0f32;
                text-align: center;
                margin-bottom: 20px;
            }}
            .code {{
                background-color: #da0f32;
                color: white;
                font-size: 24px;
                padding: 10px;
                text-align: center;
                border-radius: 5px;
                margin-bottom: 20px;
            }}
            p {{
                margin-bottom: 10px;
            }}
            .footer {{
                text-align: center;
                margin-top: 20px;
                color: #666666;
            }}
        </style>
    </head>
    <body>
        <div class='container'>
            <div class='header-image'>
                <img src='https://inkythuatso.com/uploads/thumbnails/800/2021/09/cgv-logo-inkythuatso-1-14-16-41-01.jpg' alt='Email Header Image' style='max-width: 100%; height: auto;'>
            </div>
            <h2>Xác thực email của bạn</h2>
            <p>Cảm ơn bạn đã đăng ký. Dưới đây là mã xác thực duy nhất của bạn:</p>
            <div class='code'>{number}</div>
            <p>Vui lòng sử dụng mã này để hoàn tất quá trình đăng ký.</p>
            <p>Mã này sẽ hết hạn trong vòng 5 phút.</p>
            <p>Xin cảm ơn!</p>
        </div>
        <p class='footer'>CGV Cinema - Địa chỉ: 123 FPT University - Điện thoại: 0123 456 789</p>
    </body>
    </html>";


                email.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = emailBody };
                var db1 = _redisConnection.GetDatabase();
                await db1.StringSetAsync("VerifyEmail", number, TimeSpan.FromMinutes(5));
                using var smtp = new SmtpClient();
                smtp.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
                smtp.Authenticate(User.From, User.PasswordSendMail);
                smtp.Send(email);
                smtp.Disconnect(true);
                return RedirectToPage("/Register/VerifyRegister");
            }
            else if (response.IsSuccessStatusCode)
            {
                ModelState.AddModelError(string.Empty, "Email already exists");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Register Failed!!!");
            }
            return Page();
        }



        //    public async Task<IActionResult> OnPostAsync()
        //    {
        //        if (User.Password != User.ConfirmPassword)
        //        {
        //            ModelState.AddModelError(string.Empty, "Confirm Password incorrect.");
        //            return Page();
        //        }
        //        var httpClient = _httpClientFactory.CreateClient();
        //        var SignUpData = new { User.UserName, User.Email, User.Password, User.PhoneNumber, User.Address, User.Gender, User.Dob };
        //        TempData["SignUpData"] = JsonConvert.SerializeObject(SignUpData);
        //        var response = await httpClient.GetAsync($"https://localhost:5000/api/User/CheckSignUpEmail/{User.Email}");
        //        if (response.StatusCode == HttpStatusCode.NotFound)
        //        {
        //            var email = new MimeMessage();
        //            email.From.Add(MailboxAddress.Parse(User.From));
        //            email.To.Add(MailboxAddress.Parse(User.Email));
        //            email.Subject = "Vui lòng thanh toán hóa đơn tại Stars Karaoke";
        //            int number = GenerateRandom5DigitNumber();


        //            //string emailBody = "Your single-use code is: " + number.ToString();
        //            string emailBody = $@"
        //<html>
        //<head>
        //    <style>
        //        body {{
        //            font-family: Arial, sans-serif;
        //            background-color: #f5f5f5;
        //            padding: 20px;
        //        }}
        //        .container {{
        //            max-width: 600px;
        //            margin: 0 auto;
        //            background-color: #ffffff;
        //            padding: 30px;
        //            border-radius: 10px;
        //            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        //        }}
        //        h2 {{
        //            color: #da0f32;
        //            text-align: center;
        //            margin-bottom: 20px;
        //        }}
        //        .payment-details {{
        //            background-color: #f0f0f0;
        //            padding: 15px;
        //            border-radius: 5px;
        //            margin-bottom: 20px;
        //        }}
        //        ul {{
        //            list-style-type: none;
        //            padding: 0;
        //            margin: 0;
        //        }}
        //        li {{
        //            margin-bottom: 10px;
        //        }}
        //        .footer {{
        //            text-align: center;
        //            margin-top: 20px;
        //            color: #666666;
        //        }}
        //    </style>
        //</head>
        //<body>
        //    <div class='container'>
        //        <h2>Thanh toán tiền quán karaoke</h2>
        //        <p>Xin chào Nguyễn Văn Sơn,</p>
        //        <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Dưới đây là chi tiết thanh toán của bạn:</p>
        //        <div class='payment-details'>
        //            <h3>10 000 000 VNĐ</h3>
        //            <p>Vui lòng thanh toán số tiền này để hoàn tất quá trình thanh toán.</p>
        //        </div>
        //        <p>Vui lòng sử dụng thông tin thanh toán dưới đây:</p>
        //        <ul>
        //            <li><strong>Ngân hàng:</strong>BIDV</li>
        //            <li><strong>Số thẻ ngân hàng:</strong>1234 5678 9012 3456</li>
        //            <li><strong>Chủ thẻ:</strong>Nguyễn Hồng Đăng</li>
        //            <li><strong>Số tiền:</strong>10 000 000</li>
        //        </ul>
        //        <p>Xin cảm ơn bạn đã lựa chọn dịch vụ của chúng tôi!</p>
        //        <p class='footer'>Quán karaoke Stars Karaoke - Địa chỉ: 123 Thạch Hòa, Thạch Thất, Hà Nội - Điện thoại: 0123 456 789</p>
        //    </div>
        //</body>
        //</html>";


        //            email.Body = new TextPart(MimeKit.Text.TextFormat.Html) { Text = emailBody };
        //            var db1 = _redisConnection.GetDatabase();
        //            await db1.StringSetAsync("VerifyEmail", number, TimeSpan.FromMinutes(5));
        //            using var smtp = new SmtpClient();
        //            smtp.Connect("smtp.gmail.com", 587, MailKit.Security.SecureSocketOptions.StartTls);
        //            smtp.Authenticate(User.From, User.PasswordSendMail);
        //            smtp.Send(email);
        //            smtp.Disconnect(true);
        //            return RedirectToPage("/Register/VerifyRegister");
        //        }
        //        else if (response.IsSuccessStatusCode)
        //        {
        //            ModelState.AddModelError(string.Empty, "Email already exists");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError(string.Empty, "Register Failed!!!");
        //        }
        //        return Page();
        //    }
        private int GenerateRandom5DigitNumber()
        {
            Random rand = new Random();
            int min = 10000;
            int max = 99999;
            return rand.Next(min, max);
        }
    }
}
