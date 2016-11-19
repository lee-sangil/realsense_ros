cd $(WORKSPACE)/src
git clone https://github.com/intel-ros/realsense.git
git clone https://github.com/IntelRealSense/librealsense.git
git clone https://github.com/ktossell/libuvc.git

sudo apt-get install libv4l-dev

cd $(WORKSPACE)
catkin_make
