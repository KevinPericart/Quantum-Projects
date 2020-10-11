using System;
using System.Numerics;
using System.Threading.Tasks;
using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

// When choosing a 12-character password made up of upper case, lower case, 10 numbers and the 10 special symbols & é § ? ç ù oe / + =, there are 72 possibilities for each of the 10 characters of the word, the space for the possibilities is then 7212 in size, i.e. : 19 * 10^21 

namespace Quantum.RandomNumber.ConsoleApp {
    class Program {
        static void Main(string[] args) {
            var result = ExecuteQuantumRandom().GetAwaiter().GetResult();
            Console.Write("The password combination {0} has been selected", result);
        }
		private static async Task<BigInteger> ExecuteQuantumRandom() {
            using var sim = new QuantumSimulator();
            var numberofpasswordcombination = BigInteger.Pow(10, 21);
            return await Quantum.RandomNumber.Generate.Run(sim, numberofpasswordcombination);
        }
    }
}
