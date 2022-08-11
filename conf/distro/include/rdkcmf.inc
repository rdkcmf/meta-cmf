BBMASK .= "|meta-rdk/recipes-extended/jquery/"

MAINTAINER = "RDK CMF Team <support@rdkcentral.com>"

PREFERRED_VERSION_breakpad = "git"
PREFERRED_PROVIDER_curl ?= "curl"

# Revert meta-rdk/+/73763 RDKTV-17032: Build failure due to compiler out of memory
# It is causing race condition issues in build
PARALLEL_MAKE_remove = " -l ${@int(os.sysconf(os.sysconf_names['SC_NPROCESSORS_ONLN'])) * 150/100}"
