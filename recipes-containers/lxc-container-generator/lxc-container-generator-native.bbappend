FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRCREV = "2dca2f9699628adad1e4dd8b98cff82f551a3eed"
SRC_URI += " \
        file://logging.py \
        file://framework_mod.patch \
        file://capkeep_capability_support.patch \
        file://0001-Converted-Error-to-Warning.patch \
        file://daisy_lxc_support.patch \
        file://0001-Multiple-LxcInclude-Nodes-fix.patch \
        file://0001-config-Add-dunfell-yocto-3.1-to-supported-releases.patch \
"
do_install_append() {
        install -m 755 ${WORKDIR}/logging.py ${D}${datadir}/${BPN}/src/lib/
}
