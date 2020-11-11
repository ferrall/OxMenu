/** Example of a menu of functions and other menus chosen interactively.

**/
#import "menu"

decl param;

useparam() { 	println("Using parameter. param = ",param); }

call1() { param = 99; useparam(); }

call2() {	println("Call 2. Do whatever"); }

call1a() {  param = 55; useparam(); }

/**This creates and returns a submenu.
It can be called when setting up another menu.
Note, this is different than sending the function itself.  See below.
**/
menu3() {
	decl sub = new CallMenu("binomial",FALSE,TRUE);
	sub->add(
		{"Sub1A ",call1a},
		{"Sub2 ",call2}
		);
	return sub;
	}
	
main() {
	decl m = new CallMenu("test",TRUE,TRUE);
    param = 23;
	m->add( {"Call 1",call1},   // will call a static function that takes no arguments
			{"Call 2",call2},   // another option.
			{"Sub ",menu3()}   //returns a sub-menu ... this could included from a another file or folder.
            );
	m->Run();
	delete m;
    }
