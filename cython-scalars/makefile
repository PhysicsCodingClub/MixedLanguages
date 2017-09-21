
.PHONY: all
all: libscalars.a cscalars.pyx setup.py makefile
	CFLAGS="-I." LDFLAGS="-L." python setup.py build_ext -i

# Put .o files into an archive (.a) file
libscalars.a: scalars.o makefile
	ar cr $@ $^

# Compile a .c file to get a .o file
%.o: %.c %.h makefile
	gcc -c $< -o $@


.PHONY: clean
clean:
	rm *.o *.a *.so
