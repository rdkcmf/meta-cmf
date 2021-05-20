# Force bitbake to ensure libocispec has been compiled before compiling crun
# Fix random build failure due to race condition in Jenkins
PARALLEL_MAKE = ""
