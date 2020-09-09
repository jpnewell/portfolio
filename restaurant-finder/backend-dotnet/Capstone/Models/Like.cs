using Capstone.Security.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Like
    {
        public int UserId { get; set; }
        public int RestaurantId { get; set; }
        public string RestaurantName { get; set; }
        public string RestaurantDescription { get; set; }
        public string RestaurantPhonenumber { get; set; }
        public string CovidMessage { get; set; }
        public string MapUrl { get; set; }
    }
}
