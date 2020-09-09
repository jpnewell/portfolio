using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Capstone.Models;
using Capstone.Security;
using Capstone.Security.Models;

namespace Capstone.DAO
{ 
    public class RestaurantSqlDAO : IRestaurantDAO
    {
        private readonly string connectionString;

        public RestaurantSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }


        //Gets the Restaurant based on the desired type. Might Delete later because it has zero implementations at the current state of our program.
        public Restaurant GetRestaurant(int restaurantId)
        {
            Restaurant returnRestaurant = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurants.restaurant_id, restaurant_name, location_zip, image_source, " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(restaurant_type.type, 'N/A')), ', ') AS types FROM restaurants " +
                        "JOIN restaurants_and_their_types ON restaurants_and_their_types.restaurant_id = restaurants.restaurant_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = restaurants_and_their_types.type_id " +
                        "WHERE restaurants.restaurant_id = @restaurantId " +
                        "GROUP BY restaurants.restaurant_id, restaurant_name, location_zip, image_source", conn);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        returnRestaurant = GetRestaurantFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurant;
        }

        //Gets the restaurants based on the user's type preference. Decided to cut out the get all Restaurants Method because this one was a more practicle and more effiecent way of doing it.
        public List<Restaurant> GetRestaurantByType(int userId)
        {

            List<Restaurant> returnRestaurants = new List<Restaurant>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurants.restaurant_id, restaurant_name, location_zip, image_source, " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(restaurant_type.type, 'N/A')), ', ') AS types FROM restaurants " +
                        "JOIN restaurants_and_their_types ON restaurants_and_their_types.restaurant_id = restaurants.restaurant_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = restaurants_and_their_types.type_id" +
                        " JOIN user_favorited_types ON user_favorited_types.type_id = restaurant_type.type_id WHERE user_id = @userId " +
                        "AND restaurants.restaurant_id NOT IN (SELECT user_favorites.restaurant_id FROM user_favorites WHERE user_favorites.user_id = @userId)" +
                        " GROUP BY restaurants.restaurant_id, restaurant_name, location_zip, image_source", conn);
                    cmd.Parameters.AddWithValue("@userId", userId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurants.Add(GetRestaurantFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurants;
        }

        //Will get all the Restaurants based on the zipcode of the user. This also doesn't have any uses yet.
        public List<Restaurant> GetRestaurantByZip(int restaurantZip)
        {
            List<Restaurant> returnRestaurants = new List<Restaurant>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurants.restaurant_id, restaurant_name, location_zip, image_source, " +
                        "String_AGG(CONVERT(nvarchar(max),ISNULL(restaurant_type.type, 'N/A')), ', ') AS types FROM restaurants " +
                        "JOIN restaurants_and_their_types ON restaurants_and_their_types.restaurant_id = restaurants.restaurant_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = restaurants_and_their_types.type_id " +
                        "WHERE location_zip = @restaurantZip GROUP BY restaurants.restaurant_id, restaurant_name, location_zip, image_source", conn);
                    cmd.Parameters.AddWithValue("@restaurantZip", restaurantZip);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurants.Add(GetRestaurantFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurants;
        }

        //Gets all of the restaurant types in our database
        public List<RestaurantTypes> GetRestaurantTypes()
        {
            List<RestaurantTypes> returnRestaurantTypes = new List<RestaurantTypes>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT type, type_id FROM restaurant_type", conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnRestaurantTypes.Add(GetRestaurantTypeFromReader(reader));
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurantTypes;
        }

        //Gets all the extra information that we have in our database about the restaurants
        public RestaurantDetails GetRestaurantDetails(int restaurantId)
        {
            RestaurantDetails returnRestaurantDetails = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT restaurant_id, restaurant_description, restaurant_phonenumber, " + 
                        "covid_message, map_url FROM restaurant_details WHERE restaurant_id = @restaurantId", conn);
                    cmd.Parameters.AddWithValue("@restaurantId", restaurantId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows && reader.Read())
                    {
                        returnRestaurantDetails = GetRestaurantDetailsFromReader(reader);
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return returnRestaurantDetails;
        }

        private RestaurantDetails GetRestaurantDetailsFromReader(SqlDataReader reader)
        {
            RestaurantDetails rd = new RestaurantDetails()
            {
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                RestaurantDescription = Convert.ToString(reader["restaurant_description"]),
                RestaurantPhonenumber = Convert.ToString(reader["restaurant_phonenumber"]),
                CovidMessage = Convert.ToString(reader["covid_message"]),
                MapUrl = Convert.ToString(reader["map_url"])
            };

            return rd;
        }

        private Restaurant GetRestaurantFromReader(SqlDataReader reader)
        {
            string typesString = Convert.ToString(reader["types"]);
            Restaurant r = new Restaurant()
            {
                RestaurantId = Convert.ToInt32(reader["restaurant_id"]),
                Name = Convert.ToString(reader["restaurant_name"]),
                Types = typesString.Split(','),
                ZipCode = Convert.ToInt32(reader["location_zip"]),
                Image = Convert.ToString(reader["image_source"])
            };

            return r;
        }

        private RestaurantTypes GetRestaurantTypeFromReader(SqlDataReader reader)
        {
            RestaurantTypes r = new RestaurantTypes()
            {
                Type = Convert.ToString(reader["type"]),
                TypeId = Convert.ToInt32(reader["type_id"])
            };

            return r;
        }
    }
}
