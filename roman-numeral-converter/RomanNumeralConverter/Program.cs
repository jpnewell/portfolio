using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace RomanNumeralConverter
{
    public class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("\n\n");
            Console.WriteLine("\n\t\t Welcome to my Roman Numeral Converter \n\n");

            Console.WriteLine("\tMM    MM DDDDD    CCCCC  LL      XX    XX VV     VV IIII");
            Console.WriteLine("\tMMM  MMM DD  DD  CC    C LL       XX  XX  VV     VV  II");
            Console.WriteLine("\tMM MM MM DD   DD CC      LL        XXXX    VV   VV   II");
            Console.WriteLine("\tMM    MM DD   DD CC    C LL       XX  XX    VV VV    II");
            Console.WriteLine("\tMM    MM DDDDDD   CCCCC  LLLLLLL XX    XX    VVV    IIII");
            
            Console.Write("\n\n\t\t Enter a number to be converted (1-3000): ");

            bool isValidInteger = false; 
            int attempts = 0;
            while (!isValidInteger && attempts < 3)
            {                
                string userInput = Console.ReadLine();
                isValidInteger = int.TryParse(userInput, out int arabicNumber) && (arabicNumber > 0 && arabicNumber <= 3000);
                if (isValidInteger)
                {
                    RomanConverter converter = new RomanConverter();
                    string romanString = converter.GetRomanNumerals(arabicNumber);
                    Console.WriteLine($"\n\t The number {arabicNumber} would be written as {romanString} in Roman Numerals");
                    Console.WriteLine();
                }
                else
                {
                    Console.Write("\t\t Invalid number. Please try again: ");
                    attempts++;
                }                
            }            
        }
    }
}
                                                  