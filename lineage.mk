## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := A7010a48

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/A7010a48/device_A7010a48.mk)

PRODUCT_NAME := lineage_A7010a48
PRODUCT_DEVICE := A7010a48
PRODUCT_BRAND := Lenovo
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_MODEL := Lenovo A7010a48
#CM_BUILD := A7010a48
#CM_VERSION := 14.1-$(shell date -u +%Y%m%d)-UNOFFICIAL-A7010a48

