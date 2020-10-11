namespace FirstappQuantum {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;

    
    @EntryPoint()
    operation GenerateRandomBit () : Result {
        using (q = Qubit()) { // Allocation of a qubit
            H(q); // Put qubit into superposition mode
            return MResetZ(q);
        }
    }
}
