using System;
using System.Security.Cryptography.X509Certificates;
using System.Collections.Generic;
using System.IO;
using System.Runtime.CompilerServices;
using System.Threading;

namespace Capstone
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.SetWindowSize(110, 40);
            VendingMachine vendingMachine = new VendingMachine();

            Console.Beep(262, 500);
            Console.Beep(330, 500); 
            Console.Beep(392, 500);

            vendingMachine.MainMenu();


        }
    }
}
