using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading;

namespace Capstone
{
    public class VendingMachine 
    {
        
        public VendingMachine()
        {
            StockedItems = InitializeInventory();
            ItemBySlotLocation = CreateDictionary(StockedItems);
        }
        public List<string> StockedItems { get; }
        public Dictionary<string, Item> ItemBySlotLocation { get; } // Master dictionary of all items in vending machine 
        public static decimal CurrentMoney { get; set; }

        static List<string> InitializeInventory()
        {
            string itemsFile = "vendingmachine.csv";
            string IventoryOfItems = Path.Combine(Environment.CurrentDirectory, itemsFile);
            List<string> initialItemInfoList = new List<string>();
            using (StreamReader sr = new StreamReader(IventoryOfItems))
            {
                while (!sr.EndOfStream)
                {
                    initialItemInfoList.Add(sr.ReadLine());
                }
            }
       
            return initialItemInfoList;
        }

        public Dictionary<string, Item> CreateDictionary(List<string> stockedItems)
        {
            Dictionary<string, Item> itemBySlotLocation = new Dictionary<string, Item>();
            for (int i = 0; i < stockedItems.Count; i++)
            {
                Item item = new Item(stockedItems.ElementAt(i));
                itemBySlotLocation.Add(item.SlotLocation, item);
            }
            return itemBySlotLocation; // Master dictionary of all items in vending machine 
        }

        public void MainMenu() 
        {

            DisplayVendingMachine();

            bool validInput = false;
            int usersMenuInput = 0;
            Console.WriteLine();
            Console.WriteLine("Welcome to Vendo-Matic 800 by Umbrella Corp.\n\n");


            while (!validInput)
            {
                Console.Write("***** Main Menu *****");
                Console.WriteLine();
                Console.WriteLine(" (1) Display Vending Machine Items \n (2) Feed Money/Make Purchase \n (3) Exit ");
                try
                {
                    usersMenuInput = int.Parse(Console.ReadLine());
                }
                catch
                {
                    //Console.Clear();
                    Console.WriteLine("***     INTEGERS ONLY PLEASE    ***");
                }

                validInput = (usersMenuInput == 1 || usersMenuInput == 2 || usersMenuInput == 3 || usersMenuInput == 4);
                if (!validInput)
                {
                    // Console.Clear();
                    Console.WriteLine("*** Please select a valid option ***\n");
                }
            }

            if (usersMenuInput == 1)
            {
                Console.Clear();
                //DisplayItems(ItemBySlotLocation);
                DisplayVendingWindow();
                Console.WriteLine();
                Console.WriteLine("Press ENTER key to continue");
                Console.ReadLine();
                //Console.ReadKey(); //this may be the culprit of the crashing from terminal. 
                Console.Clear();
                MainMenu();

            }
            else if (usersMenuInput == 2)
            {
                Console.Clear();
                PurchaseMenu();
            }
            else if (usersMenuInput == 3)
            {
                Console.Beep(392, 250);
                Console.Beep(330, 200);
                Console.Beep(262, 150);

                Environment.Exit(0);
            }
            else if (usersMenuInput == 4)
            {
                SalesReport salesReport = new SalesReport(ItemBySlotLocation);
                Console.WriteLine("Sales Report Created.");
                Console.ReadLine();
                MainMenu();
            }
        }

        //public void PrintProduct(string key) A feature that would print each item bought. Too much time to fully implement. 
        //{
        //    Dictionary<string, string> displayItemDictionary = new Dictionary<string, string>();
            
        //       displayItemDictionary.Add( "A1",  "/------\\\n" +
        //                                         "|()  ()|\n" +
        //                                         "|POTATO|\n" +
        //                                         "|CRISPS|\n" +
        //                                         "|()  ()|\n" +
        //                                         "|      |\n" +
        //                                         "\\------/\n");
        //    Console.WriteLine(displayItemDictionary[key]);
        //}

