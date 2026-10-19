# Audio HIDL 2.0 Oreo ABI payload

The 2026-09-22 clean-flash vendor image omitted four private audio HIDL libraries
while its already-patched implementation libraries still requested them.
`tools/apply-audio-hidl-compat.py INPUT_VENDOR OUTPUT_VENDOR` applies this directory
with modes and SELinux xattrs and checks the filesystem. It preserves its input.
`tools/check-audio-hidl-compat.py OUTPUT_VENDOR` must pass before packaging.
`BOARD_PREBUILT_VENDORIMAGE` points to the repaired prebuilt/vendor.img; merely
adding PRODUCT_COPY_FILES does not regenerate this prebuilt partition.

Payload: four private `*-legacy.so` libraries, service and MTK extension with
matching DT_NEEDED entries. Current audio/effect implementations are preserved.
The effect library was regenerated from the original Oreo ELF because the old
modified artifact incorrectly declared the common library's SONAME.

Real device Android 10 linker tests in a recovery chroot: baseline audio/effect
implementation loads fail with missing legacy libraries; patched loads pass,
as does audio.primary.mt6580.so. This tests dynamic loading, not audio playback,
HIDL registration or boot completion. Android boot validation remains separate.

Transaction: workspace/android10-17.1/transactions/audio-hidl-rootfix-20260922-222043
