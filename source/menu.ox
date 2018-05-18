#include "menu.h"

/** Create a new menu object.
@param name string, name of menu
@param IamMain TRUE, the highest level menu [default]</br> FALSE, sub menu
@example
	decl m = new Menu("options");

	decl m = new Menu("suboptions",FALSE);

**/
Menu::Menu(name,IamMain) {
	this.name = name;
	items = {};
	add( {"Run All (excluding sub-options)", 0} );
	this.IamMain = IamMain;
	help_text = "This is the default help text.\n";
	}
	

/** Add an item to the menu.
@param ... list of items, each an array of size ItemSize
@example
	m->add( {"Call 1",call1},
			{"Call 2",call2},
			{"Sub ",menu3()}
            );
**/
Menu::add(...) {
	decl newitem, newitems=va_arglist();
	foreach(newitem in newitems) {
		if (!isarray(newitem)||sizeof(newitem)!=ItemSize)
			oxrunerror("menu items have to be an array of size "+sprint(ItemSize));
		if ( !isstring(newitem[prompt]) ) oxrunerror("prompt should be a string");
		if ( sizeof(items) && !isfunction(newitem[call]) && !isclass(newitem[call],"Menu") )
			oxrunerror("call should be a function or should be a Menu object");
		items |= {newitem};
		}
	}

/**
@param item array, menu item
@internal
**/
Menu::make_the_call(item) {
	if (isclass(item[call])) {
		item[call]->Run();
		return;
		}
	if (!isfunction(item[call]))
		return;
	decl flog = logoutput ? fopen(logdir+replace(item[prompt]," ","_")+".txt","l") : 0;
	println("Output of ",name+":"+item[prompt],sep);
	item[call]();
    println("... finished.\n");
	if (isfile(flog)) fclose(flog);
	flog = 0;
	}

/** Run options from command line if any, otherwise go interactive
**/
Menu::CmdLine() {
	decl args = arglist(), nx = 1, cmdln=sizeof(args)>nx, r,i,k;
    if (cmdln) {
	   println("Command Line Options: ",name);
       do {
        sscan(args[nx++],"%t",&k);
        if (isstring(k)){
            foreach (r in items[i]) if (strfind(r[prompt][i],k)>-1) { k=i; break;}
            if (isstring(k)) {
                println("OxMenu Error: menu item not found ",k);
                continue;
                }
            }
        make_the_call(items[k]);
       } while (sizeof(nx<sizeof(args)));
       }
    else Run();
    }

/** Run the menu.
@param logoutput TRUE: create a logfile for this run.
@example

	m->Run();

**/
Menu::Run() {
	decl k, key, it;
	println("Interactive Menu: ",name);
    do {
	   foreach (it in items[k] ) println("[","%02u",k,"] ",it[prompt]);
 	   println("[",HELP,"]  Help on Menu");
       if (IamMain)
 	      println("[",QUIT,"]  QUIT ");
       else {
 	      println("[",-3,"]  Exit Ox\n[",QUIT,"]  go up to previous menu");
          }
 	   scan("? ","%i",&k);
	   switch_single(k) {
            case EXIT : exit(0);
	   		case HELP : println(sep,"Help: \n",help_text,sep);
	   		case QUIT : return;
			case DOALL:
            	foreach(it in items)
					if (isfunction(it[call])) make_the_call(it);
            	scan("Press any key and ENTER to continue\n","%2c",&key);
            default : make_the_call(items[k]);
           			  scan("Press any key and ENTER to continue or return \n","%2c",&key);
           }
    	}   while (TRUE);   //user has to enter -1 to QUIT
	}

Menu::~Menu() {
	decl item;
	foreach (item in items) if (isclass(item[call])) delete item[call];
	}
	
