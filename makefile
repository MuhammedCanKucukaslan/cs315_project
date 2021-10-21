DATE = `date +'%y_%m_%d_%H_%M_%S'`

run:  clear main gcc
	./main
gcc:
	gcc lex.yy.c -o main
main: 
	lex main.l
new:
	#cp main.l "main.l.prev"
	cp main.l ./archive/"main_$(DATE).l"
	nano main.l
clear:
	rm -f  main
	rm -f  lex.yy.c

r:
	r="$RANDOM"
	echo r
	
