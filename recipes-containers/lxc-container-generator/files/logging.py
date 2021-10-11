################################################################################
#   class cLog(object):
#
#       Represents info for logging inside container
#
################################################################################
class cLog(object):
    def __init__(self, rootfs):
        self.rootfs = rootfs

    def createLoggingConf(self, logNode, userName):
        entry =""

        if logNode != None:
            enable = logNode.attrib["enable"]
            if (enable == "true"):
                entry += "\n# LXC bindings for Logging\n"

		path = logNode.find("LogPath")
                entry += "lxc.mount.entry = /%s %s none rw,bind,nodev,noexec 0 0\n"%(path.text, path.text)
                self.rootfs.makeDir( "%s/%s"%(self.rootfs.getPathRootfsHost(), path.text))

		fd = open(self.rootfs.getRootfsPath() + "/etc/containerLog.properties", 'a')
		fd.write("\n# " + self.rootfs.getSandboxName())
		fd.write("\n" + self.rootfs.getSandboxName() + "_logs=\"")
		for log in logNode.iter('Log'):
			if (log != None and log.text != None):
				fd.write(" ")
				fd.write(log.text)
		if (logNode.iter('Log') != None):
			fd.write(" \"")
		fd.write("\n" + self.rootfs.getSandboxName() + "_user=" + userName.text + "\n")
		fd.close()

            else:
		entry = "\n# Logging disabled\n"

	return entry




