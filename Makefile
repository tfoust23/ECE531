# Path to your Buildroot directory
BUILDROOT_HOME=/home/trevor/buildroot-2024.05.1

# Use the toolchain created by Buildroot
CC=$(BUILDROOT_HOME)/output/host/usr/bin/arm-linux-gcc
CFLAGS=--sysroot=$(BUILDROOT_HOME)/output/staging
INCLUDES=
LFLAGS=
LIBS=-lcurl -uClibc -lc

SRC=requestor.c
OBJ=$(SRC:.c=.o)
MAIN=test

RM=rm -rf

.c.o:
    $(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

$(MAIN): $(OBJ)
    $(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJ) $(LFLAGS) $(LIBS)

all: $(MAIN)

clean:
    $(RM) $(MAIN) *.o *~
