using Microsoft.VisualStudio.TestTools.UnitTesting;
using RomanNumeralConverter;

namespace RomanNumeralConverterTests
{
    [TestClass]
    public class UnitTest1
    {
        RomanConverter romanConverter = new RomanConverter();

        [TestMethod]
        [DataRow(1000, "M")]
        [DataRow(2000, "MM")]
        [DataRow(3000, "MMM")]
        public void GetRomanThousands(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        [DataRow(500, "D")]
        [DataRow(1500, "MD")]
        public void GetRomanFiveHundreds(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }


        [TestMethod]
        [DataRow(100, "C")]
        [DataRow(200, "CC")]
        [DataRow(300, "CCC")]
        [DataRow(400, "CD")]
        public void GetRomanOneHundreds(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        [DataRow(50, "L")]
        [DataRow(150, "CL")]
        public void GetRomanFifty(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        [DataRow(10, "X")]
        [DataRow(20, "XX")]
        [DataRow(30, "XXX")]
        [DataRow(40, "XL")]
        public void GetRomanTens(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        [DataRow(5, "V")]
        [DataRow(15, "XV")]
        public void GetRomanFive(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        //[DataRow(1, "I")]
        //[DataRow(2, "II")]
        //[DataRow(3, "III")]
        [DataRow(4, "IV")]
        public void GetRomanOnes(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        [DataRow(900, "CM")]
        [DataRow(90, "XC")]
        [DataRow(9, "IX")]
        [DataRow(99, "XCIX")]
        [DataRow(199, "CXCIX")]
        [DataRow(999, "CMXCIX")]
        [DataRow(1999, "MCMXCIX")] 
        public void GetRomanNines(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }

        [TestMethod]
        [DataRow(44, "XLIV")]
        [DataRow(46, "XLVI")]
        [DataRow(444, "CDXLIV")]
        [DataRow(333, "CCCXXXIII")]
        [DataRow(1976, "MCMLXXVI")]
        [DataRow(1492, "MCDXCII")] 
        [DataRow(92, "XCII")]
        [DataRow(192, "CXCII")]
        [DataRow(292, "CCXCII")] 
        [DataRow(392, "CCCXCII")] 

        public void GetRomanEdgeCases(int arabic, string expectedRoman)
        {
            Assert.AreEqual(expectedRoman, romanConverter.GetRomanNumerals(arabic));
        }
    }
}
