FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'disable-lxcgen-warnings','file://0001-convert-error-to-warning.patch','',d)} \
           ${@bb.utils.contains('DISTRO_FEATURES', 'disable-lxcgen-warnings','file://0001-switch-exceptions-to-warnings.diff','',d)} \
           ${@bb.utils.contains('DISTRO_FEATURES', 'disable-lxcgen-warnings','file://0001-capkeep-support.diff','',d)} \
"
