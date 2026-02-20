CC          = /opt/mmiyoo/bin/arm-linux-gnueabihf-gcc
CFLAGS      = -Os -fPIC
CFLAGS     += -I/usr/lib/jvm/jdk1.6.0_45/include -I/usr/lib/jvm/jdk1.6.0_45/include/linux
CFLAGS     += -I/opt/mmiyoo/arm-buildroot-linux-gnueabihf/sysroot/usr/include/SDL
SDLJAVA_LIB = -lSDL

SDLJAVA_MIXER_OBJ = SDLMixer_wrap.o
SDLJAVA_MIXER_LIB = -lSDL_mixer

SDLJAVA_TTF_OBJ   = SDLTTF_wrap.o
SDLJAVA_TTF_LIB   = -lSDL_ttf

SDLJAVA_IMAGE_OBJ = SDLImage_wrap.o
SDLJAVA_IMAGE_LIB = -lSDL_image

SDLJAVA_GFX_OBJ   = SDLGFX_wrap.o SDLVideo_wrap.o
SDLJAVA_GFX_LIB   = -lSDL_gfx

SDLJAVA_OBJ = SDLAudio_wrap.o\
              SDLEvent_wrap.o\
              SDLMain_wrap.o\
              SDLVideo_wrap.o\
              SDLJoystick_wrap.o\
              SDLCdrom_wrap.o

all: libsdljava.so libsdljava_mixer.so libsdljava_ttf.so libsdljava_image.so libsdljava_gfx.so

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

libsdljava.so: $(SDLJAVA_OBJ)
	$(CC) -shared -o libsdljava.so $(SDLJAVA_OBJ) $(SDLJAVA_LIB)

libsdljava_mixer.so: $(SDLJAVA_MIXER_OBJ)
	$(CC) -shared -o libsdljava_mixer.so $(SDLJAVA_MIXER_OBJ) $(SDLJAVA_MIXER_LIB)

libsdljava_ttf.so: $(SDLJAVA_TTF_OBJ)
	$(CC) -shared -o libsdljava_ttf.so $(SDLJAVA_TTF_OBJ) $(SDLJAVA_TTF_LIB)

libsdljava_image.so: $(SDLJAVA_IMAGE_OBJ)
	$(CC) -shared -o libsdljava_image.so $(SDLJAVA_IMAGE_OBJ) $(SDLJAVA_IMAGE_LIB)

libsdljava_gfx.so: $(SDLJAVA_GFX_OBJ)
	$(CC) -shared -o libsdljava_gfx.so $(SDLJAVA_GFX_OBJ) $(SDLJAVA_GFX_LIB)

clean:
	rm *.o *.so
