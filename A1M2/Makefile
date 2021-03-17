CC = gcc
CFLAGS = -g -DDEBUG 
DEST = compile

HFILES = error.h \
	global.h \
	protos.h \
	symbol-table.h \
	syntax-tree.h \
	quad.h \
	threeac-gen.h \
	mips-gen.h

CFILES = error.c \
	lex.yy.c \
	main.c\
	print.c \
	symbol-table.c\
    syntax-tree.c \
	util.c\
	y.tab.c \
	threeac-gen.c \
	mips-gen.c \
	quad.c

OFILES = error.o \
	lex.yy.o \
	main.o \
	print.o \
	symbol-table.o \
    syntax-tree.o \
	util.o \
	y.tab.o \
	threeac-gen.o \
	mips-gen.o \
	quad.o

.c.o :
	$(CC) $(CFLAGS) -c $<

$(DEST) : $(OFILES)
	$(CC) -o $(DEST) $(OFILES) -ll

error.o : error.h global.h syntax-tree.h error.c y.tab.h

main.o : global.h main.c

symbol-table.o : global.h symbol-table.h symbol-table.c

syntax-tree.o : global.h syntax-tree.h syntax-tree.c

mips-gen.o : mips-gen.c mips-gen.h quad.h

threeac-gen.o : threeac-gen.c threeac-gen.h quad.h

quad.o : quad.c quad.h

util.o : global.h util.h util.c

lex.yy.o : global.h error.h syntax-tree.h symbol-table.h lex.yy.c

y.tab.c : parser.y 
	yacc -d -v parser.y

lex.yy.c : y.tab.h scanner.l 
	flex scanner.l

y.tab.h : parser.y
	yacc -d -v parser.y


clean :
	/bin/rm -f *.o core $(DEST) *.BAK

realclean :
	/bin/rm -f *.o core $(DEST) *.BAK lex.yy.c y.tab.c y.tab.h
