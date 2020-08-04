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

ifeq ($(TARGET_BUILD_PDK),true)
ifeq ($(TARGET_BOARD_PLATFORM),hi6250)

#----------------------------------------------------------------------
# Fixup libandroid dependency
#----------------------------------------------------------------------

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := libandroid
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES_arm := ../../../../$(PRODUCT_OUT)/obj/PACKAGING/pdk_fusion_intermediates/system/lib/libandroid.so
LOCAL_SRC_FILES_arm64 := ../../../../$(PRODUCT_OUT)/obj/PACKAGING/pdk_fusion_intermediates/system/lib64/libandroid.so
LOCAL_MULTILIB := both
LOCAL_MODULE_OWNER := qcom

include $(BUILD_PREBUILT)

$(LOCAL_PATH)/../../../../$(PRODUCT_OUT)/obj/PACKAGING/pdk_fusion_intermediates/system/lib/libandroid.so : $(PRODUCT_OUT)/obj/PACKAGING/pdk_fusion_intermediates/pdk_fusion.stamp
$(LOCAL_PATH)/../../../../$(PRODUCT_OUT)/obj/PACKAGING/pdk_fusion_intermediates/system/lib64/libandroid.so : $(PRODUCT_OUT)/obj/PACKAGING/pdk_fusion_intermediates/pdk_fusion.stamp

endif
endif
