#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/matisse

# Display
TARGET_SCREEN_DENSITY := 560

# Kernel
KERNEL_PREBUILTS_DIR := $(DEVICE_PATH)/prebuilt

TARGET_NO_KERNEL_OVERRIDE := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/mt6983

BOARD_PREBUILT_DTBIMAGE_DIR := $(KERNEL_PREBUILTS_DIR)/dtbs/
BOARD_PREBUILT_DTBOIMAGE := $(KERNEL_PREBUILTS_DIR)/dtbo.img
PRODUCT_COPY_FILES += \
	$(KERNEL_PREBUILTS_DIR)/kernel:kernel

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILTS_DIR)/modules.load))
BOARD_VENDOR_KERNEL_MODULES := $(wildcard $(KERNEL_PREBUILTS_DIR)/modules/*.ko)

BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILTS_DIR)/modules.load.vendor_ramdisk))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_PREBUILTS_DIR)/modules/, $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD))

BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD := $(strip $(shell cat $(KERNEL_PREBUILTS_DIR)/modules.load.recovery))
RECOVERY_MODULES := $(addprefix $(KERNEL_PREBUILTS_DIR)/modules/, $(BOARD_VENDOR_RAMDISK_RECOVERY_KERNEL_MODULES_LOAD))

BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(sort $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES) $(RECOVERY_MODULES))

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# SPL
BOOT_SECURITY_PATCH := 2025-03-01
VENDOR_SECURITY_PATCH := $(BOOT_SECURITY_PATCH)

# Inherit from mt6895-common
include device/xiaomi/mt6983-common/BoardConfigCommon.mk

# Inherit the proprietary files
include vendor/xiaomi/matisse/BoardConfigVendor.mk

# Avium Setting
include device/xiaomi/matisse/avium_common.mk
