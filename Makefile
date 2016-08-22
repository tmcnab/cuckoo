all: build test

build:
	@echo "Building"
	@rm -f *.o
	@cc -c xxHash/xxhash.c cuckoo.c -Wall
	@ld -r *.o -o libcuckoo
	@rm cuckoo.o xxhash.o

test:
	@echo "Testing"
	@cc libcuckoo cuckoo_test.c -o cuckoo_test
	@./cuckoo_test
