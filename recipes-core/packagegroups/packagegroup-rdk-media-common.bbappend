RDEPENDS_packagegroup-rdk-media-common_remove = "virtual/ea-games-provider"

RDEPENDS_packagegroup-rdk-media-common_append = " rfc"
RDEPENDS_packagegroup-rdk-media-common_append = " rdm"
RDEPENDS_packagegroup-rdk-media-common_append = " memstress"
RDEPENDS_packagegroup-rdk-media-common_append = " rdkat"
RDEPENDS_packagegroup-rdk-media-common_append = " cpuprocanalyzer"
RDEPENDS_packagegroup-rdk-media-common_append = " libunpriv"
RDEPENDS_packagegroup-rdk-media-common_append = " ctrlm-main"
RDEPENDS_packagegroup-rdk-media-common_append = " xr-atomic"
RDEPENDS_packagegroup-rdk-media-common_append = " xraudio-utils"
RDEPENDS_packagegroup-rdk-media-common_append_morty = " xr-fdc"
RDEPENDS_packagegroup-rdk-media-common_append = " xdialserver"
RDEPENDS_packagegroup-rdk-media-common_append = " dibbler-client"
RDEPENDS_packagegroup-rdk-media-common_append = " gst-external-plugin"
RDEPENDS_packagegroup-rdk-media-common_append = "\
   ${@bb.utils.contains("DISTRO_FEATURES", "tinyrdk", " smartmon","",d)}\
   "

RDEPENDS_packagegroup-rdk-media-common_append = "\
   ${@bb.utils.contains("DISTRO_FEATURES", "rialto", "\
   rialto-ocdm \
   rialto-gstreamer \
   rialto-client \
   rialto-server \
   rialto-servermanager \
   ","",d)} \
"

RDEPENDS_packagegroup-rdk-media-common_append_morty = "\
   ${@bb.utils.contains("DISTRO_FEATURES", "bluez5", "bluez5-bluetoothd","",d)} \
   "

RDEPENDS_packagegroup-rdk-media-common_append_dunfell = "\
   ${@bb.utils.contains("DISTRO_FEATURES", "bluez5", "bluez5-bluetoothd","",d)} \
   "

RDEPENDS_packagegroup-rdk-media-common_append = "\
   ${@bb.utils.contains("DISTRO_FEATURES", "blercudaemon", "asbluetoothrcu","",d)} \
   ${@bb.utils.contains("DISTRO_FEATURES", "rdkbrowser2", "rdkbrowser2","",d)} \
   "

RDEPENDS_packagegroup-rdk-media-common_remove_ipclient = "virtual/media-utils"

# smartmon does not build in voice build due to boost issues.
RDEPENDS_packagegroup-rdk-media-common_remove_voice = " smartmon"
