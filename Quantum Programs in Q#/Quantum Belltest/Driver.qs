using Microsoft.Quantum.Simultion.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.BellTest {
    class Driver {
        static void Main(string[] args) {
            using (var sim = new QuantumSimulator()) {
                Result[] initials = new Result[] { Result.Zero, Result.One };
                foreach (Result initial in initials) {
                    var res = BellTesting.Run(sim, 1000, initial).Result;
                    var (numZeros, numOnes) = res;
                    System.Console.WriteLine(
                        $"Init:{initial,-4} 0s={numZeros,-4} 1s{numOnes,-4}");                    )
                }
            }
            System.Console.WriteLine("Press any key to continue...");
            System.Console.ReadKey();
        }
    }
}