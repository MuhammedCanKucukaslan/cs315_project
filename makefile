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
	lex CS315f21_team40.lex
	touch CS315f21_team40.lex
y:
	yacc CS315f21_team40.yacc
archive:
	#cp main.l "main.l.prev"
	cp CS315f21_team40.lex ./archive/"CS315f21_team40_$(DATE).lex"
	cp CS315f21_team40.yacc ./archive/"CS315f21_team40_$(DATE).yacc"

clear:
	rm -f  parser
	rm -f  lex.yy.c
	rm -f y.tab.c
	touch CS315f21_team40.lex

test: compile
	cat CS315f21_team40.txt | ./parser
v: compile
	cat CS315f21_team40.txt | ./parser
i: compile
	cat invalid | ./parser
d:
	yacc -v CS315f21_team40.yacc
