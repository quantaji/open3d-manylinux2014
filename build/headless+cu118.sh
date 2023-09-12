# # choose your python version here:
# export PATH=/opt/python/cp36-cp36m/bin:$PATH
# export PATH=/opt/python/cp37-cp37m/bin:$PATH
# export PATH=/opt/python/cp38-cp38/bin:$PATH
# export PATH=/opt/python/cp39-cp39/bin:$PATH
export PATH=/opt/python/cp310-cp310/bin:$PATH
# export PATH=/opt/python/cp311-cp311/bin:$PATH
# export PATH=/opt/python/cp312-cp312/bin:$PATH

# add cuda
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH

# build
mkdir /root/build && cd /root/build
cmake \
    -D USE_SYSTEM_ASSIMP=OFF \
    -D USE_SYSTEM_BLAS=OFF \
    -D USE_SYSTEM_CURL=OFF \
    -D USE_SYSTEM_EIGEN3=OFF \
    -D USE_SYSTEM_FILAMENT=OFF \
    -D USE_SYSTEM_FMT=OFF \
    -D USE_SYSTEM_GLEW=OFF \
    -D USE_SYSTEM_GLFW=OFF \
    -D USE_SYSTEM_GOOGLETEST=OFF \
    -D USE_SYSTEM_IMGUI=OFF \
    -D USE_SYSTEM_JPEG=OFF \
    -D USE_SYSTEM_JSONCPP=OFF \
    -D USE_SYSTEM_LIBLZF=OFF \
    -D USE_SYSTEM_MSGPACK=OFF \
    -D USE_SYSTEM_NANOFLANN=OFF \
    -D USE_SYSTEM_OPENSSL=OFF \
    -D USE_SYSTEM_PNG=OFF \
    -D USE_SYSTEM_PYBIND11=OFF \
    -D USE_SYSTEM_QHULLCPP=OFF \
    -D USE_SYSTEM_TBB=OFF \
    -D USE_SYSTEM_TINYGLTF=OFF \
    -D USE_SYSTEM_VTK=OFF \
    -D USE_SYSTEM_ZEROMQ=OFF \
    -D BUILD_CUDA_MODULE=ON \
    -D GLIBCXX_USE_CXX11_ABI=OFF \
    -D BUILD_PYTORCH_OPS=OFF \
    -D BUILD_TENSORFLOW_OPS=OFF \
    -D BUNDLE_OPEN3D_ML=OFF \
    -D BUILD_FILAMENT_FROM_SOURCE=ON \
    -D ENABLE_HEADLESS_RENDERING=ON \
    -D BUILD_GUI=OFF \
    -D BUILD_EXAMPLES=ON \
    -D BUILD_JUPYTER_EXTENSION=OFF \
    -D BUILD_WEBRTC=OFF \
    -B /root/build /root/Open3D

make -j 4 # higher number may leads to segmentation faults, but is faster
make pip-package

# move to target folder
tgt_dir=/root/wheels/headless+cu118
mkdir -p $tgt_dir
mv /root/build/lib/python_package/pip_package/open3d*.whl $tgt_dir/
