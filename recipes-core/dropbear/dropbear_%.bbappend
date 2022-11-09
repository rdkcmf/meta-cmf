
# Adding telemetry to video and broadband.
# excluding camera and extender
DEPENDS += "telemetry"
DEPENDS_remove_camera = "telemetry"
DEPENDS_remove_extender = "telemetry"

LDFLAGS += "-ltelemetry_msgsender"
LDFLAGS_remove_camera = "-ltelemetry_msgsender"
LDFLAGS_remove_extender = "-ltelemetry_msgsender"

SRC_URI_remove_camera  = " file://ssh_telemetry_2017.patch"
SRC_URI_remove_extender  = " file://ssh_telemetry_2017.patch"

SRC_URI_remove_camera = " file://ssh_telemetry_2019.patch"
SRC_URI_remove_extender = " file://ssh_telemetry_2019.patch"
