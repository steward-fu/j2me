CC      = /opt/mmiyoo/bin/arm-linux-gnueabihf-gcc
CFLAGS  = -Os -fPIC
CFLAGS += -I/usr/lib/jvm/jdk1.6.0_45/include -I/usr/lib/jvm/jdk1.6.0_45/include/linux
CFLAGS += -I/opt/mmiyoo/arm-buildroot-linux-gnueabihf/sysroot/usr/include/SDL
SOURCES = jcl.c javaio.c org_thenesis_midpath_io_backend_cldc_File.c org_thenesis_midpath_io_backend_cldc_RandomAccessFile.c
OBJECTS = $(patsubst %.c, %.o, $(SOURCES))

all: libmidpathfile.so

%.o : %.c
	$(CC) $(CFLAGS) -fPIC -g -c -Wall -o $(patsubst %.c, %.o, $<) $<

%.so: $(OBJECTS)
	$(CC) $(LDFLAGS) -shared -fPIC -Wl,-soname,$@ -lc -o $@ $^

clean:
	rm -f *.so *.o

