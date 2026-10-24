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
