DATE = `date +'%y_%m_%d_%H_%M_%S'`


compile: l y gcc
	
run:
	./main
gcc:
	gcc -o main y.tab.c
lex:
	lex main_lex.l
	gcc lex.yy.c -o lex
	touch main_lex_l
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
	rm -f  main
	rm -f  lex.yy.c
	touch main.l

v:
	cat valid | ./main
i:
	cat invalid | ./main
