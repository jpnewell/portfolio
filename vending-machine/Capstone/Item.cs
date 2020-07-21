using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;

namespace Capstone
{
    public class Item
    {
        public Item(string itemInfo)
        {
            SetupItemInfo(itemInfo);
            Quantity = "Quant: 5";
        }
        
       
        public string SlotLocation { get; private set; }
        public string Name { get; private set; }
        public decimal Price { get; private set; }
        public string Type { get; private set; }
        public string Quantity { get; private set; }  //setting type to string so that Quantity == 0 --> string "SOLD OUT"

        public void SetupItemInfo(string itemInfo)
        {
            string[] dataArray = itemInfo.Split("|");
            SlotLocation = dataArray[0];
            Name = dataArray[1];
            Price = decimal.Parse(dataArray[2]);
            Type = dataArray[3];
        }

        public void DecrementItemQuantity()
        {   
            try
            {
                int quantityAsInt = int.Parse(Quantity.Substring(7));
                if (quantityAsInt > 0) 
                {
                    quantityAsInt--;
                    Quantity = "Quant: " + quantityAsInt.ToString();
                }
            }
            catch
            {
                Console.WriteLine("Item is sold out!"); //Error message
                
            }
            finally
            {
                if (Quantity.Contains("0"))
                {
                    Quantity = "SOLD OUT";
                }
            }
        }
    }
}