        public void PurchaseMenu()
        {
            Console.WriteLine("***** Purchase Menu *****");
            bool validInput = false;
            int usersPurchaseMenuInput = 0;

            while (!validInput)
            {
                Console.WriteLine(" (1) Feed Money \n (2) Select Product \n (3) Finish Transaction ");
                Console.WriteLine();
                Console.WriteLine($"Current Money Provided: $ {CurrentMoney}\n");
                Console.Write("Select Option: ");

                try
                {
                    usersPurchaseMenuInput = int.Parse(Console.ReadLine());
                }
                catch
                {
                    //Console.Clear();
                    Console.WriteLine("Please input a whole number as listed.");

                }
                validInput = (usersPurchaseMenuInput == 1 || usersPurchaseMenuInput == 2 || usersPurchaseMenuInput == 3);
                if (!validInput)
                {
                    //Console.Clear();
                    Console.WriteLine("Please select a valid option.");
                }
            }
            if (usersPurchaseMenuInput == 1)
            {
                //Console.Clear();
                decimal userInputAmount = 0;
                while (userInputAmount != 1 && userInputAmount != 5 && userInputAmount != 10)
                {
                    //Console.Clear();
                    Console.WriteLine();
                    Console.WriteLine("The Vendo-Matic 800 accepts only U.S. $1, $5 or $10 bills.\n");
                    Console.WriteLine($"Please insert/deposit by entering amount below. \tCurrent Balance: $ {CurrentMoney}");

                    try
                    {
                        userInputAmount = decimal.Parse(Console.ReadLine());
                    }
                    catch
                    {
                        Console.WriteLine("Please only insert U.S. $1, $5 or $10 bills.");
                        Console.ReadLine();
                    }
                }

                userInputAmount *= 1.00M;
                userInputAmount = Math.Round(userInputAmount, 2);
                Transaction transaction = new Transaction(CurrentMoney);
                CurrentMoney = transaction.Deposit(userInputAmount);

                Console.Clear();
                PurchaseMenu();
            }
            else if (usersPurchaseMenuInput == 2)
            {
                bool validKey = false;

                while (!validKey)
                {
                    Console.Clear();
                    DisplayVendingWindow();
                    //DisplayItems(ItemBySlotLocation); 
                    Console.WriteLine();
                    Console.WriteLine($"Current Money Provided: $ {CurrentMoney}");
                    Console.WriteLine("Enter item code to purchase item.");
                    string enteredCode = Console.ReadLine().ToUpper();

                    validKey = ItemBySlotLocation.ContainsKey(enteredCode);

                    //Console.Clear();

                    if (validKey)
                    {
                        Console.Clear();

                        Transaction transaction = new Transaction(CurrentMoney);
                        CurrentMoney = transaction.Purchase(ItemBySlotLocation[enteredCode]);
                        //PrintProduct(enteredCode);
                    }

                }
                Console.WriteLine("Press ENTER key to continue");
                Console.ReadLine();
                
                PurchaseMenu();
            }
            else if (usersPurchaseMenuInput == 3)
            {

                Transaction transaction = new Transaction(CurrentMoney);
                CurrentMoney = transaction.CashOut();
                Console.WriteLine();
                Console.Clear();
                MainMenu();
            }
        }

        public void DisplayItems(Dictionary<string, Item> items) // Essentially legacy now that we use the method below
        {
            foreach (Item item in items.Values)
            {
                Console.Write($"{item.SlotLocation} {item.Name} {item.Price} {item.Type} ({item.Quantity})");

                Console.WriteLine();
            }
        }

        

