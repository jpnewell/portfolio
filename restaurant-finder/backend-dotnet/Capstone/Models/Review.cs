using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Review
    {
        public int RestaurantId { get; set; }
        public int Rating { get; set; }
        public string SubmittedReview { get; set; }
    }
}
