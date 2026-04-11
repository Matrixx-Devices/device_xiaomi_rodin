#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Matrixx Flags
MATRIXX_MAINTAINER := RubensGon
WITH_GMS := true
TARGET_SUPPORTED_REFRESH_RATES := 60,120
EXTRA_UDFPS_ANIMATIONS := true
TARGET_CUSTOM_UDFPS := true
WITH_BCR := true
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_DEFAULT_PIXEL_LAUNCHER := true
WITH_GMS_COMMS_SUITE := true
WITH_GMS_AICORE := true
TARGET_SHIPS_DOLBY := true
SURFACE_FLINGER_BOOST := true
TARGET_BOOT_ANIMATION_RES := 1080
USE_REALITY_ENGINE := false
HBM_SUPPORTED := true
TARGET_OPTIMIZED_DEXOPT := true

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/matrixx/config/common_full_phone.mk)

# Inherit from rodin device
$(call inherit-product, device/xiaomi/rodin/device.mk)

PRODUCT_DEVICE := rodin
PRODUCT_NAME := matrixx_rodin
PRODUCT_BRAND := POCO
PRODUCT_MODEL := 2412DPC0AG
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_SYSTEM_NAME := rodin_global
PRODUCT_SYSTEM_DEVICE := rodin

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="missi-user 15 AP3A.240905.015.A2 OS2.0.204.0.VOJMIXM release-keys" \
    BuildFingerprint=POCO/rodin_global/rodin:15/AP3A.240905.015.A2/OS2.0.204.0.VOJMIXM:user/release-keys \
    DeviceName=$(PRODUCT_SYSTEM_DEVICE) \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)
