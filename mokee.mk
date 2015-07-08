# MoKee OpenSource Specific Changes

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Inherit some common MK stuff.
$(call inherit-product, vendor/mk/config/common_full_tablet_wifionly.mk)

# Enhanced NFC
$(call inherit-product, vendor/mk/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder.mk)

$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# Copy Extra Files
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml

# MK Overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/flounder/overlay-mk

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder \
    BUILD_FINGERPRINT=google/volantis/flounder:5.1.1/LMY47X/1849464:user/release-keys \
    PRIVATE_BUILD_DESC="flounder-user 5.1.1 LMY47X 1849464 release-keys"

## Device identifier. This must come after all inclusions
PRODUCT_NAME := mk_flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
