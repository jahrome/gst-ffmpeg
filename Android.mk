LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

GST_FFMPEG_TOP := $(LOCAL_PATH)

GST_FFMPEG_BUILT_SOURCES := 						\
	ext/ffmpeg/Android.mk

GST_FFMPEG_BUILT_SOURCES := $(patsubst %, $(abspath $(GST_FFMPEG_TOP))/%, $(GST_FFMPEG_BUILT_SOURCES))


.PHONY: gst-ffmpeg-configure
gst-ffmpeg-configure:
	cd $(GST_FFMPEG_TOP) ; \
	CC="$(CONFIGURE_CC)" \
	CFLAGS="$(CONFIGURE_CFLAGS)" \
	LD=$(TARGET_LD) \
	LDFLAGS="$(CONFIGURE_LDFLAGS)" \
	CPP=$(CONFIGURE_CPP) \
	CPPFLAGS="$(CONFIGURE_CPPFLAGS)" \
	PKG_CONFIG_LIBDIR="$(_CONFIGURE_PKG_CONFIG_LIBDIR)" \
	PKG_CONFIG_TOP_BUILD_DIR=/ \
	$(abspath $(GST_FFMPEG_TOP))/$(CONFIGURE) --host=arm-linux-androideabi \
		--prefix=/system --disable-orc --disable-valgrind && \
	for file in $(GST_FFMPEG_BUILT_SOURCES); do \
		rm -f $$file && \
		make -C $$(dirname $$file) $$(basename $$file) ; \
	done

#CONFIGURE_TARGETS += gst-ffmpeg-configure

-include $(GST_FFMPEG_TOP)/ext/ffmpeg/Android.mk
