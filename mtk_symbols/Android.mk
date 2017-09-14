LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)


#    mtk_xlog.cpp
#    mtk_audioCompat.c \
#     mtk_gps.cpp


LOCAL_SRC_FILES := \
    icu53.c \
    icu55.c \
    icu56.c \
    ssl.c \
    mtk_asc.cpp \
    mtk_audio.cpp \
    mtk_fence.cpp \
    mtk_omx.cpp \
    mtk_ui.cpp

# only for 32bit libraries
LOCAL_SRC_FILES_32 := mtk_string.cpp
LOCAL_SRC_FILES_32 += mtk_wvm.cpp

# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp
LOCAL_SRC_FILES_64 += mtk_wvm64.cpp

LOCAL_SHARED_LIBRARIES := libbinder liblog libgui libui libicuuc libicui18n libmedia libssl libcrypto libstagefright_foundation libutils
LOCAL_MODULE := mtk_symbols
LOCAL_MODULE_TAGS := optional

LOCAL_CLANG := true
LOCAL_CPPFLAGS := -std=c++1y
LOCAL_CPPFLAGS += -Wno-exit-time-destructors
LOCAL_CPPFLAGS += -Wno-global-constructors
LOCAL_CPPFLAGS += -Wno-c++98-compat-pedantic
LOCAL_CPPFLAGS += -Wno-four-char-constants
LOCAL_CPPFLAGS += -Wno-padded

include $(BUILD_SHARED_LIBRARY)
