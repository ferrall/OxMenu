include Makefile.inc

INC := .\include
DOC := ./docs

vpath %.ox source
vpath %.h $(INC)
vpath %.oxo $(INC)
vpath %.ox.html $(DOC)

menu.oxo  : $(oxobjects)

%.oxo : %.ox %.h
	$(OX) $(OXFLAGS) -i$(INC) -d -c $<
	$(COPY) $@ $(INC)
	$(ERASE) $@
	$(COPY) $(INC)\menu.* $(niq)

.PHONY : document
document:
	$(ERASE) $(DOC)\default.html
	$(OXDOC) -include $(INC) menu.ox

