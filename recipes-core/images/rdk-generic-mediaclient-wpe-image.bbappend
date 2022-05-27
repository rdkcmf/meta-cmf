require add-non-root-user-group.inc

IMAGE_INSTALL_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'streamfs', 'streamfs streamfs-fcc', '', d)}"
