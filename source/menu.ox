#include "menu.h"

/** Create a new menu object.
@param name string, name of menu
@param keeplog FALSE[default] do not open a log file for each call </br>TRUE open a log file
**/
Menu::Menu(name,keeplog) {
	this.name = name;
	items = {};
    this.keeplog = keeplog;
    SetLogDir();
	}

/** Set the static folder to place logs of calls for all menus.
@param folder string, a path.  Default is "./"
**/
Menu::SetLogDir(folder) {
    logdir = folder;
    }

/** Create a new CallMenu object.
@param name string, name of menu
@param keeplog FALSE[default] do not open a log file for each call </br>TRUE open a log file
@param IamMain TRUE, the highest level menu [default]</br> FALSE, sub menu
@example
	decl m = new CallMenu("options");

	decl m = new CallMenu("suboptions",FALSE);

**/
CallMenu::CallMenu(name,keeplog,IamMain) {
	Menu(name,keeplog);
	add( {"Run All (excluding sub-options)", 0} );
	this.IamMain = IamMain;
	help_text = "This is the default help text.\n";
	}
	

/** Add an item to the Callmenu.
@param ... list of items, each an array of size `ItemSize`

The first element of an item is a prompt string.  The second is either a static function of the form
<code>func()</code>.  Or, it is another menu object that is a submenu.  One way to organize submenus is
to write a function that creates and returns the submenu object then call it and return its value as the
call item as shown below.

@example
	m->add( {"Call 1",call1},
			{"Call 2",call2},
			{"Sub ",menu3()}
            );
</dd>
**/
CallMenu::add(...) {
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

/** Call the function or enter the submenu selected.
@param item  menu item

**/
CallMenu::make_the_call(item) {
	if (isclass(item[call])) {
		item[call]->Run();
		return;
		}
	if (!isfunction(item[call]))
		return;
    if (keeplog) {
	   fopen(logdir+replace(item[prompt]," ","_")+".txt","l");
	   println("Output of ",name+":"+item[prompt],sep);
       }
	item[call]();
    if (keeplog) {
        println("... finished.\n");
        fclose("l");
        }
	}

/** Find the menu item corresponding to the token.
@param token a string prompt or an integer index
@param items a list of menu items.
@return integer index into the list
**/
Menu::itemparse(token,items) {
    decl r,i;
    if (isstring(token)){
        foreach (r in items[i]) if (strfind(r[prompt][i],token)>-1) { token=i; break;}
        if (isstring(token)) {
            oxwarning("OxMenu Error: menu item not found "+token);
            continue;
            }
            }
    else if (token>=sizeof(items))
        oxwarning("OxMenu Error: index too large"+sprint(token));
    return token;
    }

/** Run options from command line if any, otherwise go interactive.
@param arg integer [default=1] the first command line argument to treat as a menu option.  This
    means non-OxMenu options must appear first on the command line.<br/>
     an array of options to execute as if entered from the keyboard.

If the array is empty or if the arglist is shorter than the initial value the menu enters
interactive mode by calling Run().  Thus, using <code>CmdLine</code> does not require
command line options.

<DD>The form of an options is either an integer corresponding to the indices of the menu item or
the corresponding prompt as a string.  If the item is a submenu then the next token in the arglist or
array is the item to select from the submenu.  Once a function is run (including
<dd><pre>
  oxl main opt1 [sub1 ...] opt

  menu->CmdLine
</pre></dd>

**/
CallMenu::CmdLine(args) {
    decl nx=0, k, curitem, it;
    if (isint(args)) {
        nx = args;
        args = arglist();
        }
    if (sizeof(args)>nx) {
	   println("Command Line Options: ",name);
       do {   //restart at the top level menu
        curitem = items;
        sscan(args[nx++],"%t",&k);
        k = itemparse(k,curitem);
        if (k==DOALL) {
			foreach(it in curitem) if (isfunction(it[call])) make_the_call(it);
            continue;
            }
        curitem = items[k];
        while (isclass(curitem[call])) {  //submenu selected
            sscan(args[nx++],"%t",&k);
            k = itemparse(k,curitem);
            curitem = curitem[call].items[k];
            }
        make_the_call(curitem[k]);
       } while (nx<sizeof(args));
       }
    else Run();
    }

/** Run the menu.
@param logoutput TRUE: create a logfile for this run.
@example

	m->Run();

**/
CallMenu::Run() {
	decl k, key, it;
	println("Interactive Menu: ",name);
    do {
	   foreach (it in items[k] ) println("[","%02u",k,"] ",it[prompt]);
 	   println("[",HELP,"]  Help on Menu");
       if (IamMain)
 	      println("[",QUIT,"]  QUIT ");
       else {
 	      println("[",EXIT,"]  Exit Ox\n[",QUIT,"]  go up to previous menu");
          }
 	   scan("? ","%i",&k);
       if (k<sizeof(items)) {
	       switch_single(k) {
                case EXIT : exit(0);
	   		    case HELP : println(sep,"Help: \n",help_text,sep);
	   		    case QUIT : return;
			    case DOALL: foreach(it in items)
					               if (isfunction(it[call])) make_the_call(it);
            	             scan("Press any key and ENTER to continue\n","%2c",&key);
                default : make_the_call(items[k]);
           			      scan("Press any key and ENTER to continue or return \n","%2c",&key);
           } }
        else println("\nERROR: ",k," is too large. Enter a number less than ",sizeof(items),"\n");
    	}   while (TRUE);   //user has to enter -1 to QUIT
	}

Menu::~Menu() {
	decl item;
	foreach (item in items) if (isclass(item[call])) delete item[call];
	}
	
ParamMenu::ParamMenu(name,keeplog){
    Menu(name,keeplog);
    }

/** Set Parameters.
@param logoutput TRUE: create a logfile for this run.
@example

	m->SetPars();

**/
ParamMenu::SetPars(TargFunc) {
	decl k, key, n, it, ncall=0;
	println("Set Parameters for ",name);
    n = sizeof(items);
    pars = new array[n];
    foreach(it in items[k]) pars[k] = it[Value];
    do {
	   foreach (it in items[k] ) println("[","%02u",k,"] ",it[prompt]," Current Value: ",pars[k]," ");
 	   println("[",EXIT,"]  Exit Ox\n[",RESET,"] Reset to default list\n[",SEND,"] ",
            isfunction(TargFunc) ? " Send current parameters to target" : " Return current parameters");
 	   scan("? ","%i",&k);
       if (k<sizeof(items)) {
	       switch_single(k) {
                case EXIT : exit(0);
	   		    case SEND : if (!isfunction(TargFunc))    return pars;
                            ++ncall;
                            if (keeplog) {
	                                fopen(logdir+replace(name," ","_")+"_Call_"+sprint(ncall)+".txt","l");
	                               println("Output of ",name,"with parameters ",pars,sep);
                                   }
                            TargFunc(pars);
                            if (keeplog) {println("... finished.\n"); fclose("l");}
                            println("Enter ",EXIT," to exit or ",SEND," to continue.");
                            scan("? ","%i",&key);
                    default : {
                        if (isint(pars[k])) scan("? ","%d",&key);
                        else if (isdouble(pars[k])) scan("? ","%g",&key);
                        else if (ismatrix(pars[k])) scan("?","%#M",rows(pars[k]),columns(pars[k]),&key);
                        pars[k] = key;
                        }
           }
           }
        else println("\nERROR: ",k," is too large. Enter a number less than ",sizeof(items),"\n");
    	}   while (key!=EXIT);
	}

/** Set parameter values from the command line.
index=val
index is an integer index
= is the symbol "="
val is either an integer or double or a string containing numbers to be read in to a
**/
ParamMenu::CmdLine(TargFunc,args) {
	decl nx=0, k, curitem,eq,val,mat, pars, it;
    if (isint(args)) {
        nx = args;
        args = arglist();
        }
    pars = new array[sizeof(items)];
    foreach(it in items[k]) pars[k] = it[Value];
    while (nx<sizeof(args)) {
        sscan(args[nx++],"%t",&k,"%t",&eq,"%t",&val);
        if (ismatrix(pars[k])) {
            sscan(val,"%#M",rows(pars[k]),columns(pars[k]),&mat);
            val = mat;
            }
        pars[k] = val;
        }
     if (isfunction(TargFunc)) TargFunc(pars);
     return pars;
    }


/** add parameters to the list.
@param ... list of parameters each an array of size `ItemSize`

The first element of an item is a prompt string.  The second is the default value of the parameter,
which can be an integer, double or matrix.  The dimensions of the matrix determines the shape to
be read in (dimensions are fixed).

@example
	m->add( {"sigma",0.5},
			{"Index",3},
			{"Values",<0;2;3>}
            );
</dd>

**/
ParamMenu::add(...) {
	decl newitem, newitems=va_arglist();
	foreach(newitem in newitems) {
		if (!isarray(newitem)||sizeof(newitem)!=ItemSize)
			oxrunerror("param items have to be an array of size "+sprint(ItemSize));
		if ( !isstring(newitem[prompt]) ) oxrunerror("prompt should be a string");
		items |= {newitem};
		}
	}
