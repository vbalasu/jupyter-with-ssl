# Running on outside port 8889 
docker run -d -p 8889:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -e GRANT_SUDO=yes \
  -e CHOWN_EXTRA="/keys" \
  -v /home/centos/jupyter/work:/home/jovyan \
  -v /home/centos/jupyter/keys:/keys \
  jupyter/datascience-notebook:latest
