# Gazebo Workshop --- Simulation Commands

This README contains the commands used during the Gazebo workshop for
launching a robot simulation, controlling the robot, and viewing ROS 2
data. It is written for **ROS 2 Humble with Gazebo Classic**.

## 1. Source ROS 2 and your workspace

Run these commands in every new terminal:

``` bash
source /opt/ros/humble/setup.bash
source ~/ros2_ws/install/setup.bash
```

If your workspace is in a different directory, replace `~/ros2_ws` with
its actual path.

## 2. Launch the Gazebo simulation

Use the launch command for the robot package used in the workshop. For
example, if you are using the RRBot demo:

``` bash
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_gazebo empty_world.launch.py
```
Instead of burger you have other option, waffle. try it out

Instead of empty_world, try out turtlebot3_world or turtlebot3_house

## 3. Control the bot

To initialize teleop 

``` bash
ros2 run turtlebot3_teleop teleop_keyboard
```
## 4. Lets See a Custom URDF

First open just gazebo

```bash
ros2 launch gazebo_ros gazebo.launch.py
```

Now the custom bot
```bash
ros2 run gazebo_ros spawn_entity.py \
  -entity simple_bot_colored \
  -file ~/ros2_ws/src/simple_bot_description/urdf/simple_bot.urdf \
  -x 0 -y 0 -z 0.15
```

## 5. What is TFtree

Open the hand

```bash 
ros2 launch ros2_control_demo_example_1 rrbot.launch.py
```
Check what are the controllers available

```bash
ros2 control list_controllers
```

Get the joint names and command interfaces
```bash
ros2 param get /forward_position_controller joints
ros2 param get /forward_position_controller interface_name
ros2 topic type /forward_position_controller/commands
```

Let's move 
```bash
ros2 topic pub --once \
  /forward_position_controller/commands \
  std_msgs/msg/Float64MultiArray \
  "{data: [0.5, -0.3]}"
```

To view the joint angles
```bash
ros2 topic echo /joint_states
```

To view the TFtree
```bash
ros2 run tf2_tools view_frames
```

To query the position and orientation of a link relative to the world frame
```bash
ros2 run tf2_ros tf2_echo world link1
ros2 run tf2_ros tf2_echo world link2
```

## 6. Now, the same for turtlebot

```bash
export TURTLEBOT3_MODEL=burger
ros2 launch turtlebot3_bringup rviz2.launch.py
```
<<<<<<< HEAD
=======

>>>>>>> 972f070 (updated with many stuffs)

