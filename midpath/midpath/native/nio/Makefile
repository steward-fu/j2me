JAVA_DIR = $(shell echo $$JAVA_HOME)
CFLAGS   = -Os -fPIC
CFLAGS  += -I$(JAVA_DIR)/include -I$(JAVA_DIR)/include/linux
CFLAGS  += -I/usr/include/SDL
SOURCES  = java_nio_ByteBufferImpl.c
OBJECTS  = $(patsubst %.c, %.o, $(SOURCES))

all: libmidpathnio.so

%.o : %.c
	$(CC) $(CFLAGS) -fPIC -g -c -Wall -o $(patsubst %.c, %.o, $<) $<

%.so: $(OBJECTS)
	$(CC) $(LDFLAGS) -shared -fPIC -Wl,-soname,$@ -lc -o $@ $^

clean:
	rm -f *.so *.o 


