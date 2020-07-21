using System;
using System.Collections.Generic;
using System.Text;

namespace Capstone
{                               //This is only left open to show we made some unit tests to drive the development of the code/method.  
                                //It is only referenced by the ChangeMachineTests Class.
    public class ChangeMachine  //perhaps we could handle this inside Transaction Class (I was thinking maybe we should handle all those things in one area)
    {
        public int[] MakeChange(decimal currentMoney)
        {


            int amountOfQuarters = 0;
            int amountOfDimes = 0;
            int amountOfNickels = 0;

            //decimal moneyInQuarters = 0M;
            //decimal moneyInDimes = 0M;     unused but implementable code that counts the amount of money in each denomination 
            //decimal moneyInNickels = 0M;

            int sentenceLength = 0;

            decimal change = currentMoney *= 100M;

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
            if (amountOfQuarters > 0)
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
