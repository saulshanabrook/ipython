FROM buildpack-deps:jessie

RUN apt-get update
RUN apt-get -y install python-scipy python-pip python-matplotlib python-pandas ipython-notebook

RUN mkdir -p /app/
WORKDIR /app/
ADD requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt


RUN mkdir -p notebooks
WORKDIR /notebooks/
CMD ipython notebook --no-browser --port 8888 --ip=* --debug --ipython-dir /notebooks
