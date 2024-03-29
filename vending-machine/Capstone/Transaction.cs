﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text;


namespace Capstone
{
    
    public class Transaction
    {   
        public Transaction(decimal currentMoney)
        {
            this.CurrentMoney = currentMoney;
        }
        
        public decimal CurrentMoney { get; private set;}  

        public decimal Purchase(Item item) 
        {
            
            if (!item.Quantity.Contains("SOLD OUT") && CurrentMoney >= item.Price) 
            {
                item.DecrementItemQuantity();
                CurrentMoney -= item.Price;
                string transactionInfo = $"{DateTime.Now} {item.Name} {item.SlotLocation} ${item.Price} ${CurrentMoney}"; 
                RecordTransaction(transactionInfo);
                Console.WriteLine($"{item.Name} $ {item.Price}. \nMoney Remaining: $ {CurrentMoney} ");
                PurchasePhrase(item.Type);
                
                Console.WriteLine();
            }
            else if (CurrentMoney < item.Price && item.Quantity.Length > 1)
            {
                Console.WriteLine("You're broke and its sold out! No snack for you!");
                Console.WriteLine();
            }
            else if (item.Quantity.Contains("SOLD OUT"))
            {
                Console.WriteLine($"Item is {item.Quantity} Please make another selection.");
                Console.WriteLine();

            }
            else if (CurrentMoney < item.Price)
            {
                Console.WriteLine("Please insert more money or make another selection.");
                Console.WriteLine();
            }

            return CurrentMoney;
        }

        public decimal Deposit(decimal depositAmount)
        {
            CurrentMoney += depositAmount;
            string transactionInfo = $"{DateTime.Now} FEED MONEY: ${depositAmount} ${CurrentMoney}"; 
            RecordTransaction(transactionInfo);

            return CurrentMoney;
        }

        public decimal CashOut()
        {
            
            decimal beginningBalance = CurrentMoney;
            MakeChange();
            CurrentMoney = 0M;
            string transactionInfo = $"{DateTime.Now} GIVE CHANGE: ${beginningBalance} ${CurrentMoney}"; 
            RecordTransaction(transactionInfo);
            return CurrentMoney;
        }

        public void PurchasePhrase(string type)
        {

            type = type.ToLower();
            string returnPhrase = "";
            if (type == "chip")
            {
                returnPhrase = "Crunch Crunch, Yum!";
            }
            else if (type == "candy")
            {
                returnPhrase = "Munch Munch, Yum!";
            }
            else if (type == "drink")
            {
                returnPhrase = "Glug Glug, Yum!";
            }
            else if (type == "gum")
            {
                returnPhrase = "Chew Chew, Yum!";
            }

            Console.WriteLine(returnPhrase);
        }

        public void RecordTransaction(string transactionInfo)
        {
            string transactionFile = "Log.txt";
            string locationOfLogFile = Path.Combine(Environment.CurrentDirectory, transactionFile); 
            
            using (StreamWriter sr = new StreamWriter(locationOfLogFile,true))
            {
                    sr.WriteLine(transactionInfo);
            }
        }

        public int[] MakeChange()
        {
            int amountOfQuarters = 0;
            int amountOfDimes = 0;
            int amountOfNickels = 0;

            //decimal moneyInQuarters = 0M;
            //decimal moneyInDimes = 0M;     unused but implementable code that counts the amount of money in each denomination 
            //decimal moneyInNickels = 0M;

            int sentenceLength = 0;

            decimal change = CurrentMoney *= 100M;

            while (change - 25 >= 0)
            {
                
                change -= 25;
                amountOfQuarters++;
                sentenceLength++;
                //moneyInQuarters += 25M;
            }
            while (change - 10 >= 0)
            {
                change -= 10;
                amountOfDimes++;
                sentenceLength++;
               //moneyInDimes += 10M;
            }
            while (change - 5 >= 0)
            {
                change -= 5;
                amountOfNickels++;
                sentenceLength++;
                //moneyInNickels += 5M;
            }

            //moneyInQuarters /= 100.00M;
            //moneyInDimes /= 100.00M;      
            //moneyInNickels /= 100.00M;

            int[] coins = { amountOfQuarters, amountOfDimes, amountOfNickels };

            Console.WriteLine();
            Console.Write("Dispensing");     //This is a sentence maker. It puts the appropriate things where they need to be and does
                                     // does not include names (i.e., "nickel") if not needed. 
            if (sentenceLength == 0)
            {
                Console.Write($" nothing."); // If no change given
            }
            if (amountOfQuarters > 0 )
            {
                Console.Write($" {amountOfQuarters} quarter");  //Follows the loop for each coin type: if change was divided by this type, print.
            }
            if (amountOfQuarters > 1)                           // if it was divided by this type more than once, add an s
            {
                Console.Write($"s");
            }
            if ((amountOfDimes > 0 || amountOfNickels > 0) && amountOfQuarters > 0)      // if there are going to be other coin types, add a comma. Then repeat for each coin.
            {
                Console.Write($",");
            }
            if (amountOfDimes > 0)
            {
                Console.Write($" {amountOfDimes} dime");
            }
            if (amountOfDimes > 1)
            {
                Console.Write($"s");
            }
            if (amountOfDimes > 0 && amountOfNickels > 0)
            {
                Console.Write($",");
            }
            if (amountOfNickels > 0)
            {
                Console.Write($" {amountOfNickels} nickel");
            }
            if (sentenceLength > 0)
            {
                Console.Write(".");
            }

            Console.WriteLine("\n\nPress any key to continue");

            //Console.ReadKey();  //could be terminal crash cause
            Console.ReadLine();
           // Console.Clear();

            Console.Beep();
            return coins;
        }
    }
}
