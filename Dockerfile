FROM quay.io/pypa/manylinux2014_x86_64:latest
RUN yum install -y wget xorg-x11-server-devel libxcb-devel python-devel mesa-libGLU-devel glfw-devel
WORKDIR /root
