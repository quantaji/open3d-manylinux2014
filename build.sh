export PATH=/opt/python/cp310-cp310/bin:$PATH

cd /root/Open3D
mkdir build
cd build
cmake -DBUILD_EXAMPLES=OFF -DBUILD_FILAMENT_FROM_SOURCE=ON -DBUILD_GUI=OFF -DUSE_SYSTEM_GLFW=ON -DBUILD_WEBRTC=OFF ..
make -j4
make pip-package
