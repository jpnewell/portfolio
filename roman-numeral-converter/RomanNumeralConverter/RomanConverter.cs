using System;
using System.Collections.Generic;
using System.Text;

namespace RomanNumeralConverter
{
    public class RomanConverter
    {
        public string GetRomanNumerals(int arabicNumber)
        {   
            string[] romanBase = { "M", "D", "C", "L", "X", "V", "I"};
            int[] arabicBase = { 1000, 500, 100, 50, 10, 5, 1 };
            
            string romanString = "";
            for (int i = 0; i < 7; i++)
            {
                int divisionCheck = arabicNumber / arabicBase[i];                

                if (divisionCheck > 0)
                {
                    for (int j = 0; j < divisionCheck; j++)
                    {
                        romanString += romanBase[i];
                        arabicNumber -= arabicBase[i];
                    }
                }

                if (i < 5)
                {                    
                    int doubleAdvanceDivisionCheck = arabicNumber / (arabicBase[i] - arabicBase[i + 2]);

                    if (i % 2 == 0 && doubleAdvanceDivisionCheck > 0) // handles 9's
                    {
                        romanString += (romanBase[i + 2] + romanBase[i]);
                        arabicNumber -= (arabicBase[i] - arabicBase[i + 2]);
                    }
                }   
                
                if (i < 6)
                {
                    int singleAdvanceDivisionCheck = arabicNumber / (arabicBase[i] - arabicBase[i + 1]);

                    if (i % 2 != 0 && singleAdvanceDivisionCheck > 0) // handles 4's
                    {
                        romanString += (romanBase[i + 1] + romanBase[i]);
                        arabicNumber -= (arabicBase[i] - arabicBase[i + 1]);
                    }
                }
            }            

            return romanString; 
        }
    }
}

