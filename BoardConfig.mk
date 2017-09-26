# mt6753 platform boardconfig
LOCAL_PATH := device/lenovo/A7010a48

MTK_PROJECT_CONFIG ?= $(LOCAL_PATH)/ProjectConfig.mk
include $(MTK_PROJECT_CONFIG)
MTK_INTERNAL_CDEFS := $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),$(foreach v,$(shell echo $($(t)) | tr '[a-z]' '[A-Z]'),-D$(v))))
MTK_INTERNAL_CDEFS += $(foreach t,$(AUTO_ADD_GLOBAL_DEFINE_BY_NAME_VALUE),$(if $(filter-out no NO none NONE false FALSE,$($(t))),-D$(t)=\"$($(t))\"))
BOARD_GLOBAL_CFLAGS += $(MTK_INTERNAL_CDEFS)
BOARD_GLOBAL_CPPFLAGS += $(MTK_INTERNAL_CDEFS)

# Platform
TARGET_BOARD_PLATFORM := mt6753
MTK_BOARD_PLATFORMS += mt6753
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := mt6753

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_PROTECT1IMAGE_PARTITION_SIZE:=10485760
BOARD_PROTECT2IMAGE_PARTITION_SIZE:=10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE:=2684354560
BOARD_CACHEIMAGE_PARTITION_SIZE:=419430400
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE:=1610612736

BLOCK_BASED_OTA :=false

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true
TARGET_KERNEL_HAVE_F2FS := true

MTK_PLATFORM := mt6753
MTK_PROJECT := 6753

TARGET_LDPRELOAD += mtk_symbols.so

# Use custom init.rc
TARGET_PROVIDES_INIT_RC := true


MTK_KERNEL_PREBUILD:=no

ifneq ($(MTK_KERNEL_PREBUILD),yes)
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_CONFIG := k5fpr_defconfig
TARGET_KERNEL_SOURCE := kernel/lenovo/A7010a48
else
# Hack for build
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
ifneq ($(MTK_K64_SUPPORT),yes)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuild/kernel32
else
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuild/kernel
endif
endif

ifneq ($(MTK_K64_SUPPORT),yes)
ARCH := arm
TARGET_ARCH := arm
KERNEL_ARCH := arm
TARGET_KERNEL_ARCH := arm
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_VARIANT := cortex-a53
BOARD_KERNEL_CMDLINE := bootopt=64S3,32S1,32S1
BOARD_KERNEL_OFFSET := 0x00008000
else
ARCH := arm64
TARGET_ARCH := arm64
KERNEL_ARCH := arm64
TARGET_KERNEL_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linaro-linux-android-
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT :=true
TARGET_BOARD_SUFFIX := _64
TARGET_CPU_ABI_LIST := arm64-v8a,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_64_BIT := arm64-v8a
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
BOARD_KERNEL_OFFSET := 0x00080000
endif
TARGET_CPU_CORTEX_A53 := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_SMP := true

BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_KMODULES := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Display
BOARD_EGL_CFG := /vendor/lenovo/A7010a48/vendor/lib/egl/egl.cfg
USE_OPENGL_RENDERER:=true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

# Camera
USE_CAMERA_STUB := true

# Mediatek support
BOARD_USES_MTK_HARDWARE:=true

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK\

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED := 0
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := MT6630
BOARD_MEDIATEK_USES_GPS := true

# RIL
SIM_COUNT := 2
BOARD_RIL_CLASS := ../../../device/lenovo/A7010a48/ril

# Wireless
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := /dev/wmtWifi
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_STATE_CTRL_PARAM := /dev/wmtWifi
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0
 

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop
#TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

ifneq ($(MTK_K64_SUPPORT),yes)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32
else
PRODUCT_COPY_FILES += system/core/rootdir/init.zygote64_32.rc:root/init.zygote64_32.rc
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote64_32
endif

# Recovery
TARGET_NO_RECOVERY := true

# Graphics
MTK_GPU_VERSION := mali midgard r12p1
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1

# Toolchain
TARGET_CUSTOM_TOOLCHAIN := true
TARGET_KERNEL_TC_SUFFIX := kernel-aospa
TARGET_GCC_VERSION := 7.x
TARGET_GCC_VERSION_EXP := 4.9
TARGET_GCC_VERSION_EXP_ARM64 := $(TARGET_GCC_VERSION)
TARGET_GCC_VERSION_ARM64 := 7.x-$(TARGET_KERNEL_TC_SUFFIX)
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linaro-linux-android-
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(strip $(HOST_OS))-x86/aarch64/$(TARGET_KERNEL_CROSS_COMPILE_PREFIX)7.x-$(TARGET_KERNEL_TC_SUFFIX)/bin
TARGET_TOOLCHAIN_ROOT := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(strip $(HOST_OS))-x86/aarch64/$(TARGET_KERNEL_CROSS_COMPILE_PREFIX)7.x/bin
