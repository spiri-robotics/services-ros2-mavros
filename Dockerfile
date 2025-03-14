FROM git.spirirobotics.com/spiri/ros:jazzy
ENV ROS_DISTRO=jazzy

# This is already a part of the base ros 2 jazzy image from spiri

# RUN apt-get update -y && apt-get install -y \ 
#     ros-${ROS_DISTRO}-mavros \
#     ros-${ROS_DISTRO}-mavros-extras \
#     ros-${ROS_DISTRO}-mavros-msgs \
#     ros-${ROS_DISTRO}-rmw-cyclonedds-cpp

# RUN apt-get clean

# RUN wget https://raw.githubusercontent.com/mavlink/mavros/ros2/mavros/scripts/install_geographiclib_datasets.sh
# RUN bash ./install_geographiclib_datasets.sh   

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

RUN /bin/bash -c "echo \"source /opt/ros/${ROS_DISTRO}/setup.bash\" >> ~/.bashrc"

COPY ./config/spiri_apm_pluginlists.yaml /opt/ros/${ROS_DISTRO}/share/mavros/launch/

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
