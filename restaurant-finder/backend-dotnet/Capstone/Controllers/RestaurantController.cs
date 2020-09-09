using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Capstone.DAO;
using Capstone.Security.Models;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class RestaurantController : ControllerBase
    {
        private readonly IRestaurantDAO restaurantDAO;

        public RestaurantController(IRestaurantDAO _restaurantDAO)
        {
            restaurantDAO = _restaurantDAO;
        }

        [HttpGet]
        public ActionResult<List<Restaurant>> GetAllRestaurants()
        {
            var userId = Convert.ToInt32(User.FindFirst("sub")?.Value);
            List<Restaurant> restaurants = restaurantDAO.GetRestaurantByType(userId);

            if (restaurants != null)
            {
                return Ok(restaurants);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("{id}")]
        public ActionResult<Restaurant> GetRestaurant(int id)
        {
            Restaurant restaurant = restaurantDAO.GetRestaurant(id);

            if (restaurant != null)
            {
                return Ok(restaurant);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("types")]
        public ActionResult<List<string>> GetRestaurantTypes()
        {
            List<RestaurantTypes> types = restaurantDAO.GetRestaurantTypes();

            if (types != null)
            {
                return Ok(types);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("zipcode/{zip}")]
        public ActionResult<List<Restaurant>> GetRestaurantByZip(int zip)
        {
            List<Restaurant> restaurants = restaurantDAO.GetRestaurantByZip(zip);

            if (restaurants != null)
            {
                return Ok(restaurants);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpGet("{id}/details")]
        public ActionResult<RestaurantDetails> GetRestaurantDetails(int id)
        {
            RestaurantDetails restaurantDetails = restaurantDAO.GetRestaurantDetails(id);

            if (restaurantDetails != null)
            {
                return Ok(restaurantDetails);
            }
            else
            {
                return NotFound();
            }
        }
    }
}