# Private proprietary inputs for the G81 Android 8.1 device family.
LOCAL_PATH := vendor/alps/g81

G81_SYSTEM_LIB_COPY_FILES := \
    $(call find-copy-subdir-files,*,vendor/alps/g81/proprietary/system/lib,system/lib)

# Android 10 builds the HIDL interface from hardware/interfaces. The stock
# blob with the same filename would create a duplicate system/lib target.
PRODUCT_COPY_FILES += \
    $(filter-out \
        %android.hardware.biometrics.fingerprint@2.1.so \
        %android.hardware.nfc@1.0.so \
        %android.hardware.wifi@1.0.so \
        %android.hardware.wifi@1.1.so \
        %android.hardware.wifi.supplicant@1.0.so \
        %libandroid_net.so \
        %libaudio-resampler.so \
        %libcurl.so \
        %libfmjni.so \
        %libion.so \
        %libnfc-nci.so \
        %libnfc_nci_jni.so \
        %libxml2.so \
        %libxtables.so, \
        $(G81_SYSTEM_LIB_COPY_FILES))

# The legacy MTK wpa_supplicant is linked against the Android 10 HIDL
# interface libraries.  Keep all three revisions in the system image; the
# vendor image only carries the Oreo implementation shim.
PRODUCT_PACKAGES += \
    android.hardware.wifi.supplicant@1.0 \
    android.hardware.wifi.supplicant@1.1 \
    android.hardware.wifi.supplicant@1.2

# Optional factory component retained from the device's stock software. These
# modules are private and are included only when the private vendor tree is
# present in the build.
PRODUCT_PACKAGES += \
    G81SecretCodeRouter \
    WriteIMEI
