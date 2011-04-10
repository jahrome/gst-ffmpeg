LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= 		\
	gstffmpeg.c	\
	gstffmpegprotocol.c	\
	gstffmpegcodecmap.c	\
	gstffmpegenc.c	\
	gstffmpegdec.c	\
	gstffmpegcfg.c	\
	gstffmpegdeinterlace.c	\
	gstffmpegaudioresample.c	\
	gstffmpegdemux.c		\
	gstffmpegmux.c		\
	gstffmpegutils.c
	# GstFFMpegScale' has no member named 'res
	#gstffmpegscale.c		\

LOCAL_SHARED_LIBRARIES := \
	libgstbase-0.10		\
	libgstreamer-0.10	\
	libgstaudio-0.10	\
	libgstvideo-0.10	\
	libglib-2.0		\
	libgthread-2.0		\
	libgmodule-2.0		\
	libgobject-2.0		\
	libavcodec		\
	libavutil		\
	libavformat

LOCAL_MODULE:= libgstffmpeg

LOCAL_C_INCLUDES := 			\
	$(GST_FFMPEG_TOP)/android	\
	external/gstreamer		\
	external/gstreamer/android	\
	external/gstreamer/libs 	\
	external/gstreamer/gst		\
	external/gstreamer/gst/android	\
	external/gst-plugins-base/	\
	external/gst-plugins-base/gst-libs/	\
	external/gst-plugins-base/gst-libs/gst/audio/android/	\
	external/gst-plugins-base/gst-libs/gst/video/android/	\
	external/glib			\
	external/glib/android		\
	external/glib/glib 		\
	external/glib/gmodule		\
	external/glib/gobject 		\
	external/glib/gthread		\
        external/libxml2/include \
	ffmpeg-android/			\
	ffmpeg-android/build/ffmpeg/include/

LOCAL_SHARED_LIBRARIES += libicuuc
LOCAL_C_INCLUDES += external/icu4c/common

LOCAL_CFLAGS := \
	-DHAVE_CONFIG_H -DHAVE_AVI_H -lavcodec -lavutil -lavformat

LOCAL_PRELINK_MODULE := false
include $(BUILD_PLUGIN_LIBRARY)
