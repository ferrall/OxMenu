/** Example of interactive setting of parameters.

**/
#import "menu"

enum{A,B,NAgents}
enum{Beer,Pizza,NGoods}
enum{Sigma,Endwoment,Prices,Nparams}

/** function that takes an array of parameter values .**/
economy(par) {
    println("parameters: ",par);
    }

main() {
	decl m = new ParamMenu("test");
	m->add( {"CES param",-1.2},
			{"Endowment",<3,2;2,3>},
			{"Prices ",<1.0;1.0>}
            );
	m->SetPars(economy);
	delete m;
    }
