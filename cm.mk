## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := a7010

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/mtk/a7010/device_a7010.mk)

PRODUCT_NAME := cm_a7010
PRODUCT_DEVICE := a7010
PRODUCT_BRAND := Lenovo
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_MODEL := Lenovo A7010
#CM_BUILD := a7010
#CM_VERSION := 14.1-$(shell date -u +%Y%m%d)-UNOFFICIAL-a7010

