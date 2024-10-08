﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MovieBooker.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Crypto.Prng;
using System.IdentityModel.Tokens.Jwt;
using System.Net.Http.Headers;
using System.Security.Cryptography.Xml;
using System.Text;

namespace MovieBooker.Pages.Users.Cart
{
    public class PayTicketModel : PageModel
    {
        private readonly IAuthenService _authenticationService;
        public PayTicketModel(IAuthenService authenticationService)
        {
            _authenticationService = authenticationService;
        }
        public List<ScheduleDTO> schedules { get; set; }
        public async Task<IActionResult> OnGetAsync()
        {
            return Page();
        }
        public List<SeatDTO> seats { get; set; }
        public List<UserDTO> Users { get; set; }

        public async Task<IActionResult> OnPostBuyTicketAsync(int timeSlotId, double movieprice, List<int> seatId,
            int movieId, int scheduleId, double finalTotalPrice)
        {
            HttpClient _httpClient = new HttpClient();
            HttpResponseMessage response = await
           _httpClient.GetAsync($"https://localhost:5000/api/Schedule/GetSchedule?$filter=schedulesId eq {scheduleId}");
            if (response.IsSuccessStatusCode)
            {
                schedules = await response.Content.ReadFromJsonAsync<List<ScheduleDTO>>();
            }
            HttpResponseMessage response2 = await _httpClient.GetAsync($"https://localhost:5000/api/Seat/GetSeat");
            if (response2.IsSuccessStatusCode)
            {
                var allSeats = await response2.Content.ReadFromJsonAsync<List<SeatDTO>>();
                seats = allSeats.Where(seat => seatId.Contains(seat.SeatId)).ToList();
            }
            TempData["totalprice"] = finalTotalPrice;
            TempData["seatId"] = JsonConvert.SerializeObject(seatId);
            return Page();
        }

        //public async Task<IActionResult> OnPostPaymentAsync(int timeslotid, int movieid, double totalprice, DateTime resdate)
        //{
        //    var seatIdJson = TempData["seatId"].ToString();
        //    List<int> seatId = JsonConvert.DeserializeObject<List<int>>(seatIdJson);
        //    var accessToken = await _authenticationService.GetAccessTokenAsync();
        //    HttpClient _httpClient = new HttpClient();
        //    _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);
        //    var handler = new JwtSecurityTokenHandler();
        //    var jwtToken = handler.ReadToken(accessToken) as JwtSecurityToken;
        //    var email = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")?.Value;
        //    HttpResponseMessage response = await _httpClient.GetAsync($"https://localhost:5000/api/User/GetAllUser?$filter=email eq '{email}'");
        //    if (response.IsSuccessStatusCode)
        //    {
        //        Users = await response.Content.ReadFromJsonAsync<List<UserDTO>>();
        //    }
        //    int userId = 0;
        //    foreach (var id in Users)
        //    {
        //        userId = id.UserId;
        //    }

        //    for (int i = 0; i < seatId.Count(); i++)
        //    {
        //        var res = new CreateResevationDTO
        //        {
        //            MovieId = movieid,
        //            UserId = userId,
        //            TimeSlotId = timeslotid,
        //            SeatId = seatId[i],
        //            ReservationDate = resdate,
        //            Status = false,
        //            TotalAmount = totalprice / seatId.Count(),
        //        };
        //        HttpResponseMessage response2 = await
        //       _httpClient.PostAsJsonAsync("https://localhost:5000/api/Reservation/CreateReservation", res);
        //    }
        //    return RedirectToPage("/Users/Cart/BookedSuccess");
        //}

