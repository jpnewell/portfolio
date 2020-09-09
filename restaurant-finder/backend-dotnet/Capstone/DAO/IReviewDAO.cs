using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public interface IReviewDAO
    {
        Review GetReview(int reviewId);

    }
}
