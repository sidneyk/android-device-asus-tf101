# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for tf101 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#
# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Configure as xhdpi device to prevent breaking without mdpi drawables
PRODUCT_AAPT_CONFIG := normal mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_tf101
PRODUCT_DEVICE := tf101
PRODUCT_BRAND := Asus
PRODUCT_MODEL := TF101
PRODUCT_MANUFACTURER := asus

# Inherit from those products. Most specific first.
$(call inherit-product, device/asus/tf101/device_tf101.mk)

