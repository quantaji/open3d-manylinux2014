# the following code build osmesa and installs it in ${HOME}/osmesa folder
# to use it, you have to add osmesa's library to your LD_LIBRARY_PATH environment variables
# 

module purge
module load gcc/8.2.0 eth_proxy libxshmfence/1.3 freeglut/3.0.0 libxcb/1.12 glfw/3.3.4 llvm/6.0.0 # xcb-proto/1.12  mesa-glu/9.0.1
cd $SCRATCH
wget --no-verbose https://mesa.freedesktop.org/archive/mesa-19.0.8.tar.xz && tar xf mesa-19.0.8.tar.xz && cd mesa-19.0.8
LLVM_CONFIG=$(which llvm-config) ./configure \
    --prefix=$HOME/osmesa \
    --disable-osmesa \
    --disable-driglx-direct \
    --disable-gbm \
    --enable-dri \
    --with-gallium-drivers=swrast \
    --enable-autotools \
    --disable-llvm \
    --enable-gallium-osmesa
make -j2
make install
cd $SCRATCH && rm -rf mesa-19.0.8.tar.xz mesa-19.0.8
