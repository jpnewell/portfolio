using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class AccountSqlDAO : IAccountDAO
    {
        private readonly string connectionString;

        public AccountSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        //Gets the account based on the user_id. This will show information from the user_favorited_types as well which has all the information about the user's selected types from the questionaire.
        public AccountWithTypes GetAccount(int user_id)
        {
            AccountWithTypes returnAccount = null;

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("SELECT user_account.user_id, user_zip, " +
                        "String_AGG(CONVERT(nvarchar(max), ISNULL(restaurant_type.type, 'N/A')), ', ') AS types, " +
                        "String_AGG(CONVERT(nvarchar(max), ISNULL(restaurant_type.type_id, 'N/A')), ', ') AS typeId FROM user_account " +
                        "JOIN user_favorited_types ON user_favorited_types.user_id = user_account.user_id " +
                        "JOIN restaurant_type ON restaurant_type.type_id = user_favorited_types.type_id " +
                        "WHERE user_account.user_id = @user_id " +
                        "GROUP BY user_account.user_id, user_zip", conn);
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            returnAccount = GetAccountFromReader(reader);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            
            return returnAccount;
        }

        //Adds an account to the user_account table. This table only deals with the user's zipcode and the user's id
        public Account AddAccount(Account account)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_account (user_id, user_zip)" +
                        " VALUES (@user_id, @user_zip)", conn);
                    cmd.Parameters.AddWithValue("@user_id", account.UserId);
                    cmd.Parameters.AddWithValue("@user_zip", account.ZipCode);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return account;
        }

        //Updates the account table. This just deals with the user's zipcode and user_id
        public Account UpdateAccount(Account accountToUpdate)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(connectionString))
                {
                    sql.Open();

                    SqlCommand sqlCommand = new SqlCommand("UPDATE user_account SET user_zip = @zip WHERE user_id = @account_id", sql);
                    sqlCommand.Parameters.AddWithValue("@account_id", accountToUpdate.UserId);
                    sqlCommand.Parameters.AddWithValue("@zip", accountToUpdate.ZipCode);
                    int numberOfRowsAffected = sqlCommand.ExecuteNonQuery();

                    if (numberOfRowsAffected > 0)
                    {
                        return accountToUpdate;
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }
            return null;
        }

        //Delete's a type from the user_favorited_types table. Once this method is called it delete's one of the user's liked types. This method is called when switching the checkbox off in the questionaire
        public bool DeleteTypeFromAccount(int userId, int typeId)
        {
            try
            {
                using (SqlConnection sql = new SqlConnection(connectionString))
                {
                    sql.Open();

                    SqlCommand sqlCommand = new SqlCommand("DELETE FROM user_favorited_types WHERE user_id = @userId AND type_id = @typeId", sql);
                    sqlCommand.Parameters.AddWithValue("@userId", userId);
                    sqlCommand.Parameters.AddWithValue("@typeId", typeId);
                    int numberOfRowsAffected = sqlCommand.ExecuteNonQuery();

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

        //Adds a type to the user_favorited_types table. This method is called when you switch a checkbox on in the questionaire.
        public TypeAccount AddAccountType(TypeAccount account)
        {

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand("INSERT INTO user_favorited_types (user_id, type_id)" +
                        " VALUES (@userId, @typeId)", conn);
                    cmd.Parameters.AddWithValue("@userId", account.UserId);
                    cmd.Parameters.AddWithValue("@typeId", account.TypeId);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return account;
        }

        private AccountWithTypes GetAccountFromReader(SqlDataReader reader)
        {
            string typesString = Convert.ToString(reader["types"]);
            string typeIdString = Convert.ToString(reader["typeId"]);
            string[] typeIdStringArray = typeIdString.Split(',');
            List<int> typeIdList = new List<int>();
            for (int i = 0; i < typeIdStringArray.Length; i++)
            {
                typeIdList.Add(int.Parse(typeIdStringArray[i]));
            }
            int[] typeIdArray = typeIdList.ToArray();

            AccountWithTypes a = new AccountWithTypes()
            {
                UserId = Convert.ToInt32(reader["user_id"]),
                ZipCode = Convert.ToInt32(reader["user_zip"]),
                LikedTypes = typesString.Split(','),
                LikedTypesId = typeIdArray
            };

            return a;
        }
    }
}
