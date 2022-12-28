SRC_URI_remove = "git://github.com/rdkcentral/rtRemote;branch=release"
SRC_URI += "${CMF_GITHUB_ROOT}/rtRemote;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GITHUB_RELEASE_BRANCH}"

inherit coverity
