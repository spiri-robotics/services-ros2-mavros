# ROS 2 Mavros

## Installation

1. Clone the repository.
```bash
git clone https://git.spirirobotics.com/Spiri/services-ros2-mavros.git
```

2. Bring up the container.
```bash
docker compose up --build
```

3. Subscribe to or echo the appropriate topics.

```bash
ros2 topic echo /spiri_mu_1/state
```

## Usage

### Launching
The `docker-compose.yaml` file can be used to configure the MAVROS node. The base command is as follows:

```bash
ros2 launch mavros apm.launch fcu_url:="udp://0.0.0.0:14560@:14555" namespace:="/spiri_mu_1" tgt_system:="1"
```

This is a list of available parameters through `apm.launch`

| Parameter      | Type    | Description                                        |
| -------------- | ------- | -------------------------------------------------- |
| fcu_url        | string  | A [Connection URL](https://github.com/mavlink/mavros/blob/ros2/mavros/README.md#connection-url) that defines the connection between MAVROS and the FCU. |
| gcs_url        | string  | A [Connection URL](https://github.com/mavlink/mavros/blob/ros2/mavros/README.md#connection-url) that defines how MAVROS forwards MAVLink telemetry to a GCS. |
| tgt_system     | int16   | The target system ID. Should be set to the same value as [SYSID_THISMAV](https://ardupilot.org/copter/docs/parameters-Copter-stable-V4.5.7.html#sysid-thismav-mavlink-system-id-of-this-vehicle). |
| tgt_component  | int16   | The target component ID. The default value of `1` refers to the autopilot. Should generally be left unchanged. |
| log_output     | string  | This option is [ignored](https://github.com/mavlink/mavros/issues/1926). No effect. |
| fcu_protocol   | string  | Specifies the MAVLink protocol version to communicate with the FCU. Default (and recommended) value is `v2.0`. |
| respawn_mavros | bool    | Whether the MAVROS node will automatically restart on crash. Default value is `false`. |
| namespace      | string  | Sets the ROS namespace for the MAVROS topics. |

### Plugins

The `apm.launch` launch file also takes into consideration:
  * A list of blacklisted (or whitelisted) plugins defined in [apm_pluginlists.yaml](https://git.spirirobotics.com/Spiri/services-ros2-mavros/src/branch/main/config/apm_pluginlists.yaml) 
  * The configuration settings for the enabled plugins defined in [apm_config.yaml](https://git.spirirobotics.com/Spiri/services-ros2-mavros/src/branch/main/config/apm_config.yaml)

## References

MAVROS docs can be found [here](https://github.com/mavlink/mavros/blob/ros2/mavros/README.md).

The base ROS 2 Jazzy image can be found [here](https://git.spirirobotics.com/Spiri/ros/src/branch/jazzy).