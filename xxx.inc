INHERIT_append_rpi = " uninative"
include conf/distro/include/yocto-uninative.inc
INHERIT_append_rpi = " image-buildinfo"
SDK_INCLUDE_NATIVESDK = "1"
BB_SETSCENE_ENFORCE_WHITELIST_append_rpi = " %:* *:do_fetch *"
