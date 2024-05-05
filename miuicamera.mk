#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := vendor/xiaomi/miuicamera-ruby

# Copy all need files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/privapp-permissions-miuicamera.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-miuicamera.xml \
    $(LOCAL_PATH)/configs/miuicamera-hiddenapi-package-allowlist.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/miuicamera-hiddenapi-package-allowlist.xml \

PRODUCT_SYSTEM_PROPERTIES += \
    ro.com.google.lens.oem_camera_package=com.android.camera \
    persist.vendor.camera.privapp.list=com.android.camera \
    ro.miui.notch=1

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(LOCAL_PATH)/sepolicy/vendor

$(shell
    if [ -f $(LOCAL_PATH)/proprietary/system/priv-app/MiuiCamera/MiuiCamera.apk.xz ]; then \
        xz -d $(LOCAL_PATH)/proprietary/system/priv-app/MiuiCamera/MiuiCamera.apk.xz || exit 1; \
    fi;
)

$(call inherit-product, vendor/xiaomi/miuicamera-ruby/ruby-miuicamera.mk)
