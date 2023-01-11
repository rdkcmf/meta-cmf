SRC_URI_remove = "git://github.com/rdkcentral/rbus.git;branch=rbus-2.0"

SRC_URI += "${CMF_GITHUB_ROOT}/rbus;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GITHUB_RBUS_BRANCH}"

SRCREV = "${AUTOREV}"
