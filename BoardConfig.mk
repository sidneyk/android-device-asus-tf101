#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

LOCAL_PATH := device/asus/tf101
BOARD_NEEDS_LZMA_MINIGZIP := true
TARGET_OTA_ASSERT_DEVICE := tf101

# Audio Options
USE_PROPRIETARY_AUDIO_EXTENSIONS := false
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_AUDIO_HW := false
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

# Camera options
BOARD_USES_PROPRIETARY_LIBCAMERA := true
BOARD_SECOND_CAMERA_DEVICE := true
BOARD_CAMERA_HAVE_ISO := true
USE_CAMERA_STUB := true
ICS_CAMERA_BLOB := true
BOARD_VENDOR_USE_NV_CAMERA := true

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Use a smaller subset of system fonts to keep image size lower
SMALLER_FONT_FOOTPRINT := true

# Use the non-open-source parts, if they're present
-include vendor/asus/tf101/BoardConfigVendor.mk

DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t20
TARGET_BOOTLOADER_BOARD_NAME := ventana

TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT_FPU := vfpv3-d16
ARCH_ARM_HAVE_TLS_REGISTER := true
#ARCH_ARM_USE_NON_NEON_MEMCPY := true
ARCH_ARM_HIGH_OPTIMIZATION := true

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE :=

TARGET_BOARD_INFO_FILE := device/asus/tf101/board-info.txt

BOARD_EGL_CFG := device/asus/tf101/egl.cfg
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
BOARD_USES_HGL := true
BOARD_USES_OVERLAY := true
USE_OPENGL_RENDERER := true
BOARD_EGL_NEEDS_LEGACY_FB := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
SKIP_SET_METADATA := true
ENABLE_WEBGL := true
BOARD_USE_MHEAP_SCREENSHOT := true
BOARD_USES_HWCOMPOSER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_NEEDS_OLD_HWC_API := true
BOARD_NEED_OMX_COMPAT := true

BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true

# Recovery and boot.img settings
BOARD_CUSTOM_BOOTIMG_MK := device/asus/tf101/recovery/recovery.mk
#TARGET_RECOVERY_INITRC := device/asus/tf101/recovery/init.recovery.ventana.rc
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 5242880
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14372306944
BOARD_FLASH_BLOCK_SIZE := 4096

# Wifi related defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
#WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd_apsta.bin"

BOARD_HAS_NO_SELECT_BUTTON := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_HAVE_GPS := true

# Ventana HAL libraries
BOARD_HAL_STATIC_LIBRARIES := \
	libdumpstate.ventana \
	libhealthd.ventana

# Custom Tools
TARGET_RECOVERY_PRE_COMMAND := "echo 'boot-recovery' > /dev/block/mmcblk0p3; sync"
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/asus/tf101/releasetools/tf101_ota_from_target_files

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

BOARD_MALLOC_ALIGNMENT := 16
TARGET_EXTRA_CFLAGS := $(call cc-option,-mtune=cortex-a9)$(call cc-option,-mcpu=cortex-a9)

COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Compatibility with pre-kitkat Sensor HALs
SENSORS_NEED_SETRATE_ON_ENABLE := true

#define to use all of the Linaro Cortex-A9 optimized string funcs,
#instead of subset known to work on all machines
USE_ALL_OPTIMIZED_STRING_FUNCS := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/asus/tf101
TARGET_KERNEL_CONFIG := sid_selinux_defconfig
#TARGET_PREBUILT_KERNEL := device/asus/tf101/prebuilt/kernel

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/tf101/bluetooth
RECOVERY_FSTAB_VERSION := 2

TARGET_RECOVERY_FSTAB := device/asus/tf101/ramdisk/fstab.ventana
TARGET_PREBUILT_RECOVERY_KERNEL := device/asus/tf101/recovery/kernel

# TWRP Settings
DEVICE_RESOLUTION := 1280x800
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/sdcard1"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TW_FLASH_FROM_STORAGE := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/mmcblk0p7"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "data=ordered,delalloc"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"

TWRP_CUSTOM_KEYBOARD := ../../../device/asus/tf101/recovery/hardwarekeyboard.cpp


