namespace Quantum.QSharpApplication {

    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert as Convert;

    
    //@EntryPoint()
    //operation HelloQ () : Unit {
        //mutable x = Zero;
        //mutable number = 0;
        //for(i in 1..10){
            //for(j in 1..10){
                //set x = RandomNumberGenerator();
                //if(x == One){
                    //set number = number + 1;
                //}
            //}
        
            //Message(Convert.IntAsString(number));
	    //}
    //}

    //operation RandomNumberGenerator() : Result{
        //using(q = Qubit()){
            //H(q);
            //return MResetZ(q);
		//}
    //}

    @EntryPoint()
    operation GiveNum(input: Int): Unit{
        mutable x = Zero;
        mutable res = Zero;
        if(input == 0){
            set x = Zero;
        }
        elif( input == 1){
            set x = One;
        }
        else{
            Message("No correct input given.");
        }
        set res = HeadOrTail(x);
        if(res == Zero){
            Message("It's a tail");
        }
        elif(res == One){
            Message("It's a head.");
        }
    }

    operation HeadOrTail(input: Result):Result{
        using(q = Qubit()){
            mutable mv = Zero;
            H(q);
            set mv = M(q);
            Message(Convert.BoolAsString(Convert.ResultAsBool(mv)));
            if(mv == input){
                X(q);
                set mv = M(q);
                Message(Convert.BoolAsString(Convert.ResultAsBool(mv)));

            }
            Reset(q);
            return mv;
        }
    }
}
