FROM ghcr.io/spiri-robotics/ros:jazzy
ENV ROS_DISTRO=jazzy

ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

COPY ./config/apm_pluginlists.yaml /opt/ros/${ROS_DISTRO}/share/mavros/launch/
COPY ./config/apm_config.yaml /opt/ros/${ROS_DISTRO}/share/mavros/launch/

RUN /bin/bash -c "echo \"source /opt/ros/${ROS_DISTRO}/setup.bash\" >> ~/.bashrc"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
