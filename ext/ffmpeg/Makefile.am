plugin_LTLIBRARIES = libgstffmpeg.la

if HAVE_BZ2
    BZ2_LIBS = -lbz2
else
    BZ2_LIBS =
endif

libgstffmpeg_la_SOURCES = gstffmpeg.c	\
			  gstffmpegprotocol.c	\
			  gstffmpegcodecmap.c	\
			  gstffmpegutils.c	\
			  gstffmpegenc.c	\
			  gstffmpegdec.c	\
			  gstffmpegcfg.c	\
			  gstffmpegdemux.c	\
			  gstffmpegmux.c    \
			  gstffmpegdeinterlace.c	\
			  gstffmpegaudioresample.c
# 	\
# 			  gstffmpegscale.c

libgstffmpeg_la_CFLAGS = $(FFMPEG_CFLAGS) $(GST_PLUGINS_BASE_CFLAGS) $(GST_CFLAGS)
libgstffmpeg_la_LIBADD = $(FFMPEG_LIBS) $(GST_BASE_LIBS) $(GST_PLUGINS_BASE_LIBS) -lgstaudio-$(GST_MAJORMINOR) $(LIBM) $(WIN32_LIBS) -lz $(BZ2_LIBS)
libgstffmpeg_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS) $(DARWIN_LDFLAGS)
libgstffmpeg_la_LIBTOOLFLAGS = --tag=disable-static

if HAVE_FFMPEG_UNINSTALLED
libgstffmpeg_la_DEPENDENCIES = $(FFMPEG_LIBS)
endif


noinst_HEADERS = \
	gstffmpeg.h \
	gstffmpegcodecmap.h \
	gstffmpegutils.h \
	gstffmpegenc.h \
	gstffmpegcfg.h \
	gstffmpegpipe.h

Android.mk: Makefile.am $(BUILT_SOURCES)
	androgenizer \
	-:PROJECT libgstffmpeg -:SHARED libgstffmpeg \
	 -:TAGS eng debug \
         -:REL_TOP $(top_srcdir) -:ABS_TOP $(abs_top_srcdir) \
	 -:SOURCES $(libgstffmpeg_la_SOURCES) \
	 -:CFLAGS $(DEFS) $(DEFAULT_INCLUDES) $(libgstffmpeg_la_CFLAGS) \
	 -:LDFLAGS $(libgstffmpeg_la_LDFLAGS) \
	           $(libgstffmpeg_la_LIBADD) \
	           -ldl \
	 -:PASSTHROUGH LOCAL_ARM_MODE:=arm \
		       LOCAL_MODULE_PATH:='$$(TARGET_OUT)/lib/gstreamer-0.10' \
	> $@
