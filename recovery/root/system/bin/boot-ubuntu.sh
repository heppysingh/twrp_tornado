#!/system/bin/sh

# Core binary paths
DROIDSPACES_BINARY_PATH=/system/bin/droidspaces
RECOVERY_CONSOLE_PATH=/system/bin/recovery-console

# Container properties
CONTAINER_NAME="Ubuntu 24.04"
CONTAINER_HOSTNAME=ubuntu
DS_FLAGS="--hw-access --privileged=full -B /tmp:/recovery --foreground"

# Rootfs path. Accepts only .img files or raw
# block devices like /dev/block/* (SD cards, partitions).
# If you want to use a directory-based rootfs, simply change
# -i ${ROOTFS_PATH} to -r ${ROOTFS_PATH} in the main command.
ROOTFS_PATH=/dev/block/by-name/super

# Main execution
exec ${RECOVERY_CONSOLE_PATH} \
    --exec "${DROIDSPACES_BINARY_PATH} -i ${ROOTFS_PATH} -n \"${CONTAINER_NAME}\" -h \"${CONTAINER_HOSTNAME}\" ${DS_FLAGS} start"
