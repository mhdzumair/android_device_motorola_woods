# inherit from the proprietary version
-include vendor/motorola/woods/BoardConfigVendor.mk


# Disable NINJA
#USE_NINJA := false

# Architecture
FORCE_32_BIT := true

# Platform
TARGET_BOARD_PLATFORM := mt6737m
MTK_BOARD_PLATFORMS += mt6737m
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := mt6737m

# Architecture
ifeq ($(FORCE_32_BIT),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)
endif

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_KERNEL_HAVE_EXFAT := true
TARGET_KERNEL_HAVE_NTFS := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage-dtb
TARGET_KERNEL_SOURCE := kernel/motorola/woods
BOARD_KERNEL_BASE := 0x40000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x04000000
BOARD_TAGS_OFFSET := 0xE000000
ifeq ($(FORCE_32_BIT),true)
ARCH := arm
TARGET_ARCH := arm
KERNEL_ARCH := arm
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := woods_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-
# Use UberTC 4.9 toolchain
KERNEL_TOOLCHAIN_PREFIX := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.9-uber/bin/arm-eabi-

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,32N2 androidboot.selinux=permissive androidboot.selinux=disabled 
BOARD_KERNEL_OFFSET := 0x00008000
else
TARGET_KERNEL_ARCH := arm64
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive androidboot.selinux=disabled 
BOARD_KERNEL_OFFSET = 0x00080000
TARGET_USES_64_BIT_BINDER := true
endif
BOARD_MKBOOTIMG_ARGS := --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_TAGS_OFFSET)

#Prebuilt_Kernel
#TARGET_PREBUILT_KERNEL := device/motorola/woods/kernel/zImage-dtb

TARGET_MTK_KERNEL := true
#CUstom TC
TARGET_TC_KERNEL := 4.9-uber

# make_ext4fs requires numbers in dec format
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2432696320
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4698144768
BOARD_CACHEIMAGE_PARTITION_SIZE := 419430400
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_KMODULES := true

# Assert
TARGET_OTA_ASSERT_DEVICE := Moto_E4,Moto E4,moto_e4,e4,woods,woods_f,woods_retail
TARGET_CUSTOM_BINARY := device/motorola/woods/configs/updater

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Flags
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# Display
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Charger
WITH_LINEAGE_CHARGER := false

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# SensorHAL
TARGET_SENSORS_DEVICE_API_VERSION := SENSORS_DEVICE_API_VERSION_1_1

# Graphics
BOARD_EGL_CFG := /vendor/motorola/woods/vendor/lib/egl/egl.cfg
USE_OPENGL_RENDERER:=true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
MTK_HWC_SUPPORT := yes
MTK_HWC_VERSION := 1.4.1
MTK_GPU_VERSION := mali midgard r12p1
OVERRIDE_RS_DRIVER := libRSDriver_mtk.so

# Mediatek support
BOARD_USES_MTK_HARDWARE:=true
#DISABLE_ASHMEM_TRACKING := true

# Camera
USE_CAMERA_STUB := true

# Boot animation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Audio
BOARD_USES_MTK_AUDIO := true

# Lineage Hardware
BOARD_HARDWARE_CLASS += device/motorola/woods/lineagehw

# Fix video autoscaling on old OMX decoders
#TARGET_OMX_LEGACY_RESCALING := true

# Charger
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# RIL
#BOARD_RIL_CLASS := ../../../device/motorola/woods/ril/

# GPS
BOARD_GPS_LIBRARIES :=true
BOARD_CONNECTIVITY_MODULE := MT6625
BOARD_MEDIATEK_USES_GPS := true

# Wireless
# MTK_WLAN_SUPPORT
BOARD_WLAN_DEVICE		 := MediaTek
BOARD_CONNECTIVITY_VENDOR        := MediaTek
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM        := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA          := STA
WIFI_DRIVER_FW_PATH_AP           := AP
WIFI_DRIVER_FW_PATH_P2P          := P2P
WIFI_DRIVER_STATE_CTRL_PARAM	 := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON		 := 1
WIFI_DRIVER_STATE_OFF	:= 0

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true
#MALLOC_IMPL := dlmalloc

# Charger
BOARD_CHARGER_SHOW_PERCENTAGE := true

# LED Path
BOARD_RED_LED_PATH	:= "/sys/class/leds/test-led"
BOARD_GREEN_LED_PATH	:= "/sys/class/leds/greenled"

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

TARGET_LDPRELOAD += mtk_symbols.so

# Include needed symbols
TARGET_INCLUDE_XLOG_SYMBOLS := true
TARGET_INCLUDE_AUDIO_SYMBOLS := true
TARGET_INCLUDE_UI_SYMBOLS := true
TARGET_INCLUDE_GUI_SYMBOLS := true

# Disable memcpy opt (for audio libraries)
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# MTK Hardware
BOARD_USES_MTK_HARDWARE := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
BOARD_USES_MTK_AUDIO := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_CAMERA_STUB := true
BOARD_PROVIDES_RILD := true
#TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_mtk

BOARD_DISABLE_HW_ID_MATCH_CHECK := true
SUPPRESS_MTK_AUDIO_BLOB_ERR_MSG := true

# Deodex
WITH_DEXPREOPT := false

# CWM
TARGET_RECOVERY_FSTAB := device/motorola/woods/rootdir/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true

# TWRP stuff
#RECOVERY_VARIANT := twrp
TW_THEME := portrait_hdpi
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_MAX_BRIGHTNESS := 255
TW_EXCLUDE_SUPERSU := true
TW_INCLUDE_FB2PNG := true
TW_NO_CPU_TEMP := true
TW_REBOOT_BOOTLOADER := true
TW_REBOOT_RECOVERY := true
TW_HAS_DOWNLOAD_MODE := true
TW_EXCLUDE_SUPERSU := true
TW_USE_TOOLBOX := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_DEFAULT_LANGUAGE := en
HAVE_SELINUX := true

TARGET_SYSTEM_PROP := device/motorola/woods/system.prop
TARGET_SPECIFIC_HEADER_PATH := device/motorola/woods/include
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

BOARD_SEPOLICY_DIRS := \
       device/motorola/woods/sepolicy

# Seccomp filter
BOARD_SECCOMP_POLICY += device/motorola/woods/seccomp

#HIDL
DEVICE_MANIFEST_FILE := device/motorola/woods/hidl/manifest.xml

# Hack for build
#TARGET_BLOBS_BYPASS_SYMBOL_ERR := true

# CM SEPolicy flags
#TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Hack for build
#$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