        public async Task<IActionResult> OnPostPaymentAsync(int timeslotid, int movieid,
            double totalprice, DateTime resdate, int schedulesId, string confirmemail, string payment)
        {
            HttpClient httpClient = new HttpClient();
            var seatIdJson = TempData["seatId"].ToString();
            List<int> seatId = JsonConvert.DeserializeObject<List<int>>(seatIdJson);
            var accessToken = await _authenticationService.GetAccessTokenAsync();
            HttpClient _httpClient = new HttpClient();
            _httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);
            var handler = new JwtSecurityTokenHandler();
            var jwtToken = handler.ReadToken(accessToken) as JwtSecurityToken;
            var email = jwtToken.Claims.FirstOrDefault(claim => claim.Type == "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")?.Value;
            HttpResponseMessage response2 = await _httpClient.GetAsync($"https://localhost:5000/api/User/GetAllUser?$filter=email eq '{email}'");
            if (response2.IsSuccessStatusCode)
            {
                Users = await response2.Content.ReadFromJsonAsync<List<UserDTO>>();
            }
            int userId = 0;
            foreach (var id in Users)
            {
                userId = id.UserId;
            }

            if (payment == "vnpay")
            {
                var model = new VnPaymentRequestModel
                {
                    Amount = totalprice,
                    CreatedDate = DateTime.Now,
                    FullName = confirmemail,
                    Description = "movie ticket",
                    OrderId = new Random().Next(1000, 9999)
                };

                HttpResponseMessage response = await httpClient.PostAsJsonAsync("https://localhost:5000/api/VnPay/CreatePaymentUrl", model);
                if (response.IsSuccessStatusCode)
                {
                    string paymentUrlJson = await response.Content.ReadAsStringAsync();
                    var paymentUrlObject = JsonConvert.DeserializeObject<Dictionary<string, string>>(paymentUrlJson);
                    if (paymentUrlObject != null && paymentUrlObject.TryGetValue("paymentUrl", out string paymentUrl))
                    {
                        var reservations = new List<CreateResevationDTO>();
                        for (int i = 0; i < seatId.Count(); i++)
                        {
                            var res = new CreateResevationDTO
                            {
                                MovieId = movieid,
                                UserId = userId,
                                TimeSlotId = timeslotid,
                                SeatId = seatId[i],
                                ReservationDate = resdate,
                                Status = true,
                                TotalAmount = totalprice / seatId.Count(),
                            };
                            reservations.Add(res);
                        }
                        TempData["resevation"] = JsonConvert.SerializeObject(reservations);
                        TempData["seatId"] = JsonConvert.SerializeObject(seatId);
                        TempData["email"] = email;
                        TempData["scheduleId"] = schedulesId;
                        TempData["confirmemail"] = confirmemail;
                        return Redirect(paymentUrl);
                    }
                }
                return RedirectToPage("/Error");
            }
            else if (payment == "paypal")
            {
                var response = await _httpClient.PostAsync("https://localhost:5000/api/PayPal/create-payment", new StringContent(totalprice.ToString(), Encoding.UTF8, "application/json"));
                if (response.IsSuccessStatusCode)
                {
                    var responseBody = await response.Content.ReadAsStringAsync();
                    var approvalUrl = JObject.Parse(responseBody)["approvalUrl"].ToString();

                    var reservations = new List<CreateResevationDTO>();
                    for (int i = 0; i < seatId.Count(); i++)
                    {
                        var res = new CreateResevationDTO
                        {
                            MovieId = movieid,
                            UserId = userId,
                            TimeSlotId = timeslotid,
                            SeatId = seatId[i],
                            ReservationDate = resdate,
                            Status = true,
                            TotalAmount = totalprice / seatId.Count(),
                        };
                        reservations.Add(res);
                    }
                    TempData["resevation"] = JsonConvert.SerializeObject(reservations);
                    TempData["seatId"] = JsonConvert.SerializeObject(seatId);
                    TempData["email"] = email;
                    TempData["scheduleId"] = schedulesId;
                    TempData["confirmemail"] = confirmemail;
                    return Redirect(approvalUrl);
                }
                return RedirectToPage("/Error");
            }
            return RedirectToPage("/Error");
        }
    }
}
