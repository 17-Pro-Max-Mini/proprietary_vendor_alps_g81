# MT6580 OMX ABI compatibility

`libMtkOmxVdecEx.so` is the stock Oreo decoder with only its `DT_NEEDED` entry
for `libui.so` retargeted to the isolated `libui-oreo.so`. Android 10's
`libui.so` does not export the legacy `GraphicBufferMapper::lock` symbols;
`libui-oreo.so` does. `tools/apply-omx-abi-fix.sh` applies the image change
while restoring the vendor SELinux xattr.
