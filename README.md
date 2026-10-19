# G81 Android 10 private build inputs

Branch `lineage-17.1`; use the pinned public android_manifest entry point.
The vendor image is the cumulative tested MTK compatibility image. Required
device prebuilts are under `device-prebuilts`; the public device/prebuilt
symlink resolves here. Git LFS must materialize images/APKs before building.

`release-inputs/files.json` hashes every actual input; vendor-image.json lists
the final Health/SELinux payloads. No NVRAM, nvdata, userdata dump, raw runtime
logs or personal device identity partitions are added to this release.

Legacy stock factory components are retained from the existing private input
tree; this publication does not activate them or modify device identities.
The canonical vendor SHA256 is
`9d4bee1e55a3a274e7e06ea8685c77bf2a260466e1a3c148edb8f414d68350b8`.

## Environment preservation (2026-10-19)

This vendor repository is intended for public source reproduction. Check out
the branch matching the Android version. `release-inputs/files.json` records
the SHA256 of every build input; use Git LFS before checking or building.
The image is supplied prebuilt, not regenerated from unmodified stock by a
complete source-only pipeline. No NVRAM, nvdata, protect or user data belongs
in this repository. PC-format backups, device logs and original calibration
data are kept separately, privately, on the backup disk.
