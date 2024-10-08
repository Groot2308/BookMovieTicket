﻿using System;
using System.Collections.Generic;

namespace MovieBooker_backend.Models
{
    public partial class TimeSlot
    {
        public TimeSlot()
        {
            Revervations = new HashSet<Revervation>();
            Schedules = new HashSet<Schedule>();
        }

        public int TimeSlotId { get; set; }
        public string? StartTime { get; set; }
        public string? EndTime { get; set; }

        public virtual ICollection<Revervation> Revervations { get; set; }
        public virtual ICollection<Schedule> Schedules { get; set; }
    }
}
