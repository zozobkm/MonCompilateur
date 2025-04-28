all:	test
clean:
		rm *.o *.s
		rm tokeniser.cpp
tokeniser.cpp:	tokeniser.l
		flex++ -d -otokeniser.cpp tokeniser.l
tokeniser.o:	tokeniser.cpp
		g++ -c tokeniser.cpp
compilateur:	compilateur.cpp tokeniser.o
		g++ -o compilateur compilateur.cpp tokeniser.o
test:		compilateur test.p
		./compilateur <test.p >test.s
		gcc -ggdb -no-pie -fno-pie test.s -o test


