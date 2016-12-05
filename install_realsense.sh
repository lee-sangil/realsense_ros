cd $WORKSPACE/src
git clone https://github.com/intel-ros/realsense.git
git clone https://github.com/IntelRealSense/librealsense.git
git clone https://github.com/ktossell/libuvc.git

sudo apt-get install libv4l-dev

# https://github.com/intel-ros/realsense/issues/12 - begin
sudo apt-get install libusb-1.0-0-dev
sudo apt-get install libssl-dev

cd librealsense

./scripts/install_glfw3.sh
./scripts/install_dependencies-4.4.sh
# ./scripts/patch-uvcvideo-4.4.sh v4.4-wily

sudo modprobe uvcvideo

sudo cp config/99-realsense-libusb.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules && udevadm trigger

mkdir build && cd build
cmake ..
make && sudo make install

cd ..
sudo cp -r include/librealsense /usr/local/include
# https://github.com/intel-ros/realsense/issues/12 - end

cd $WORKSPACE
catkin_make
