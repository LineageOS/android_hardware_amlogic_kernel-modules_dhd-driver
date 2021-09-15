#
# Copyright (C) 2021 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)

# bcm2076b1
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm2076b1/BCM2076.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM2076.hcd \

# bcm4335c0
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4335c0/bcm4335c0.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bcm4335c0.hcd \

# bcm4345c0
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4345c0/BCM4345C0.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4345C0.hcd \

# bcm4345c5
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4345c5/BCM4345C5.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4345C5.hcd \

# bcm4354a1
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4354a1/BCM4350.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4350.hcd \

# bcm4356a2
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4356a2/BCM4354.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4354.hcd \

# bcm4359c0
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4359c0/BCM4359C0.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4359C0.hcd \

# bcm4362a1
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm4362a1/BCM4362A1.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4362A1.hcd \

# bcm20703a2
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm20703a2/BCM20703A2.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM20703A2.hcd \

# bcm20710a1
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm20710a1/BCM20702.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM20702.hcd \

# bcm40183b2
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm40183b2/BCM4330.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/BCM4330.hcd \

# bcm43241b4
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm43241b4/bcm43241b4.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bcm43241b4.hcd \

# bcm43341b0
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm43341b0/bcm43341b0.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bcm43341b0.hcd \

# bcm43438a0
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm43438a0/4343.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/4343.hcd \

# bcm43569a2
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bcm43569a2/bcm43569a2.hcd:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bcm43569a2.hcd \

