#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from xaga device
$(call inherit-product, device/xiaomi/xaga/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2460
TARGET_SCREEN_WIDTH := 1080
TARGET_BOOT_ANIMATION_RES := 1080

# ==========================================
# AxionOS 23.2 Specific Flags
# ==========================================

# 1. Disable EPPE
TARGET_DISABLE_EPPE := true

# 2. Device Maintainer & Processor Info
AXION_MAINTAINER := Jordan
AXION_PROCESSOR := Dimensity_8100

# 3. Camera Info (Redmi K50i: 64+8+2MP rear, 16MP front)
AXION_CAMERA_REAR_INFO := 64,8,2
AXION_CAMERA_FRONT_INFO := 16

# 4. Optional UI/UX Customizations
TARGET_ENABLE_BLUR := true
TARGET_INCLUDE_AXFX := false

# AxBurstEngine (disable conflicting libperfmgr)
TARGET_DISABLES_LIBPERF := true

# Ensures the controller fully parses the K50i's refresh rates
TARGET_SUPPORTED_REFRESH_RATES := 60,90,120,144

# Keeps Android Go optimizations disabled (xaga has > 4GB RAM)
TARGET_IS_LOW_RAM := false


# 6. Prebuilt LineageOS Apps (Set to true if you want default Lineage apps)
TARGET_INCLUDES_LOS_PREBUILTS := false

# 7. Hardware Features & Doze
HBM_SUPPORTED := false
BYPASS_CHARGE_SUPPORTED := false
PERF_GOV_SUPPORTED := false

TARGET_NEEDS_DOZE_FIX := false
TARGET_DOZE_TAP_PULSE_SUPPORTED := false
TARGET_DOZE_DOUBLE_TAP_PULSE_SUPPORTED := false
TARGET_DOZE_PICKUP_PULSE_SUPPORTED := true
TARGET_DOZE_SIDE_FPS_PULSE_SUPPORTED := false

PRODUCT_BRAND := POCO
PRODUCT_DEVICE := xaga
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 22041216G
PRODUCT_NAME := lineage_xaga
PRODUCT_SYSTEM_NAME := xaga_global

PRODUCT_CHARACTERISTICS := nosdcard
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint=POCO/xaga_global/xaga:14/UP1A.231005.007/OS2.0.3.0.ULOMIXM:user/release-keys \
    DeviceProduct=$(PRODUCT_SYSTEM_NAME)
    
    
#Dolby
$(call inherit-product, hardware/dolby/dolby.mk)

#Viper
$(call inherit-product, packages/apps/ViPER4AndroidFX/config.mk)

#MTK Scroll
PERF_ANIM_OVERRIDE := true


