using Capstone.Security.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class AccountWithTypes
    {
        public int UserId { get; set; }
        public int ZipCode { get; set; }
        public string[] LikedTypes { get; set; }
        public int[] LikedTypesId { get; set; }
    }

    public class Account
    {
        public int UserId { get; set; }
        public int ZipCode { get; set; }
    }

    public class TypeAccount
    {
        public int UserId { get; set; }
        public int TypeId { get; set; }
    }

    public class UserFavorited
    {
        public int UserId { get; set; }
        public Restaurant Restaurant { get; set; }
    }
}
