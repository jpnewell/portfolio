using System;
using System.Collections.Generic;
using System.IO;

namespace Capstone
{
    class SalesReport
    {
        public SalesReport(Dictionary<string, Item> ItemBySlotLocation)
        {
            TotalSalesByItemName = CreateDictionary(ItemBySlotLocation);
            SalesReportWriter(TotalSalesByItemName);
        }

        public Dictionary<string, int> TotalSalesByItemName { get; }

        public Dictionary<string, int> CreateDictionary(Dictionary<string, Item> ItemBySlotLocation) //Creating dictionary based on Master ItemBySlotLocation
        {
            Dictionary<string, int> TotalSalesByItemName = new Dictionary<string, int>();
            int initialCount = 0;

            foreach (KeyValuePair<string, Item> keyValuePair in ItemBySlotLocation)
            {
                TotalSalesByItemName.Add(keyValuePair.Value.Name, initialCount);
            }

            return TotalSalesByItemName;
        }

        public void SalesReportWriter(Dictionary<string, int> TotalSalesByItemName)  // reads from transaction log and updates the qty sold for each item
        {
            string transactionFile = "Log.txt";
            string locationOfLogFile = Path.Combine(Environment.CurrentDirectory, transactionFile);

            decimal grossTotalSales = 0M;
            using (StreamReader sr = new StreamReader(locationOfLogFile))
            {
                while (!sr.EndOfStream)
                {
                    
                    string[] eachTransaction = sr.ReadLine().Split(" "); //split the transaction Log file on spaces
                    if (eachTransaction.Length > 7) // this IF block needed for items w/ two-word names, e.g. Candy Bar.
                    {
                        string newIndex3 = eachTransaction[3] + " " + eachTransaction[4]; // combine the two words

                        foreach (string name in TotalSalesByItemName.Keys) // look through dictionary of item names (keys)
                        {

                            if (newIndex3 == name) // index[3] of split Log file line is product name (key in dictionary)
                            {
                                TotalSalesByItemName[name] += 1; // increment sales quantity counter
                                eachTransaction[6] = eachTransaction[6].Substring(1); // index[5] in array is item price --> removing '$'
                                grossTotalSales += decimal.Parse(eachTransaction[6]); // parse the item price to decimal and add to grand total.
                                break; // names are keys (no duplicates) must break out of loop                                                      
                            }

                        }

                    }
                    else  // ELSE block used for items with one-work names.
                    {
                       foreach (string name in TotalSalesByItemName.Keys) // look through dictionary of item names (keys)
                       {

                            if (eachTransaction[3] == name) // index[3] of split Log file line is product name (key in dictionary)
                            {
                                TotalSalesByItemName[name] += 1; // increment sales quantity counter
                                eachTransaction[5] = eachTransaction[5].Substring(1); // index[5] in array is item price --> removing '$'
                                grossTotalSales += decimal.Parse(eachTransaction[5]); // parse the item price to decimal and add to grand total.
                                break; // names are keys (no duplicates) must break out of loop                           
                            }
                       }
                    }
                }
            }
            string dateAndTime = DateTime.Now.ToString("MMddy-hhmmtt");
            string grossSalesReportFile = $"GrossSalesToDate_{dateAndTime}.txt";
            //string grossSalesReportFile = $"GrossSalesToDate.txt";
            string locationOfSalesReport = Path.Combine(Environment.CurrentDirectory, grossSalesReportFile);

            using (StreamWriter sw = new StreamWriter(locationOfSalesReport, false))
            {
                foreach (KeyValuePair<string, int> keyValuePair in TotalSalesByItemName)
                {
                    sw.WriteLine($"{keyValuePair.Key}|{keyValuePair.Value}"); // writes each item name and qty sold to SalesReport file.
                }
                sw.WriteLine();
                sw.WriteLine($"TOTAL SALES: $ {grossTotalSales}");
            }
        }
    }
}
