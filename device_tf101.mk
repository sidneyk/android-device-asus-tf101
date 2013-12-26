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

# Need to change to 'arm-eabi-4.4.3' to build the recovery kernel instead of using prebuilt recovery kernel. This also directs the toolchain to use for normal ROM kernel build
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-L4.7

$(call inherit-product-if-exists, vendor/asus/tf101/tf101-vendor.mk)
$(call inherit-product-if-exists, vendor/widevine/tf101/device-tf101.mk)

DEVICE_PACKAGE_OVERLAYS += device/asus/tf101/overlay

# Ramdisk files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/fstab.ventana:root/fstab.ventana \
	$(LOCAL_PATH)/ramdisk/init.ventana.rc:root/init.ventana.rc \
	$(LOCAL_PATH)/ramdisk/init.ventana.usb.rc:root/init.ventana.usb.rc \
	$(LOCAL_PATH)/ramdisk/ueventd.ventana.rc:root/ueventd.ventana.rc \
	$(LOCAL_PATH)/twrp.fstab:recovery/root/etc/twrp.fstab

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/bdaddr:system/etc/bluetooth/bdaddr \
    $(LOCAL_PATH)/prebuilt/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/bin/wifimacwriter:system/bin/wifimacwriter \
    $(LOCAL_PATH)/prebuilt/xbin/rsync:system/xbin/rsync \
    $(LOCAL_PATH)/prebuilt/data/srs_processing.cfg:system/data/srs_processing.cfg \
    $(LOCAL_PATH)/prebuilt/etc/gps/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    $(LOCAL_PATH)/prebuilt/wifi/nvram_murata.txt:system/etc/nvram_murata.txt \
    $(LOCAL_PATH)/prebuilt/wifi/nvram_nh615_sl101.txt:system/etc/nvram_nh615_sl101.txt \
    $(LOCAL_PATH)/prebuilt/wifi/nvram_nh615.txt:system/etc/nvram_nh615.txt \
    $(LOCAL_PATH)/prebuilt/wifi/nvram.txt:system/etc/nvram.txt

# Input stuff
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/elantech_touchscreen.idc:system/usr/idc/elantech_touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/idc/panjit_touch.idc:system/usr/idc/panjit_touch.idc \
    $(LOCAL_PATH)/prebuilt/usr/keychars/asusec.kcm:system/usr/keychars/asusec.kcm \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/asusec.kl:system/usr/keylayout/asusec.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Vendor firmware
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/fw_bcmdhd.bin:system/vendor/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/fw_bcmdhd_apsta.bin:system/vendor/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/prebuilt/vendor/firmware/fw_bcmdhd_p2p.bin:system/vendor/firmware/fw_bcmdhd_p2p.bin

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    media.stagefright.cache-params=6144/-1/30 \
    ro.sf.lcd_density=160 \
    ro.bq.gpu_to_cpu_unsupported=1 \
    dalvik.vm.dexopt-data-only=1 \
    debug.hwui.render_dirty_regions=false \
    persist.tegra.nvmmlite=1 \
    ro.zygote.disable_gl_preload=true \
    tf.enable=y \
    ro.opengles.version=131072

# TF101 specific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.epad.model=TF101 \
    ro.product.model=TF101

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    $(LOCAL_PATH)/prebuilt/etc/permissions/android.hardware.tf101.xml:system/etc/permissions/android.hardware.tf101.xml

PRODUCT_PACKAGES += \
	Camera \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
	libnetcmdiface \
	make_ext4fs \
	setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    whisperd \
    libaudioutils \
    libinvensense_mpl \
    blobpack_tf \
	mischelp

PRODUCT_CHARACTERISTICS := tablet

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# media config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_codecs.xml:system/etc/media_codecs.xml

# Camera config file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/nvcamera.conf:system/etc/nvcamera.conf

# Bluetooth config file
#PRODUCT_COPY_FILES += \
#    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf

# audio mixer paths
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf

# Disable SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled \
    ro.build.selinux=0

# Inherit tablet dalvik settings
$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)    

WIFI_BAND := 802_11_BG

# Prebuilt config files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

