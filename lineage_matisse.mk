#
# Copyright (C) 2023-2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/xiaomi/matisse/device.mk)

# Inherit LineageOS product
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_NAME := lineage_matisse
PRODUCT_DEVICE := matisse
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := 22011211C

PRODUCT_SYSTEM_NAME := matisse
PRODUCT_SYSTEM_DEVICE := matisse
WITH_GMS := true
TARGET_GMS_TYPE := FULL

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="matisse-user 14 UP1A.231005.007 V816.0.14.0.ULNCNXM release-keys" \
    BuildFingerprint=Redmi/matisse/matisse:14/UP1A.231005.007/OS2.0.2.0.ULNCNXM:user/release-keys \


# Inherit GApps if available
$(call inherit-product-if-exists, vendor/gapps/arm64/arm64-vendor.mk)


