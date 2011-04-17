LOCAL_PATH:=$(call my-dir)
include $(CLEAR_VARS)

LOCAL_ARM_MODE:=arm
LOCAL_MODULE_PATH:=$(TARGET_OUT)/lib/gstreamer-0.10

LOCAL_MODULE:=libgstffmpeg

LOCAL_MODULE_TAGS:=eng debug 

LOCAL_SRC_FILES := \
	gstffmpeg.c \
	gstffmpegprotocol.c \
	gstffmpegcodecmap.c \
	gstffmpegutils.c \
	gstffmpegenc.c \
	gstffmpegdec.c \
	gstffmpegcfg.c \
	gstffmpegdemux.c \
	gstffmpegmux.c \
	gstffmpegdeinterlace.c \
	gstffmpegaudioresample.c

LOCAL_SHARED_LIBRARIES:=\
	libglib-2.0 \
	libgobject-2.0 \
	libgmodule-2.0 \
	libgthread-2.0 \
	libgstbase-0.10 \
	libgstreamer-0.10 \
	libglib-2.0 \
	libgobject-2.0 \
	libgmodule-2.0 \
	libgthread-2.0 \
	libgstreamer-0.10 \
	libgstaudio-0.10 \
	libavformat \
        libavutil \
        libswscale \
        libavcodec \
	libm \
	libz \
	libutils \
	libdl

LOCAL_LDFLAGS:=\
	-module\
	-avoid-version\
	-export-symbols-regex\
	-no-undefined

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H \
	-I. \
	-I/home/jer/cm7/external/gstreamer_aggregate/gst-ffmpeg \
	-Iffmpeg-android/libavutil \
	-Iffmpeg-android/libavcore \
	-Iffmpeg-android/libavformat \
	-Iffmpeg-android/libavcodec \
	-Iffmpeg-android \
	-Wno-deprecated-declarations \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib/. \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib/./glib \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib/./gmodule \
	-I/home/jer/cm7/external/gstreamer_aggregate/gstreamer \
	-I/home/jer/cm7/external/gstreamer_aggregate/gstreamer/libs \
	-I/home/jer/cm7/external/gstreamer_aggregate/gst-plugins-base/gst-libs \
	-I/home/jer/cm7/external/gstreamer_aggregate/gst-ffmpeg/gst-libs \
	-I/home/jer/cm7/external/gstreamer_aggregate/gst-ffmpeg/gst-libs \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib/. \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib/./glib \
	-I///home/jer/cm7/external/gstreamer_aggregate/glib/./gmodule \
	-I/home/jer/cm7/external/gstreamer_aggregate/gstreamer \
	-I/home/jer/cm7/external/gstreamer_aggregate/gstreamer/libs \
	-Wall \
	-Wdeclaration-after-statement \
	-Wvla \
	-Wpointer-arith \
	-Wmissing-declarations \
	-Wmissing-prototypes \
	-Wredundant-decls \
	-Wundef \
	-Wwrite-strings \
	-Wformat-nonliteral \
	-Wformat-security \
	-Wold-style-definition \
	-Wcast-align \
	-Winit-self \
	-Wmissing-include-dirs \
	-Waddress \
	-Waggregate-return \
	-Wno-multichar \
	-Wnested-externs \
	-DGST_DISABLE_DEPRECATED

LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
