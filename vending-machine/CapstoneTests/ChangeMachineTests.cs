using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;

namespace Capstone.Tests
{
    [TestClass]
    public class ChangeMachineTests
    {
        public ChangeMachine change = new ChangeMachine();

        [TestMethod]
        [DataRow(0.05, new int[] { 0, 0, 1 })]
        [DataRow(0.10, new int[] { 0, 1, 0 })]
        [DataRow(0.15, new int[] { 0, 1, 1 })]
        [DataRow(0.20, new int[] { 0, 2, 0 })]
        [DataRow(0.25, new int[] { 1, 0, 0 })]
        [DataRow(0.30, new int[] { 1, 0, 1 })]
        [DataRow(0.35, new int[] { 1, 1, 0 })]
        [DataRow(0.40, new int[] { 1, 1, 1 })] //These are testing basic change in coins
        [DataRow(0.45, new int[] { 1, 2, 0 })]
        [DataRow(0.50, new int[] { 2, 0, 0 })]
        [DataRow(0.55, new int[] { 2, 0, 1 })]
        [DataRow(0.60, new int[] { 2, 1, 0 })]
        [DataRow(0.65, new int[] { 2, 1, 1 })]
        [DataRow(0.75, new int[] { 3, 0, 0 })]
        [DataRow(0.85, new int[] { 3, 1, 0 })]
        [DataRow(0.90, new int[] { 3, 1, 1 })]
        [DataRow(1.00, new int[] { 4, 0, 0 })]
        public void MakeChangeMethodTest(double currentBalance, int[] expectedCoins)
        {
            decimal decimalBalance = Convert.ToDecimal(currentBalance);
            CollectionAssert.AreEqual(expectedCoins, change.MakeChange(decimalBalance));
            
        }

    }
    
}
