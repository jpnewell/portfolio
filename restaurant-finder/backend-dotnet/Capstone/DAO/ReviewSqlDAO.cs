using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{
    public class ReviewSqlDAO : IReviewDAO
    {
        private readonly string connectionString;

        public ReviewSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        private Review GetReviewFromReader(SqlDataReader reader)
        {
            Review v = new Review()
            {
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                Rating = Convert.ToInt32(reader["restaurant_star_rating"]),
                SubmittedReview = Convert.ToString(reader["restaurant_review"])
            };

            return v;
        }

        public Review GetReview(int restaurantId)
        {
            Review returnReview = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT review_id, restaurant_id, restaurant_review, restaurant_star_rating " + 
                        "FROM restaurant_reviews WHERE restaurant_id = @restaurantId", conn);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        returnReview = GetReviewFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnReview;
        }
    }
}
