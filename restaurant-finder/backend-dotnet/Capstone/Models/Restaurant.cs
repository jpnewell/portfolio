using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Security.Models
{
    public class Restaurant
    {
        public int RestaurantId { get; set; }
        public string Name { get; set; }
        public string[] Types { get; set; }
        public int ZipCode { get; set; }
        public string Image { get; set; }
    }

    public class RestaurantDetails
    {
        public int RestaurantId { get; set; }
        public string RestaurantDescription { get; set; }
        public string RestaurantPhonenumber { get; set; }
        public string CovidMessage { get; set; }
        public string MapUrl { get; set; }
    }

    public class RestaurantTypes
    {
        public string Type { get; set; }
        public int TypeId { get; set; }
    }
}
