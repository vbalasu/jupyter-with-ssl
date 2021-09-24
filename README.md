# Jupyter with SSL (over HTTPS)

You can generate SSL/TLS certificates using Letsencrypt's certbot, then use those certificates to secure your Jupyter installation.

There are 2 flavors of Jupyter installed:

1. Running directly on centos server at port 8888
2. Running in a docker container at port 8889

Both flavors are secured by SSL. 
You can access the docker version here: https://strata-jupyter.amer.trifacta.net:8889/lab

### 1. Direct installation on centos

Install Anaconda, then generate configuration file by using the following command:
`jupyter notebook --generate-config` OR `jupyter lab --generate-config`

Make changes to config file:
/home/centos/.jupyter/jupyter_notebook_config.py

changes are tracked in git repository on the server

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

