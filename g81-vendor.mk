# Private proprietary inputs for the G81 Android 8.1 device family.
LOCAL_PATH := vendor/alps/g81

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,vendor/alps/g81/proprietary/system/lib,system/lib)

# Optional factory component retained from the device's stock software. These
# modules are private and are included only when the private vendor tree is
# present in the build.
PRODUCT_PACKAGES += \
    G81SecretCodeRouter \
    WriteIMEI
