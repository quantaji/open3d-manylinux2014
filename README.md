# Open3D 0.17.0 manylinux2014 build
This repo is for building open3d that can be run on ETHz's Euler server. It uses centos 7, which does not support manylinux_2_27, but only manylinux_2_17(or manylinux2014) or lower. I am not a specialist in computer science, so I can be wrong.

## Building Wheels

### 1. build the targeted docker

You have to build the following docker image and compile the open3d in this image. The later image is capable of compiling previous' job, but the image takes longer to build.

```sh
# cpu-only
docker build --tag open3d-cpu-manylinux2014 -f docker/open3d-cpu.dockerfile .
# cu118
docker build --tag open3d-cu118-manylinux2014 -f docker/open3d-cu118.dockerfile .
```


### 2. download open3d 
There are bugs in current cmake, so it cannot recognize python, we have to modifiy the CMakeList.txt a little bit. Run the following code outside docker, and download open3d
```sh
## download and extract
wget https://github.com/isl-org/Open3D/archive/refs/tags/v0.17.0.zip && unzip v0.17.0.zip && rm v0.17.0.zip
## mod
sed -i 's/Python3_FOUND/True/g' ./Open3D-0.17.0/CMakeLists.txt
mkdir -p ./wheels
```

### 3. Build Open3d
Minimal (remember to choose the python version in `./build/minimal.sh`):
```sh
# minimal
docker run --rm -it -v ./Open3D-0.17.0:/root/Open3D  -v ./build/minimal.sh:/root/build.sh  -v ./wheels:/root/wheels open3d-cpu-manylinux2014 bash /root/build.sh
# headless
docker run --rm -it -v ./Open3D-0.17.0:/root/Open3D  -v ./build/headless.sh:/root/build.sh  -v ./wheels:/root/wheels open3d-cpu-manylinux2014 bash /root/build.sh
```



## Use open3d wheels on Euler
If you don't need headless rendering, just install the minimal version, and it should work. Otherwise, you have to compile osmesa library on Euler. The compiling scripts is in `./osmesa_euler_build_install.sh`, it installs osmesa in `${HOME}/osmesa`. Before using the open3d, you have to add osmesa lib into `LD_LIBRARY_PATH`:
```sh
export LD_LIBRARY_PATH=${HOME}/osmesa/lib:$LD_LIBRARY_PATH
```
