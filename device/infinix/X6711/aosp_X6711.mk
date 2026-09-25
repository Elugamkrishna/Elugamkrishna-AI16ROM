$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/infinix/X6711/device.mk)
$(call inherit-product, vendor/infinix/X6711/X6711-vendor.mk)

PRODUCT_NAME := aosp_X6711
PRODUCT_DEVICE := X6711
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6711
PRODUCT_MANUFACTURER := Infinix

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_SHIPPING_API_LEVEL := 30
