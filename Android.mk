LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a7010)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif
