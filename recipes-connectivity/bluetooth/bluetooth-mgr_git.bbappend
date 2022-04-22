DEPENDS_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'ipclient', 'virtual/media-utils', '', d)}"
DEPENDS_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'ipclient', 'audiocapturemgr',  '', d)}"

RDEPENDS_${PN}_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'ipclient', 'virtual/media-utils', '', d)}"
RDEPENDS_${PN}_remove = "${@bb.utils.contains('DISTRO_FEATURES', 'ipclient', 'audiocapturemgr', '', d)} "

EXTRA_OECONF_remove += " ${@bb.utils.contains("DISTRO_FEATURES", "ipclient", "${ENABLE_ACM} ${ENABLE_AC_RMF}", " ",d)}"

CFLAGS_remove = " ${@bb.utils.contains('DISTRO_FEATURES', 'ipclient', " ${@bb.utils.contains('RDEPENDS_${PN}',\
                    'virtual/media-utils', ' -I${STAGING_INCDIR}/media-utils/audioCapture', ' ', d)}", ' ',d)}"

do_install_append() {
    #remove audiocapturemgr service entry for ipclient from btmgr.service
    if ${@bb.utils.contains('DISTRO_FEATURES', 'ipclient', 'true', 'false', d)}; then
        sed -i 's/audiocapturemgr.service/ /g' ${D}${systemd_system_unitdir}/btmgr.service
    fi
}
