
.PHONY: all
all: libarrays.a carrays.pyx setup.py makefile
	CFLAGS="-I." LDFLAGS="-L." python setup.py build_ext -i

# Put .o files into an archive (.a) file
libarrays.a: arrays.o makefile
	ar cr $@ $^

# Compile a .c file to get a .o file
%.o: %.c %.h makefile
	gcc -c $< -o $@

.PHONY: clean
clean:
	rm *.o *.a *.so
