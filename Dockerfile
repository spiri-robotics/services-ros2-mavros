FROM ros:jazzy-ros-core

ENV ROS_DISTRO=jazzy

RUN apt-get update -y
RUN apt-get install -y ros-${ROS_DISTRO}-mavros \
    ros-${ROS_DISTRO}-mavros-extras \
    ros-${ROS_DISTRO}-mavros-msgs \
    ros-${ROS_DISTRO}-rmw-cyclonedds-cpp

RUN wget https://raw.githubusercontent.com/mavlink/mavros/ros2/mavros/scripts/install_geographiclib_datasets.sh
RUN bash ./install_geographiclib_datasets.sh   

RUN apt-get clean


COPY ./ros_entrypoint.sh /ros_entrypoint.sh

COPY ./config/px4_pluginlists.yaml /opt/ros/${ROS_DISTRO}/share/mavros/launch/
COPY ./config/px4_config.yaml /opt/ros/${ROS_DISTRO}/share/mavros/launch/


RUN chmod +x ./ros_entrypoint.sh
HEALTHCHECK --interval=60s --timeout=5s --retries=3 CMD /ros_entrypoint.sh ros2 topic list