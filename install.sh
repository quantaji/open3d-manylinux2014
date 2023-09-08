# docker build scripts, yum install is very slow!
docker build --tag o3d-manylinux2014 -f Dockerfile .

# download open3d
wget https://github.com/isl-org/Open3D/archive/refs/tags/v0.17.0.zip
unzip v0.17.0.zip

docker run --name test -v ./Open3D-0.17.0:/root/Open3D --rm -it o3d-manylinux2014 bash build.sh

# the build wheel is in ./Open3D-0.17.0/build/lib/python_package/pip_package/
