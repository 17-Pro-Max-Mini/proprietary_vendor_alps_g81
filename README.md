# proprietary_vendor_alps_g81

Private vendor repository for the `g81` Android 8.1 port. It contains files
extracted from an authorized stock image: the prebuilt MT6580 kernel, the
canonical vendor partition image, and system-side compatibility libraries used
by the legacy MTK HIDL stack.

Do not publish this repository or mirror its contents. Do not add partition
backups, radio calibration data, identifiers, device logs, stock system images,
or user data.

Expected hashes:

```text
proprietary/kernel      c6d2c9b973d859054bc60c98e9afed37b5d11c813ab66b930534405b8e6a1c7d
proprietary/vendor.img  95a5dfaaaa9f3db8d5d5cf37fae1f21b28027dafd910c815c3068162c7892f9e
```

The public `android_device_alps_g81` repository has `extract-files.sh` for
recreating this layout from an authorized local source. This repository is
checked out by the manifest at `vendor/alps/g81`.

The private `factory/` directory carries authorized stock factory components.
They are included only when this private checkout is present and are not part
of the public device tree.

## Environment preservation (2026-10-19)

This vendor repository is intended for public source reproduction. Check out
the branch matching the Android version. `release-inputs/files.json` records
the SHA256 of every build input; use Git LFS before checking or building.
The image is supplied prebuilt, not regenerated from unmodified stock by a
complete source-only pipeline. No NVRAM, nvdata, protect or user data belongs
in this repository. PC-format backups, device logs and original calibration
data are kept separately, privately, on the backup disk.
