# Open3D 0.17.0 manylinux2014 build
This repo is for building open3d that can be run on ETHz's Euler server. It uses centos 7, which does not support manylinux_2_27, but only manylinux_2_17(or manylinux2014) or lower.

To build just simply run
```sh
bash install.sh
```
and the wheel is in ./Open3D-0.17.0/build/lib/python_package/pip_package/ folder
