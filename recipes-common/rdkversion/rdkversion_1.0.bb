SUMMARY = "RDK version provides a shared library that can be used to access the RDK software version information."
SECTION = "console/utils"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

PV = "1.0+git${SRCPV}"

SRCREV_rdkversion = "${AUTOREV}"
SRCREV_FORMAT     = "rdkversion"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/rdkversion;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=rdkversion"

S = "${WORKDIR}/git"

FILES_${PN} += "${includedir}/rdkversion.h \
                ${libdir}/librdkversion.so \
                ${bindir}/rdkversion \
               "

PROVIDES = "rdkversion"
RPROVIDES_${PN} = "librdkversion.so"

DEPENDS = "glib-2.0"

inherit autotools pkgconfig coverity

INCLUDE_DIRS = " \
    -I${PKG_CONFIG_SYSROOT_DIR}/usr/include/glib-2.0 \
    -I${PKG_CONFIG_SYSROOT_DIR}/usr/lib/glib-2.0/include \
    "

CXXFLAGS += " -std=c++11 -fPIC -D_REENTRANT -rdynamic -Wall -Werror ${INCLUDE_DIRS}"

CFLAGS += " -std=c99 -Wall -Werror ${INCLUDE_DIRS}"
