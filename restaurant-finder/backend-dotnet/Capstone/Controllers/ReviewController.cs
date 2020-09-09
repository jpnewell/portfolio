using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Capstone.DAO;
using Capstone.Security.Models;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class ReviewController : ControllerBase
    {
        private readonly IReviewDAO reviewDAO;
        public ReviewController(IReviewDAO _reviewDAO)
        {
            reviewDAO = _reviewDAO;
        }

        [HttpGet("{id}")]
        public ActionResult<Review> GetReview(int id)
        {
            Review review = reviewDAO.GetReview(id);

            if (review != null)
            {
                return Ok(review);
            }
            else
            {
                return NotFound();
            }
        }
    }
}
