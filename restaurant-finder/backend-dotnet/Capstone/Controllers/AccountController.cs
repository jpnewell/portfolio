using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.DAO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Capstone.Security.Models;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    [Authorize]
    public class AccountController : ControllerBase
    {
        private readonly IAccountDAO accountDAO;

        public AccountController(IAccountDAO _accountDAO)
        {
            accountDAO = _accountDAO;
        }

        [HttpGet]
        public ActionResult<AccountWithTypes> GetAccount()
        {
            var userId = Convert.ToInt32(User.FindFirst("sub")?.Value);
            AccountWithTypes account = accountDAO.GetAccount(userId);

            if (account != null)
            {
                return Ok(account);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpDelete("{typeId}")]
        public ActionResult<AccountWithTypes> DeleteTypeFromAccount(int typeId)
        {
            var userId = Convert.ToInt32(User.FindFirst("sub")?.Value);
            bool result = accountDAO.DeleteTypeFromAccount(userId, typeId);

            if(result)
            {
                return NoContent();
            }

            return StatusCode(500);
        }

        [HttpPut]
        public ActionResult<Account> UpdateAccount(Account updatedAccount)
        {
            var userId = Convert.ToInt32(User.FindFirst("sub")?.Value);
            AccountWithTypes existingAccount = accountDAO.GetAccount(userId);

            Account result = accountDAO.UpdateAccount(updatedAccount);
            return Ok(result);
        }

        [HttpPost]
        public ActionResult<Account> AddAccount(Account addedAccount)
        {
            Account account = accountDAO.AddAccount(addedAccount);

            if (account != null)
            {
                return Ok(account);
            }
            else
            {
                return NotFound();
            }
        }

        [HttpPost("type")]
        public ActionResult<TypeAccount> AddAccountType(TypeAccount addedAccount)
        {
            TypeAccount account = accountDAO.AddAccountType(addedAccount);

            if (account != null)
            {
                return Ok(account);
            }
            else
            {
                return NotFound();
            }
        }
    }
}