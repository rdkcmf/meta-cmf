#-------------------------------------------------------------------------------
# Remove unused system users
#-------------------------------------------------------------------------------
EXTRA_USERS_PARAMS += "\
"

#-------------------------------------------------------------------------------
# Remove unused system groups
#-------------------------------------------------------------------------------
EXTRA_USERS_PARAMS += "\
"

#-------------------------------------------------------------------------------
# Common groups
#-------------------------------------------------------------------------------
EXTRA_USERS_PARAMS += "\
    groupadd -g 501 lxcgrp        ; \
"

#-------------------------------------------------------------------------------
# Common users and groups for OENMW
# For each user also the group with the same name and id is created.
#-------------------------------------------------------------------------------
EXTRA_USERS_PARAMS += "\
    useradd -u 704 -G lxcgrp,input,disk,kmem                              -r -s /bin/false xre; \
    useradd -u 703 -G lxcgrp                              -r -s /bin/false netflix; \
"

#-------------------------------------------------------------------------------
# XRE
#-------------------------------------------------------------------------------
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /lib/rdk/launch_rdkbrowser2_server.sh       \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /usr/bin/rdkbrowser2                        \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m o-rwx             /usr/bin/WPEWebProcess                      \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m o-rwx             /usr/bin/WPENetworkProcess                  \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m o-rwx             /usr/bin/WPEStorageProcess                  \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m o-rx              /home/root/Receiver                         \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /lib/rdk/startWPE                           \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /lib/rdk/runXRE                             \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /home/root/xrelog.xml                       \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /home/root/waylandregistryreceiver.conf     \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /lib/rdk/launch_ttsengine.sh                \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /usr/bin/TTSEngine                          \n"
ROOTFS_CHOWN_SETCAP += "   -o xre:xre -m u+rwx,g+rx,o-rwx  /usr/bin/WPEFramework-1.0.0                 \n"

# WPEProcess can be launched from inside the container (Netflix plugin for example), it needs to be in lxcgrp group.
ROOTFS_CHOWN_SETCAP += "   -o xre:lxcgrp -m u+rwx,g+rx,o-rwx  /usr/bin/WPEProcess-1.0.0                \n"

#-------------------------------------------------------------------------------
# NETFLIX
#-------------------------------------------------------------------------------
#Since netflix files are accessed by XRE inside the XRE container, we need to have lxcgrp permissions for netflix files to allow XRE to have access - DELIA-41066
ROOTFS_CHOWN_SETCAP += "   -o netflix:lxcgrp -m o-rwx,a-w  /usr/bin/nrdPluginApp       \n"
ROOTFS_CHOWN_SETCAP += "   -o netflix:lxcgrp -m o-rwx,a-w  /usr/bin/shmSave		\n"
ROOTFS_CHOWN_SETCAP += "   -o netflix:lxcgrp -m o-rwx,a-w  /usr/bin/shmRestore		\n"
ROOTFS_CHOWN_SETCAP += "   -o netflix:lxcgrp -m o-rwx,a-w  /lib/rdk/lxc-execute-netflix.sh \n"
ROOTFS_CHOWN_SETCAP += "   -o netflix:lxcgrp -m o-rwx,a-w  /lib/rdk/lxc-start-netflix.sh \n"
ROOTFS_CHOWN_SETCAP += "   -o netflix:lxcgrp -m o-rwx,a-w  /lib/rdk/lxc-stop-netflix.sh \n"
