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

Use Ubuntu for best results. Avoid Amazon Linux

On Ubuntu, install nginx and certbot
Generate TLS certificates for your site using certbot, and ensure that you are able to reach nginx on https.

[Docker configuration help](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html)

Copy the cert file (fullchain.pem) and key file (privkey.pem) to the `keys` directory. Create a blank `work` directory.

Once the container has started (start_jupyter_docker.sh), go into the container and generate a jupyter lab config file.

```
jupyter lab --generate-config
```

then edit ~/.jupyter/jupyter_lab_config.py

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

Now find and kill the jupyter-lab process
```
ps aux |grep jupyter
kill {PROCESS_ID}
```
this will stop the container. Restart the container
```
docker ps -a
docker start {CONTAINER_ID}
```

Keep in mind that curl localhost:8889 will now fail. You must access Jupyter by using https and entering the password.