#include "oxstd.h"

/** A menu object.
**/
struct Menu {
	enum{prompt,call,ItemSize}
	enum{HELP=-2,QUIT=-1,DOALL,CHOICE}
	static const decl sep  = "\n---------------------------\n";
	decl
	/** string: menu name.**/ 				name,
	/** array containing menu.**/			items,
	/** TRUE if top menu.**/				IamMain,
	/** string printed if HELP selected.**/ help_text,
	/** TRUE: create a logfile for this run.**/ logoutput;
	Menu(name="Menu",IamMain=TRUE);
	~Menu();
	make_the_call(item);
	add(...);
	Run(logoutput=TRUE);
	}

