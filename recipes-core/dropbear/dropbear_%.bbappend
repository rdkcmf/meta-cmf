
# Adding telemetry to video, broadband, and camera.
# excluding extender
DEPENDS += "telemetry"
DEPENDS_remove_extender = "telemetry"

LDFLAGS += "-ltelemetry_msgsender"
LDFLAGS_remove_extender = "-ltelemetry_msgsender"

SRC_URI_remove_extender  = " file://ssh_telemetry_2017.patch"
SRC_URI_remove_extender = " file://ssh_telemetry_2019.patch"
