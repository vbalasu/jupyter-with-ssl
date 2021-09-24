# README

There are 2 flavors of Jupyter installed:

1. Running directly on centos server at port 8888
2. Running in a docker container at port 8889

Both flavors are secured by SSL

### 1. Direct installation on centos

Made changes to config file:
/home/centos/.jupyter/jupyter_notebook_config.py

changes are tracked in git repository

### 2. Docker container - jupyter/datascience-notebook:latest

[Docker configuration help](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html)

Once the container has started (start_jupyter_docker.sh), go into the container and edit ~/.jupyter/jupyter_lab_config.py

Use the following settings:

First generate a password by running the following command in ipython:

```
from jupyter_server.auth import passwd; passwd()
```

Then set the value:

c.ServerApp.password = 'PASSWORD_GENERATED_IN_PREVIOUS_STEP'

Set the keyfile and certfile to point to the mounted volume:

c.ServerApp.keyfile = '/keys/privkey.pem'

c.ServerApp.certfile = '/keys/fullchain.pem'

