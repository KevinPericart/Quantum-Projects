namespace FirstappQuantum {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    @EntryPoint()
    operation GenerateRandomBits () : Result {
        using (q = Qubit()) { // Allocation of a qubit
            H(q); // Put qubit into superposition mode
            return MResetZ(q);
        }
    }

    operation SampleRandomNumberInRange (max : Int) : Int{
        mutable output = 0;
        repeat {
            mutable bits = new Result[0];
            for (idxBit in 1..BitSizeI(max)) {
                set bits += [GenerateRandomBit()];
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let max = 50;
        Message($"Generate a random number between 0 and {max}: ");
        return SampleRandomNumberInRange(max);
    }
}