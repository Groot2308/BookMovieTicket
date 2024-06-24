﻿using MovieBooker_backend.DTO;
using MovieBooker_backend.Models;
using Microsoft.AspNetCore.Mvc;

namespace MovieBooker_backend.Repositories.ReservationRepository
{
    public interface IReservationRepository
    {
        public IEnumerable<ReservationDTO> GetAllReservation();
        public ReservationDTO GetReservationById(int resId);
        public Task<int> AddNewReservation(Revervation res);

    }
}
