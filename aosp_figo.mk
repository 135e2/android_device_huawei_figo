#
# Copyright 2020 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_arm64_ab.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Device
$(call inherit-product, device/huawei/figo/device.mk)

PRODUCT_NAME := aosp_figo
PRODUCT_DEVICE := figo
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on figo
PRODUCT_MANUFACTURER := Huawei

$(call inherit-product-if-exists, vendor/huawei/figo/figo-vendor.mk)

# Launcher3QuickStep
PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    WallpaperPicker
