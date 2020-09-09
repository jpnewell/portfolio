using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class LikeSqlDAO : ILikeDAO
    {
        private readonly string connectionString;

        public LikeSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
        public List<Like> GetAllLikesPerUser(int user_id)
        {
            List<Like> returnLikes = new List<Like>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_id, user_favorites.restaurant_id, restaurant_name, restaurant_description, restaurant_phonenumber, covid_message, map_url FROM user_favorites " +
                        "JOIN restaurants ON restaurants.restaurant_id = user_favorites.restaurant_id " +
                        "JOIN restaurant_details ON restaurants.restaurant_id = restaurant_details.restaurant_id WHERE user_id = @user_id", conn);
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnLikes.Add(GetLikesFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnLikes;
        }

        public Like AddLike(int userId, Like like)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_favorites (user_id, restaurant_id)" +
                        " VALUES (@user_id, @restaurant_id)", conn);
                    cmd.Parameters.AddWithValue("@user_id", userId);
                    cmd.Parameters.AddWithValue("@restaurant_id", like.RestaurantId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }
            like.UserId = userId;

            return like;
        }

        public bool DeleteLike(int restaurantId, int userId)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("DELETE FROM user_favorites WHERE user_id = @userId AND restaurant_id = @restaurantId" , conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    int numberOfRowsAffected = cmd.ExecuteNonQuery();
                    if (numberOfRowsAffected > 0)
                    {
                        return true;
                    }
                }
               
            }
            catch (SqlException)
            {
                throw;
            }

            return false;
        }

        private Like GetLikesFromReader(SqlDataReader reader)
        {
            Like k = new Like()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                RestaurantName = Convert.ToString(reader["restaurant_name"]),
                RestaurantDescription = Convert.ToString(reader["restaurant_description"]),
                RestaurantPhonenumber = Convert.ToString(reader["restaurant_phonenumber"]),
                CovidMessage = Convert.ToString(reader["covid_message"]),
                MapUrl = Convert.ToString(reader["map_url"])
            };

            return k;
        }
    }
}
