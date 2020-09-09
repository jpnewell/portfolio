using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IAccountDAO
    {
        AccountWithTypes GetAccount(int user_id);

        Account AddAccount(Account account);

        Account UpdateAccount(Account accountToUpdate);

        bool DeleteTypeFromAccount(int userId, int typeId);

        TypeAccount AddAccountType(TypeAccount account);
    }
}
