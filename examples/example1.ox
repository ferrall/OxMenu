#import "menu"

call1() {
	println("Call 1");
	return;
	}
call2() {
	println("Call 2");
	return;
	}
menu3() {
	decl m = new Menu("binomial",FALSE);
	m->add(
		{"Sub1 ",call1},
		{"Sub2 ",call2}
		);
	return m;
	}
	
main() {
	decl m = new Menu("test");
	m->add( {"Call 1",call1},
			{"Call 2",call2},
			{"Sub ",menu3()}
            );
	m->Run();
	delete m;
    }
