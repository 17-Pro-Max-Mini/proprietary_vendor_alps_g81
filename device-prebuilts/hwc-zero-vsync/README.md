# MT6580 HWC2 zero-VSYNC compatibility payload (historical fixture)

This candidate was tested for analysis only.  It preserves the installed
SONAME and DT_NEEDED list while normalizing non-positive timestamps from the
MTK HWC callback to `systemTime(SYSTEM_TIME_MONOTONIC)`, but it produced a
black spinner on the actual G81EM1 device.  The release vendor image uses the
verified HWC2 stack already embedded in `prebuilt/vendor.img`.

The historical failure was a stream of `Ignoring duplicate VSYNC ... (t=0)`
followed by `Faking VSYNC due to driver stall`, gralloc allocation error 5 and
a SurfaceFlinger crash in the Mali EGL native-buffer mapper.  The payload SHA256
is `714c142b137b7c9ecf703bcbc1a34804b757f0a6bf1170afa1650b321b3dd06a`.

The payload is not included in the canonical `prebuilt/vendor.img`.  The
transformer is retained only to reproduce the historical A/B test and must
not be used when packaging a release image.
