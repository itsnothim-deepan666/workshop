#!/bin/bash
set -e


WS="${1:?Usage: ./setup.sh <workspace_name>}"


WS_PATH="$HOME/$WS"

echo "Setting up workspace: $WS_PATH"


sudo apt update
sudo apt install -y \
    ros-humble-gazebo-* \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup


mkdir -p "$WS_PATH/src"

cd "$WS_PATH/src"


rm -rf "$WS_PATH/build" "$WS_PATH/install" "$WS_PATH/log"


if [ ! -d workshop/.git ]; then
    git clone https://github.com/itsnothim-deepan666/workshop.git
fi


cd "$WS_PATH"
source /opt/ros/humble/setup.bash
colcon build --symlink-install


grep -qxF "source $WS_PATH/install/setup.bash" "$HOME/.bashrc" ||
    echo "source $WS_PATH/install/setup.bash" >> "$HOME/.bashrc"

grep -qxF "export ROS_DOMAIN_ID=30" "$HOME/.bashrc" ||
    echo "export ROS_DOMAIN_ID=30" >> "$HOME/.bashrc"

grep -qxF "source /usr/share/gazebo/setup.sh" "$HOME/.bashrc" ||
    echo "source /usr/share/gazebo/setup.sh" >> "$HOME/.bashrc"

grep -qxF "source /opt/ros/humble/setup.bash" "$HOME/.bashrc" ||
    echo "source /opt/ros/humble/setup.bash" >> "$HOME/.bashrc"

echo "Setup complete. Open a new terminal or run:"
echo "source \"$WS_PATH/install/setup.bash\""
