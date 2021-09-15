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

WIFI_FIRMWARE_PATH := hardware/amlogic/kernel-modules/dhd-driver/firmware/wifi

# bcm4339a0_ag ap6335
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm4339a0_ag/config_bcm4339a0_ag.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm4339a0_ag.txt \
    $(WIFI_FIRMWARE_PATH)/bcm4339a0_ag/fw_bcm4339a0_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4339a0_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4339a0_ag/nvram_ap6335.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6335.txt

# bcm4356a2_ag ap6356
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm4356a2_ag/config_bcm4356a2_ag.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm4356a2_ag.txt \
    $(WIFI_FIRMWARE_PATH)/bcm4356a2_ag/fw_bcm4356a2_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4356a2_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4356a2_ag/fw_bcm4356a2_ag_apsta.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4356a2_ag_apsta.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4356a2_ag/fw_bcm4356a2_ag_p2p.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4356a2_ag_p2p.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4356a2_ag/nvram_ap6356.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6356.txt

# bcm4358u_ag ap62x8
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm4358u_ag/fw_bcm4358u_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4358u_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4358u_ag/nvram_ap62x8.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap62x8.txt

# bcm4359c0_ag ap6398s
ifneq ($(filter %sabrina,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm4359c0_ag/sabrina/config_bcm4359c0_ag.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm4359c0_ag.txt \
    $(WIFI_FIRMWARE_PATH)/bcm4359c0_ag/sabrina/fw_bcm4359c0_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4359c0_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4359c0_ag/sabrina/nvram_ap6398s.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6398s.txt
else
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm4359c0_ag/config_bcm4359c0_ag.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm4359c0_ag.txt \
    $(WIFI_FIRMWARE_PATH)/bcm4359c0_ag/fw_bcm4359c0_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm4359c0_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm4359c0_ag/nvram_ap6398s.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6398s.txt
endif

# bcm43436b0 ap6236
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm43436b0/config_bcm43436b0.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm43436b0.txt \
    $(WIFI_FIRMWARE_PATH)/bcm43436b0/fw_bcm43436b0.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm43436b0.bin \
    $(WIFI_FIRMWARE_PATH)/bcm43436b0/nvram_ap6236.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6236.txt

# bcm43438a0 ap6212
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm43438a0/config_bcm43438a0.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm43438a0.txt \
    $(WIFI_FIRMWARE_PATH)/bcm43438a0/fw_bcm43438a0.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm43438a0.bin \
    $(WIFI_FIRMWARE_PATH)/bcm43438a0/nvram_ap6212.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6212.txt

# bcm43455c0_ag ap6255
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm43455c0_ag/config_bcm43455c0_ag.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm43455c0_ag.txt \
    $(WIFI_FIRMWARE_PATH)/bcm43455c0_ag/fw_bcm43455c0_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm43455c0_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm43455c0_ag/nvram_ap6255.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6255.txt

# bcm43456c5_ag ap6256
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm43456c5_ag/config_bcm43456c5_ag.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm43456c5_ag.txt \
    $(WIFI_FIRMWARE_PATH)/bcm43456c5_ag/fw_bcm43456c5_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm43456c5_ag.bin \
    $(WIFI_FIRMWARE_PATH)/bcm43456c5_ag/nvram_ap6256.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6256.txt

# bcm43751a1_ag
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/bcm43751a1_ag/clm_bcm43751a1_ag.blob:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/clm_bcm43751a1_ag.blob \
    $(WIFI_FIRMWARE_PATH)/bcm43751a1_ag/fw_bcm43751a1_ag.bin:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/fw_bcm43751a1_ag.bin

# unknown
PRODUCT_COPY_FILES += \
    $(WIFI_FIRMWARE_PATH)/unknown/config_bcm43438a1.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/config_bcm43438a1.txt \
    $(WIFI_FIRMWARE_PATH)/unknown/nvram_ap6271s.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/buildin/nvram_ap6271s.txt
