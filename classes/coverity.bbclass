# Run after recipe parsing and give make override global scope.
python __anonymous() {
    coverity_dir=d.getVar('COVERITY_DIR', True)
    component=d.getVar('PN', True)
    if d.getVar('COVERITY_REQUIRED', True) == "1":
        if d.getVar('COVERITY_COMPONENT_NAME', True) == component:
            d.setVar('MAKE', '${COVERITY_PATH}/cov-build --config ${COVERITY_CONFIG} --dir ${TOPDIR}/../build-images/${COVERITY_COMPONENT_NAME} make')
}

do_compile_prepend () {
    COVERITY_REQUIRED="${@d.getVar('COVERITY_REQUIRED', True)}"
    if [ "${COVERITY_REQUIRED}" = "1" ] ;then
        COVERITY_COMPONENT_NAME="${@d.getVar('COVERITY_COMPONENT_NAME', True)}"
        if [ "${COVERITY_COMPONENT_NAME}" = "${PN}" ]; then
            COVERITY_CONFIG="${@d.getVar('COVERITY_CONFIG', True)}"
            COVERITY_PATH="${@d.getVar('COVERITY_PATH', True)}"
            compiler_value=`echo ${CC} | cut -f1 -d " "`
            ${COVERITY_PATH}/cov-configure --template --compiler $compiler_value
            export MAKE='${COVERITY_PATH}/cov-build --config ${COVERITY_CONFIG} --dir ${TOPDIR}/../build-images/${COVERITY_COMPONENT_NAME} make'
        fi
    fi
}
