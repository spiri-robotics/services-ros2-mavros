#!/bin/bash

# Ensure the script exits if any command fails
set -e

export ROS_DISTRO=jazzy
# Set the RMW implementation to Cyclone DDS for ROS 2
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp 

# Source the setup.bash file
source /opt/ros/${ROS_DISTRO}/setup.bash

# Check if no arguments are provided
if [[ $# -eq 0 ]]; then
  echo "No arguments provided."
  exit 1
fi

# Pass all arguments to stdbuf and execute
echo "Running command: $@"
exec stdbuf -o L "$@"