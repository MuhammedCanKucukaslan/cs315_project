DATE = `date +'%y_%m_%d_%H_%M_%S'`

compile: l y gcc
	
run: compile
	./parser
gcc:
	gcc -o parser y.tab.c
lex:
	lex main_lex.l
	gcc lex.yy.c -o lex
	touch main_lex.l
	./lex
l:
	lex main.l
	touch main.l
y:
	yacc main.y
new:
	#cp main.l "main.l.prev"
	cp main.l ./archive/"main_$(DATE).l"
	nano main.l
clear:
	rm -f  parser
	rm -f  lex.yy.c
	touch parser.l

v: compile
	cat valid | ./parser
i: compile
	cat invalid | ./parser
d:
	yacc -v main.y