        public void DisplayVendingMachine()
        {
            Console.Write(@"
            ▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌
            ▐│  VENDO-MATIC 800     │▌
            ▐│ +───────────────+    │▌
            ▐│ |/\ ++ +-+ ++-+ |    │▌
            ▐│ |() || | | ++-+ |$== │▌
            ▐│ |@/ +@ +-@ ++-@ |c = │▌
            ▐│ |───────────────|    │▌
            ▐│ |/\ ++ +-+ +--+ |┌──┐│▌
            ▐│ |@/ +@ +-@ +--@ ||$_|│▌
            ▐│ |───────────────|└──┘│▌
            ▐│ |/\ /-\ /\ /--\ |┌──┐│▌
            ▐│ |@/ \@/ \@ \--@ ||::|│▌
            ▐│ |───────────────||::|│▌
            ▐│ |++ ++  ++   ++ |└──┘│▌
            ▐│ |@+ +@  +@   +@ |    │▌
            ▐│ +───────────────+    │▌
            ▐│  ╔═════════════╗ ####│▌
            ▐│  ║             ║ ####│▌
            ▐│  ╚═════════════╝     │▌
            ▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌");
        }

        public void DisplayVendingWindow()
        {
            Dictionary<string, Item> i = ItemBySlotLocation; // easier to just type i rather than ItemBySlotLocation
          
            /*This could potentially be written better. Perhaps in a loop that prints out each line? Make each part modular and have it print out? 
            Due to time constraints, however, I was unable to optimize and instead just got it 
            working. 
             */
            Console.Write($@" 
┌──────────────────────────────────────────────┐
|/──────\   +───+    +──────+   /────────────\ | CHIPS              LIST VIEW 
||()  ()|   |S -|    |GRAIN |   | ~ CLOUD ~  | |        | {i["A1"].SlotLocation} {i["A1"].Name} {i["A1"].Price} {i["A1"].Type} ({i["A1"].Quantity})
||POTATO|   |T -|    |WAVES |   |   P*O*P    | |        | {i["A2"].SlotLocation} {i["A2"].Name} {i["A2"].Price} {i["A2"].Type} ({i["A2"].Quantity})
||CRISPS|   |A -|    |      |   |  C O R N   | |        | {i["A3"].SlotLocation} {i["A3"].Name} {i["A3"].Price} {i["A3"].Type} ({i["A3"].Quantity})
||()  ()|   |C -|    | |||| |   | __________ | |        | {i["A4"].SlotLocation} {i["A4"].Name} {i["A4"].Price} {i["A4"].Type} ({i["A4"].Quantity})
||      |   |K -|    |      |   |            | |        
|\──────/   +───+    +──────+   \────────────/ |        
|${i["A1"].Price}      ${i["A2"].Price}      ${i["A3"].Price}         ${i["A4"].Price}     |
|{i["A1"].Quantity}   {i["A2"].Quantity}   {i["A3"].Quantity}      {i["A4"].Quantity}  |
|─A1─────────A2─────────A3────────────A4───────|
|                                              | CANDY  
|/────\    +─────+    +───────+     /──────\   |        | {i["B1"].SlotLocation} {i["B1"].Name} {i["B1"].Price} {i["B1"].Type} ({i["B1"].Quantity})
||MOON|    | COW |\   |~WONKA~|     |*CRUN*|   |        | {i["B2"].SlotLocation} {i["B2"].Name} {i["B2"].Price} {i["B2"].Type} ({i["B2"].Quantity})
||PIE |    |TALES|\\  |* BAR *|     |*CHIE*|   |        | {i["B3"].SlotLocation} {i["B3"].Name} {i["B3"].Price} {i["B3"].Type} ({i["B3"].Quantity})
|\────/    +─────+    +───────+     \──────/   |        | {i["B4"].SlotLocation} {i["B4"].Name} {i["B4"].Price} {i["B4"].Type} ({i["B4"].Quantity})
|${i["B1"].Price}      ${i["B2"].Price}      ${i["B3"].Price}         ${i["B4"].Price}     |         
|{i["B1"].Quantity}   {i["B2"].Quantity}   {i["B3"].Quantity}      {i["B4"].Quantity}  |
|─B1─────────B2─────────B3────────────B4───────|
|/──\                 /────────\               | DRINKS
||CO|    /────────\   |MOUNTAIN|   /───────\   |        | {i["C1"].SlotLocation} {i["C1"].Name} {i["C1"].Price} {i["C1"].Type} ({i["C1"].Quantity})
||LA|    |DR. SALT|   | MELTER |   ( HEAVY )   |        | {i["C2"].SlotLocation} {i["C2"].Name} {i["C2"].Price} {i["C2"].Type} ({i["C2"].Quantity})
|\──/    \────────/   \────────/   \───────/   |        | {i["C3"].SlotLocation} {i["C3"].Name} {i["C3"].Price} {i["C3"].Type} ({i["C3"].Quantity})
|${i["C1"].Price}      ${i["C2"].Price}      ${i["C3"].Price}         ${i["C4"].Price}     |        | {i["C4"].SlotLocation} {i["C4"].Name} {i["C4"].Price} {i["C4"].Type} ({i["C4"].Quantity})
|{i["C1"].Quantity}   {i["C2"].Quantity}   {i["C3"].Quantity}      {i["C4"].Quantity}  |         
|─C1─────────C2─────────C3────────────C4───────|
|+──────+  +────────+   +────+    +──+──+──+   | GUM
||U CHEW|  |!LITTLE!|   |CHIC|    |TR|IP|LE|   |        | {i["D1"].SlotLocation} {i["D1"].Name} {i["D1"].Price} {i["D1"].Type} ({i["D1"].Quantity})
|+─|  |─+  |!LEAGUE!|   |LETS|    |*M|IN|T*|   |        | {i["D2"].SlotLocation} {i["D2"].Name} {i["D2"].Price} {i["D2"].Type} ({i["D2"].Quantity})
|   ──     +──CHEW──+   +────+    +──+──+──+   |        | {i["D3"].SlotLocation} {i["D3"].Name} {i["D3"].Price} {i["D3"].Type} ({i["D3"].Quantity})
|${i["D1"].Price}      ${i["D2"].Price}      ${i["D3"].Price}         ${i["D4"].Price}     |        | {i["D4"].SlotLocation} {i["D4"].Name} {i["D4"].Price} {i["D4"].Type} ({i["D4"].Quantity})
|{i["D1"].Quantity}   {i["D2"].Quantity}   {i["D3"].Quantity}      {i["D4"].Quantity}  |         
└─D1─────────D2─────────D3────────────D4───────┘");
        }
        
    }

    /*     ▐▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▌
           ▐│   Vendo-Matic 800     │▌
           ▐│  ┌───────────────┐    │▌ My original ASCII that DOES NOT display correctly when running from bash. Now I know it wont really matter 
           ▐│  │┌┐ └└┘  ┌┐  ╔╗ │    │▌ so this could have been used. 
           ▐│  │││ │ │  │║  ║║ │    │▌
           ▐│  │@┘ └@┘  └@  ╚@ │$╪╪ │▌
           ▐│  ├───────────────┤ ¢╫ │▌
           ▐│  │MM │┌┐  ┌─┐ ┌└┐│    │▌
           ▐│  │@M └@┘  └@┘ └@┘│ ██ │▌
           ▐│  ├───────────────┤ ██ │▌
           ▐│  │┌┐ └─┘   ┌┐  │││┌──┐│▌
           ▐│  │@┘ └@┘   @┘  @┘││::││▌
           ▐│  ├───────────────┤│::││▌
           ▐│  │        ╔╗     │└──┘│▌
           ▐│  │╔╗ ╔═╗  ║║  ╔═╗│    │▌
           ▐│  │@╝ ╚@╝  ╚@  ╚@╝│    │▌
           ▐│  └───────────────┘    │▌
           ▐│   ╔═════════════╗ ▒▒▒▒│▌
           ▐│   ║             ║ ▒▒▒▒│▌
           ▐│   ╚═════════════╝ ▒▒▒▒│▌
           ▐▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▌ 
           
     
         ┌────────────────────────────────┐    
         │         ┌──┐                   │                 
         │┌──┐     ││││     ┌──┐      +══╗│ {i["A1"].SlotLocation} {i["A1"].Name} {i["A1"].Price} {i["A1"].Type} ({i["A1"].Quantity})                
         │││││     ││││     │--|      ║  ║│ {i["A2"].SlotLocation} {i["A2"].Name} {i["A2"].Price} {i["A2"].Type} ({i["A2"].Quantity})                
         │││││     ││││     │--|      ║││║│ {i["A3"].SlotLocation} {i["A3"].Name} {i["A3"].Price} {i["A3"].Type} ({i["A3"].Quantity})                
         │@@││     │@@│     │@@│      ║@@║│ {i["A4"].SlotLocation} {i["A4"].Name} {i["A4"].Price} {i["A4"].Type} ({i["A4"].Quantity})                
         │@@─┘     └@@┘     └@@┘      ╚@@╝│                 
         │{i["A1"].Price}     {i["A2"].Price}     {i["A3"].Price}      {i["A4"].Price}│                 
         ├A1────────A2───────A3────────A4─┤                                 
         │╔═╗      └──┘                 │ │ {i["B1"].SlotLocation} {i["B1"].Name} {i["B1"].Price} {i["B1"].Type} ({i["B1"].Quantity})               
         │║═║      ┌─└┐     ┌──┐      ┌─└┐│ {i["B2"].SlotLocation} {i["B2"].Name} {i["B2"].Price} {i["B2"].Type} ({i["B2"].Quantity})               
         │@@╝      │@@│     │@@│      │@@││ {i["B3"].SlotLocation} {i["B3"].Name} {i["B3"].Price} {i["B3"].Type} ({i["B3"].Quantity})                
         │@@       └@@┘     └@@┘      └@@┘│ {i["B4"].SlotLocation} {i["B4"].Name} {i["B4"].Price} {i["B4"].Type} ({i["B4"].Quantity})                
         │{i["B1"].Price}     {i["B2"].Price}     {i["B3"].Price}      {i["B4"].Price}│                 
         ├B1────────B2───────B3────────B4─┤                                              
         │┌_┐               ┌  ┐      │ │ │ {i["C1"].SlotLocation} {i["C1"].Name} {i["C1"].Price} {i["C1"].Type} ({i["C1"].Quantity})                
         │@@|     ┌-@@┐     |@@|      |@@ │ {i["C2"].SlotLocation} {i["C2"].Name} {i["C2"].Price} {i["C2"].Type} ({i["C2"].Quantity})                
         │@@|     └-@@┘     |@@|      |@@ │ {i["C3"].SlotLocation} {i["C3"].Name} {i["C3"].Price} {i["C3"].Type} ({i["C3"].Quantity})                
         │{i["C1"].Price}     {i["C2"].Price}     {i["C3"].Price}      {i["C4"].Price}│ {i["C4"].SlotLocation} {i["C4"].Name} {i["C4"].Price} {i["C4"].Type} ({i["C4"].Quantity})                
         ├C1────────C2───────C3────────C4─┤                              
         │╔╗                 ║║           │ {i["D1"].SlotLocation} {i["D1"].Name} {i["D1"].Price} {i["D1"].Type} ({i["D1"].Quantity})                
         │║║       ╔══╗      ║║       ╔══╗│ {i["D2"].SlotLocation} {i["D2"].Name} {i["D2"].Price} {i["D2"].Type} ({i["D2"].Quantity})                
         │@@       ║@@║      @@       ║@@║│ {i["D3"].SlotLocation} {i["D3"].Name} {i["D3"].Price} {i["D3"].Type} ({i["D3"].Quantity})                
         │@@       ╚@@╝      @@       ╚@@╝│ {i["D4"].SlotLocation} {i["D4"].Name} {i["D4"].Price} {i["D4"].Type} ({i["D4"].Quantity})               
         │{i["D1"].Price}     {i["D2"].Price}     {i["D3"].Price}      {i["D4"].Price}│                 
         ├D1────────D2───────D3────────D4─┤                                               
         └────────────────────────────────┘
     */






}
