docker run -p 8888:8888 -v work:/home/jovyan/work \
  -v keys:/keys -v jupyter_notebook_config.py:/home/jovyan/.jupyter/jupyter_notebook_config.py \
  jupyter/scipy-notebook:latest
